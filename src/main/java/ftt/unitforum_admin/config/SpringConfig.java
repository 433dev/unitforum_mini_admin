package ftt.unitforum_admin.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import ftt.unitforum_admin.controller.interceptor.LanguageInterceptor;


@Configuration
public class SpringConfig extends WebMvcConfigurerAdapter {

	@Autowired
	private AppConfig appConfig;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		LanguageInterceptor languageInterceptor = new LanguageInterceptor();
		registry.addInterceptor(languageInterceptor);
	}
	
	@Bean
    public MessageSource messageSource() {
        
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setCacheSeconds(600);
        messageSource.setBasename(appConfig.getMessageResource());
        messageSource.setDefaultEncoding("UTF-8");
        
        return messageSource;
    }
	
	@Bean
	public LocaleResolver localeResolver() {
		
		SessionLocaleResolver sessionLocaleResolver = new SessionLocaleResolver();
		// default language = en
		sessionLocaleResolver.setDefaultLocale(StringUtils.parseLocaleString("en"));
		
		return sessionLocaleResolver;
	}
	
	@Bean
    public ViewResolver getViewResolver() {
		
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/jsp/");
        resolver.setSuffix(".jsp");
        return resolver;
    }
}
