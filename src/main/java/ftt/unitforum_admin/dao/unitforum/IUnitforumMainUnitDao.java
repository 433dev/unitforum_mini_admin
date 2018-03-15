package ftt.unitforum_admin.dao.unitforum;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ftt.unitforum_admin.types.UnitforumMainUnit;

public interface IUnitforumMainUnitDao {
	public List<UnitforumMainUnit> queryList(@Param("masterIdx") int masterIdx);
	public int insertInfo(UnitforumMainUnit mainUnitInfo);
	public int deleteInfo(@Param("masterIdx") int masterIdx, @Param("class1Code") String class1Code);
	public int deleteAll(@Param("masterIdx") int masterIdx);
	
	//개발자용
	public int insertAll(UnitforumMainUnit unitforumMainUnitList);
}
