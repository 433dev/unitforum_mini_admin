package ftt.unitforum_admin.service.forum.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ftt.unitforum_admin.dao.unitforum.IUnitforumArticleHistoryDao;
import ftt.unitforum_admin.service.forum.IArticleHistoryService;
import ftt.unitforum_admin.types.UnitforumArticleHistory;

@Service
public class ArticleHistoryService implements IArticleHistoryService {
	@Autowired
	private IUnitforumArticleHistoryDao articleHistoryDao;
	
	@Override
	public List<UnitforumArticleHistory> getList(int masterIdx, String langCode, String class1Code, String class2Code, Date startDt, Date endDt, String nickname) {
		return articleHistoryDao.queryList(masterIdx, langCode, class1Code, class2Code, startDt, endDt, nickname);
	}
	
	@Override
	public boolean addInfo(int articleIdx, String abuseUser, byte abuseType, String abuseDesc) {
		return articleHistoryDao.insertInfo(articleIdx, abuseUser, abuseType, abuseDesc) > 0 ? true : false;
	}
	
	@Override
	public boolean removeInfo(int articleIdx) {
		return articleHistoryDao.deleteInfo(articleIdx) > 0 ? true : false;
	}

	@Override
	public boolean addLogInfo(String abuseUser, String logType, String comment) {
		return articleHistoryDao.insertLogInfo(abuseUser, logType, comment) > 0 ? true : false;
	}

	@Override
	public int getArticleHistory(int articleIdx) {
		return articleHistoryDao.getArticleHistory(articleIdx);
	}
}
