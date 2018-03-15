package ftt.unitforum_admin.service.log.impl;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ftt.unitforum_admin.dao.unitforum.IUnitforumLogDao;
import ftt.unitforum_admin.service.log.ILogService;
import ftt.unitforum_admin.types.UnitforumLog;

@Service
public class LogService implements ILogService {
	@Autowired
	private IUnitforumLogDao logDao; 

	@Override
	public List<UnitforumLog> getList(Date startDt, Date endDt) {
		return logDao.queryList(startDt, endDt);
	}

	@Override
	public boolean addInfo(int articleHistIdx, int articleIdx, String abuseUser, String logType, String comment) {
		return logDao.insertInfo(articleHistIdx, articleIdx, abuseUser, logType, comment) > 0 ? true : false;
	}
	
}