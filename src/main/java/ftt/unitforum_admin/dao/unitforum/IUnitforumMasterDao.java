package ftt.unitforum_admin.dao.unitforum;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ftt.unitforum_admin.types.UnitforumMaster;

public interface IUnitforumMasterDao {
	public List<UnitforumMaster> queryList();
	public List<UnitforumMaster> queryUsedList();
	public UnitforumMaster queryInfo(@Param("masterIdx") int masterIdx);
	public int insertInfo(UnitforumMaster masterInfo);
	public int updateShowStatus(@Param("masterIdx") int masterIdx, @Param("showYn") char showYn);
	public int updateDescription(@Param("masterIdx") int masterIdx, @Param("desc") String desc);
	public int deleteInfo(@Param("masterIdx") int masterIdx);
}
