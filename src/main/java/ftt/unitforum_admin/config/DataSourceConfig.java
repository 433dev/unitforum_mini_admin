package ftt.unitforum_admin.config;

import javax.sql.DataSource;

import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

@Configuration
public class DataSourceConfig {
	@Bean
	@Primary
	@ConfigurationProperties(prefix="datasource.unitforum")
	public DataSource noticeDataSource() {
		return DataSourceBuilder.create().build();
	}
}
