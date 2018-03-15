package ftt.unitforum_admin.dao.unitforum;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ftt.unitforum_admin.types.UnitforumSubUnit;

public interface IUnitforumSubUnitDao {
	public List<UnitforumSubUnit> queryList(@Param("masterIdx") int masterIdx, @Param("class1Code") String class1Code);
	public int insertInfo(UnitforumSubUnit subUnitInfo);
	public int deleteInfo(@Param("masterIdx") int masterIdx, @Param("class1Code") String class1Code, @Param("class2Code") String class2Code);
	public int deleteAllOfMaster(@Param("masterIdx") int masterIdx);
	public int deleteAll(@Param("masterIdx") int masterIdx, @Param("class1Code") String class1Code);
}
