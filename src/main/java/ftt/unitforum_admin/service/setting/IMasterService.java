package ftt.unitforum_admin.service.setting;

import java.util.List;

import ftt.unitforum_admin.types.UnitforumMaster;

public interface IMasterService {
	public List<UnitforumMaster> getList();
	public List<UnitforumMaster> getUsedList();
	public UnitforumMaster getInfo(int masterIdx);
	public boolean addInfo(UnitforumMaster masterInfo);
	public boolean changeShowStatus(int masterIdx, char status);
	public boolean changeDescription(int masterIdx, String desc);
	public boolean removeInfo(int masterIdx);
}
