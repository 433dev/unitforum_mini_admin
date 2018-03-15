package ftt.unitforum_admin.service.forum;

import java.util.Date;
import java.util.List;
import ftt.unitforum_admin.types.UnitforumArticleHistory;

public interface IArticleHistoryService {
	List<UnitforumArticleHistory> getList(int masterIdx, String langCode, String class1Code, String class2Code, Date startDt, Date endDt, String nickname);
	boolean addInfo(int articleIdx, String abuseUser, byte abuseType, String abuseDesc);
	public boolean removeInfo(int articleIdx);
	boolean addLogInfo(String abuseUser, String logType, String comment);
	int getArticleHistory(int articleIdx);
}
