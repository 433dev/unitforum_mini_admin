package ftt.unitforum_admin.dao.unitforum;

import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import ftt.unitforum_admin.types.UnitforumLog;

public interface IUnitforumLogDao {
	public List<UnitforumLog> queryList(
			@Param("startDt") Date startDt,
			@Param("endDt") Date endDt);
	public int insertInfo(
			@Param("articleHistIdx") int articleHistIdx,
			@Param("articleIdx") int articleIdx,
			@Param("workUser") String workUser,
			@Param("logType") String logType,
			@Param("comment") String comment);
}
