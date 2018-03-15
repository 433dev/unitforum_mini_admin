package ftt.unitforum_admin.dao.unitforum;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import ftt.unitforum_admin.types.UnitforumArticle;

public interface IUnitforumArticleDao {
	public List<UnitforumArticle> queryList(
			@Param("masterIdx") int masterIdx,
			@Param("langCode") String langCode,
			@Param("class1Code") String class1Code,
			@Param("class2Code") String class2Code,
			@Param("startDt") Date startDt,
			@Param("endDt") Date endDt,
			@Param("nickname") String nickname);
	public int insertInfo(@Param("articleIdx") int articleIdx);
	public int deleteInfo(@Param("articleIdx") int articleIdx);
}
