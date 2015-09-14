package br.com.wamais.mommySquare.config;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;

import br.com.wamais.mommySquare.util.VelocityMerger;

@Configuration
public class MailConfiguration {

	@Value("${mail.protocol}")
	private String protocol;
	
	@Value("${mail.host}")
	private String host;
	
	@Value("${mail.port}")
	private int port;
	
	@Value("${mail.smtp.auth}")
	private boolean auth;
	
	@Value("${mail.smtp.starttls.enable}")
	private boolean starttls;


	@Bean
	public JavaMailSender mailSender() {

		final JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		final Properties mailProperties = new Properties();
		mailProperties.put("mail.smtp.auth", this.auth);
		mailProperties.put("mail.smtp.starttls.enable", this.starttls);
		mailSender.setJavaMailProperties(mailProperties);
		mailSender.setHost(this.host);
		mailSender.setPort(this.port);
		mailSender.setProtocol(this.protocol);
		return mailSender;
	}
	

	@Bean
	public VelocityEngineFactoryBean velocityEngine() {

		final VelocityEngineFactoryBean velocityEngine = new VelocityEngineFactoryBean();
		final Properties velocityProperties = new Properties();
		velocityProperties.put("resource.loader", "class");
		velocityProperties.put("class.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
		velocityEngine.setVelocityProperties(velocityProperties);
		
		return velocityEngine;
	}
	
	@Bean
	public VelocityMerger velocityMerger() {

		final VelocityMerger velocityMerger = new VelocityMerger();
		velocityMerger.setEngine(this.velocityEngine().getObject());
		velocityMerger.setToolBoxConfigLocation(new ClassPathResource("velocity-tools.xml"));
		return velocityMerger;
	}
	
	
}