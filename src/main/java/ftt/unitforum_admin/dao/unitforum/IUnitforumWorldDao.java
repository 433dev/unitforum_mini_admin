package ftt.unitforum_admin.dao.unitforum;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ftt.unitforum_admin.types.UnitforumWorld;

public interface IUnitforumWorldDao {
	public List<UnitforumWorld> queryList(@Param("masterIdx") int masterIdx);
	public int insertInfo(UnitforumWorld worldInfo);
	public int deleteInfo(@Param("masterIdx") int masterIdx, @Param("worldIdx") int worldIdx);
	public int deleteAll(@Param("masterIdx") int masterIdx);
}
