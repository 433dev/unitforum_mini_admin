package ftt.unitforum_admin.service.forum;

import java.util.Date;
import java.util.List;

import ftt.unitforum_admin.types.UnitforumArticle;

public interface IArticleService {
	public List<UnitforumArticle> getList(int masterIdx, String langCode, String class1Code, String class2Code, Date startDt, Date endDt, String nickname);
	boolean addInfo(int articleIdx);
	public boolean removeInfo(int articleIdx);
}
