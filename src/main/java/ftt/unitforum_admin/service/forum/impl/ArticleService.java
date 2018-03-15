package ftt.unitforum_admin.service.forum.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ftt.unitforum_admin.dao.unitforum.IUnitforumArticleDao;
import ftt.unitforum_admin.service.forum.IArticleService;
import ftt.unitforum_admin.types.UnitforumArticle;

@Service
public class ArticleService implements IArticleService {
	@Autowired
	private IUnitforumArticleDao articleDao;
	
	@Override
	public List<UnitforumArticle> getList(int masterIdx, String langCode, String class1Code, String class2Code, Date startDt, Date endDt, String nickname) {
		return articleDao.queryList(masterIdx, langCode, class1Code, class2Code, startDt, endDt, nickname);
	}
	
	@Override
	public boolean addInfo(int articleIdx) {
		return articleDao.insertInfo(articleIdx) > 0 ? true : false;
	}
	
	@Override
	public boolean removeInfo(int articleIdx) {
		return articleDao.deleteInfo(articleIdx) > 0 ? true : false;
	}
}
