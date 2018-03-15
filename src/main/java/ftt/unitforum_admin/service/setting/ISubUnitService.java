package ftt.unitforum_admin.service.setting;

import java.util.List;

import ftt.unitforum_admin.types.UnitforumSubUnit;

public interface ISubUnitService {
	List<UnitforumSubUnit> getList(int masterIdx, String class1Code);
	boolean addInfo(UnitforumSubUnit subUnitInfo);
	boolean removeInfo(int masterIdx, String class1Code, String class2Code);
	boolean removeAllOfMaster(int masterIdx);
	boolean removeAll(int masterIdx, String class1Code);
}
