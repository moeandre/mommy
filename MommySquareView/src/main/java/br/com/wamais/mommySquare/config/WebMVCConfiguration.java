package br.com.wamais.mommySquare.config;

import java.nio.charset.Charset;
import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.jmx.export.annotation.AnnotationMBeanExporter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "br.com.wamais.mommySquare")
public class WebMVCConfiguration extends WebMvcConfigurerAdapter {

	@Bean
	public AnnotationMBeanExporter annotationMBeanExporter() {

		return new AnnotationMBeanExporter();
	}

	@Bean
	public CommonsMultipartResolver multipartResolver() {

		final CommonsMultipartResolver cmr = new CommonsMultipartResolver();
		cmr.setMaxUploadSize(10485760);// 10MB
		cmr.setDefaultEncoding("UTF-8");
		cmr.setMaxInMemorySize(5242880);
		return cmr;
	}

	@Bean
	public InternalResourceViewResolver getViewResolver() {

		final InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}

	@Bean
	public StringHttpMessageConverter stringHttpMessageConverter() {

		return new StringHttpMessageConverter(Charset.forName("UTF-8"));
	}

	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {

		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/").setCachePeriod(31556926);
	}

	@Bean
	public PropertyPlaceholderConfigurer getPropertyPlaceholderConfigurer() {

		final PropertyPlaceholderConfigurer ppc = new PropertyPlaceholderConfigurer();
		ppc.setLocation(new ClassPathResource("application.properties"));
		ppc.setIgnoreUnresolvablePlaceholders(false);
		return ppc;
	}

	@Bean(name = AbstractApplicationContext.MESSAGE_SOURCE_BEAN_NAME)
	// Nice: no hardcoded name.
	public MessageSource messageSource() {

		final ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
		messageSource.setBasename("messages"); // Our i18n translations are in
		// messages.properties,
		// messages_nl.properties, ...
		return messageSource;
	}

	@Override
	public void configureDefaultServletHandling(final DefaultServletHandlerConfigurer configurer) {

		configurer.enable();
	}

	@Bean
	public SimpleMappingExceptionResolver exceptionResolver() {

		final SimpleMappingExceptionResolver exceptionResolver = new SimpleMappingExceptionResolver();

		final Properties exceptionMappings = new Properties();

		exceptionMappings.put("br.com.wamais.mommySquare.exception.UsuarioNaoEncontradoException", "forward:/403");
		exceptionMappings.put("java.lang.Exception", "redirect:/500");
		exceptionMappings.put("java.lang.RuntimeException", "redirect:/500");

		exceptionResolver.setExceptionMappings(exceptionMappings);

		final Properties statusCodes = new Properties();

		statusCodes.put("forward:/403", "403");
		statusCodes.put("forward:/500", "500");

		exceptionResolver.setStatusCodes(statusCodes);

		return exceptionResolver;
	}

	@Override
	public void configureMessageConverters(final List<HttpMessageConverter<?>> converters) {

		final MappingJackson2HttpMessageConverter jacksonMessageConverter = new MappingJackson2HttpMessageConverter();
		final ObjectMapper objectMapper = jacksonMessageConverter.getObjectMapper();

		objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, true);

		converters.add(jacksonMessageConverter);
	}

}
