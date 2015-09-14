package br.com.wamais.mommySquare.config;

import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.hibernate.ejb.HibernatePersistence;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.cache.ehcache.EhCacheManagerFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.Database;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.AnnotationTransactionAttributeSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.interceptor.TransactionAttributeSource;
import org.springframework.transaction.interceptor.TransactionInterceptor;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableCaching
@EnableTransactionManagement
@EnableJpaRepositories("br.com.wamais.mommySquare")
public class PersistenceConfig{

	private final Logger logger = LoggerFactory.getLogger(PersistenceConfig.class);

	@Value("${jdbc.driverClassName}")
	private String driverClassName;

	@Value("${jdbc.url}")
	private String url;

	@Value("${jdbc.username}")
	private String username;

	@Value("${jdbc.password}")
	private String password;

	@Value("${hibernate.dialect}")
	private String hibernateDialect;

	@Value("${hibernate.show_sql}")
	private String hibernateShowSql;

	@Value("${hibernate.hbm2ddl.auto}")
	private String hibernateHbm2ddlAuto;

	private final String[] packagesToScan = new String[] { "br.com.wamais.mommySquare" };

	@Bean
	public DataSource dataSource() {

		final ComboPooledDataSource ds = new ComboPooledDataSource();
		try {
			ds.setDriverClass(this.driverClassName);
			ds.setUser(this.username);
			ds.setPassword(this.password);
			ds.setJdbcUrl(this.url);
			ds.setMinPoolSize(10);
			ds.setMaxPoolSize(100);
			ds.setAcquireIncrement(3);
			ds.setMaxStatements(0);
			ds.setAcquireRetryAttempts(30);
			ds.setAcquireRetryDelay(1000);// 1S
			ds.setBreakAfterAcquireFailure(false);
			ds.setMaxIdleTime(180);// 3MIN
			ds.setMaxConnectionAge(10);// 1H
			ds.setCheckoutTimeout(5000);// 5S
			ds.setIdleConnectionTestPeriod(60);
			ds.setTestConnectionOnCheckin(true);
			ds.setPreferredTestQuery("SELECT 1+1");
		} catch (final PropertyVetoException e) {
			this.logger.error(e.getMessage());
		}
		return ds;
	}
	
	@Bean
	public TransactionAttributeSource annotationTransactionAttributeSource() {

		return new AnnotationTransactionAttributeSource();
	}

	@Bean
	public TransactionInterceptor transactionInterceptor() {

		final TransactionInterceptor interceptor = new TransactionInterceptor(this.transactionManager(), this.annotationTransactionAttributeSource());
		interceptor.setTransactionManager(this.transactionManager());
		return interceptor;
	}

	@Bean
	public LocalSessionFactoryBean sessionFactoryBean() {

		final LocalSessionFactoryBean result = new LocalSessionFactoryBean();
		result.setDataSource(this.dataSource());
		result.setPackagesToScan(this.packagesToScan);
		result.setHibernateProperties(this.hibernateProperties());
		return result;
	}

	@Bean
	public EntityManagerFactory entityManagerFactory() {

		final LocalContainerEntityManagerFactoryBean entityManagerFactory = new LocalContainerEntityManagerFactoryBean();
		entityManagerFactory.setDataSource(this.dataSource());
		entityManagerFactory.setPackagesToScan(this.packagesToScan);
		entityManagerFactory.setPersistenceUnitName("mommyPU");

		final HibernatePersistence hibernatePersistence = new HibernatePersistence();
		hibernatePersistence.createEntityManagerFactory("mommyPU", this.hibernateProperties());
		entityManagerFactory.setPersistenceProvider(hibernatePersistence);
		entityManagerFactory.setJpaProperties(this.hibernateProperties());
		entityManagerFactory.afterPropertiesSet();
		entityManagerFactory.setJtaDataSource(this.dataSource());

		final HibernateJpaVendorAdapter jpaVendorAdapter = new HibernateJpaVendorAdapter();
		jpaVendorAdapter.setDatabase(Database.MYSQL);
		entityManagerFactory.setJpaVendorAdapter(jpaVendorAdapter);
		return entityManagerFactory.getObject();
	}

	@Bean
	public SessionFactory sessionFactory() {

		return this.sessionFactoryBean().getObject();
	}

	@Bean
	JpaTransactionManager transactionManager() {

		final JpaTransactionManager transactionManager = new JpaTransactionManager();
		transactionManager.setDataSource(this.dataSource());
		transactionManager.setEntityManagerFactory(this.entityManagerFactory());
		return transactionManager;
	}

	@Bean
	public Properties hibernateProperties() {

		final Properties properties = new Properties();
		
		logger.debug(hibernateDialect);

		properties.put("hibernate.dialect", this.hibernateDialect);
		properties.put("hibernate.show_sql", this.hibernateShowSql);
		properties.put("hibernate.hbm2ddl.auto", this.hibernateHbm2ddlAuto);
		properties.put("hibernate.show_sql", true);
		properties.put("hibernate.cache.use_second_level_cache", true);
		return properties;
	}

	@Bean
	public CacheManager cacheManager() {

		return new EhCacheCacheManager(this.ehCacheCacheManager().getObject());
	}

	@Bean
	public EhCacheManagerFactoryBean ehCacheCacheManager() {

		final EhCacheManagerFactoryBean cmfb = new EhCacheManagerFactoryBean();
		cmfb.setConfigLocation(new ClassPathResource("ehcache.xml"));
		cmfb.setShared(true);
		return cmfb;
	}


}
