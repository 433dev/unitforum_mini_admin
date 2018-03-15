package ftt.unitforum_admin.service.setting;

import java.util.List;

import ftt.unitforum_admin.types.UnitforumMainUnit;

public interface IMainUnitService {
	List<UnitforumMainUnit> getList(int masterIdx);
	boolean addInfo(UnitforumMainUnit mainUnitInfo);
	boolean removeInfo(int masterIdx, String class1Code);
	boolean removeAll(int masterIdx);
}
