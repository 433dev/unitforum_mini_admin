package ftt.unitforum_admin.config;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix = "application")
public class AppConfig {
	private Map<String, DataSourceConfig> datasource = new HashMap<String, DataSourceConfig>();
	private String gameName;
	private String environment;
	private String staticResource;
	private String messageResource;
	private String localeParam;
	private List<String[]> language;
	
	@PostConstruct
	private void init() {
	}

	public Map<String, DataSourceConfig> getDatasource() {
		return datasource;
	}
	
	public String getGameName() {
		return gameName;
	}

	public void setGameName(String gameName) {
		this.gameName = gameName;
	}
	
	public String getEnvironment() {
		return environment;
	}

	public void setEnvironment(String environment) {
		this.environment = environment;
	}

	public String getStaticResource() {
		return staticResource;
	}

	public void setStaticResource(String staticResource) {
		this.staticResource = staticResource;
	}

	public String getMessageResource() {
		return messageResource;
	}

	public void setMessageResource(String messageResource) {
		this.messageResource = messageResource;
	}

	public String getLocaleParam() {
		return localeParam;
	}

	public void setLocaleParam(String localeParam) {
		this.localeParam = localeParam;
	}

	public List<String[]> getLanguage() {
		return language;
	}

	public void setLanguage(List<String[]> language) {
		this.language = language;
	}
}
