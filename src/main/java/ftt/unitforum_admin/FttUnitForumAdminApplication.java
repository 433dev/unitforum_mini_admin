package ftt.unitforum_admin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan(basePackages = { "ftt.unitforum_admin" })
@EnableAutoConfiguration // (exclude={DataSourceAutoConfiguration.class})
public class FttUnitForumAdminApplication {
	public static void main(String[] args) throws Exception {
		SpringApplication.run(FttUnitForumAdminApplication.class, args);
	}
}
