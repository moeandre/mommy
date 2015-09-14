package br.com.wamais.mommySquare.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.core.annotation.Order;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

@Order(1)
public class ApplicationInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {

		return new Class<?>[] { RootConfiguration.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {

		return new Class<?>[] { WebMVCConfiguration.class };
	}

	@Override
	protected String[] getServletMappings() {

		return new String[] { "/" };
	}

	@Override
	protected void customizeRegistration(final ServletRegistration.Dynamic registration) {

		registration.setInitParameter("dispatchOptionsRequest", "true");
	}

	@Override
	public void onStartup(final ServletContext servletContext) throws ServletException {

		servletContext.setInitParameter("spring.profiles.active", "persist-emb");
		servletContext.setInitParameter("spring.profiles.active", "persist-pg");
		super.onStartup(servletContext);
	}

}
