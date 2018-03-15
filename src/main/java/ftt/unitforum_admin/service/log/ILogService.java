package ftt.unitforum_admin.service.log;

import java.util.Date;
import java.util.List;
import ftt.unitforum_admin.types.UnitforumLog;

public interface ILogService {
	public List<UnitforumLog> getList(Date startDt, Date endDt);
	boolean addInfo(int articleHistIdx, int articleIdx, String abuseUser, String logType, String comment);
}
