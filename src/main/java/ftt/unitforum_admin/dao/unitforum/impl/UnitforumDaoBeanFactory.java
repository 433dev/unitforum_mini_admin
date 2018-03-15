package ftt.unitforum_admin.dao.unitforum.impl;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import ftt.unitforum_admin.dao.unitforum.IUnitforumArticleDao;
import ftt.unitforum_admin.dao.unitforum.IUnitforumArticleHistoryDao;
import ftt.unitforum_admin.dao.unitforum.IUnitforumLogDao;
import ftt.unitforum_admin.dao.unitforum.IUnitforumMainUnitDao;
import ftt.unitforum_admin.dao.unitforum.IUnitforumMasterDao;
import ftt.unitforum_admin.dao.unitforum.IUnitforumSubUnitDao;
import ftt.unitforum_admin.dao.unitforum.IUnitforumWorldDao;

@Configuration
public class UnitforumDaoBeanFactory {
	@Autowired
	private DataSource ds;

	@Bean(destroyMethod = "clearCache")
	public SqlSessionTemplate unitforumSessionTemplate() {
		try {
			Resource[] resources = new Resource[] { 
					new ClassPathResource("sql/unitforumArticle.xml"),
					new ClassPathResource("sql/unitforumArticleHistory.xml"),
					new ClassPathResource("sql/unitforumMaster.xml"),
					new ClassPathResource("sql/unitforumWorld.xml"),
					new ClassPathResource("sql/unitforumMainUnit.xml"),
					new ClassPathResource("sql/unitforumSubUnit.xml"),
					new ClassPathResource("sql/unitforumLog.xml"),};

			SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
			sqlSessionFactory.setDataSource(ds);
			sqlSessionFactory.setMapperLocations(resources);

			return new SqlSessionTemplate(sqlSessionFactory.getObject());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return null;
	}

	@Bean
	public IUnitforumArticleDao unitforumArticleDao() {
		SqlSessionTemplate sessionTemplate = unitforumSessionTemplate();
		return sessionTemplate.getMapper(IUnitforumArticleDao.class);
	}
	
	@Bean
	public IUnitforumArticleHistoryDao unitforumArticleHistoryDao() {
		SqlSessionTemplate sessionTemplate = unitforumSessionTemplate();
		return sessionTemplate.getMapper(IUnitforumArticleHistoryDao.class);
	}

	@Bean
	public IUnitforumMasterDao unitforumMasterDao() {
		SqlSessionTemplate sessionTemplate = unitforumSessionTemplate();
		return sessionTemplate.getMapper(IUnitforumMasterDao.class);
	}
	
	@Bean
	public IUnitforumWorldDao unitforumWorldDao() {
		SqlSessionTemplate sessionTemplate = unitforumSessionTemplate();
		return sessionTemplate.getMapper(IUnitforumWorldDao.class);
	}
	
	@Bean
	public IUnitforumMainUnitDao unitforumMainUnitDao() {
		SqlSessionTemplate sessionTemplate = unitforumSessionTemplate();
		return sessionTemplate.getMapper(IUnitforumMainUnitDao.class);
	}
	
	@Bean
	public IUnitforumSubUnitDao unitforumSubUnitDao() {
		SqlSessionTemplate sessionTemplate = unitforumSessionTemplate();
		return sessionTemplate.getMapper(IUnitforumSubUnitDao.class);
	}
	
	@Bean
	public IUnitforumLogDao unitforumLogDao() {
		SqlSessionTemplate sessionTemplate = unitforumSessionTemplate();
		return sessionTemplate.getMapper(IUnitforumLogDao.class);
	}
}
