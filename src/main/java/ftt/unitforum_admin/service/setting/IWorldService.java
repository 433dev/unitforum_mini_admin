package ftt.unitforum_admin.service.setting;

import java.util.List;

import ftt.unitforum_admin.types.UnitforumWorld;

public interface IWorldService {
	public List<UnitforumWorld> getList(int masterIdx);
	public boolean addInfo(UnitforumWorld worldInfo);
	public boolean removeInfo(int masterIdx, int worldId);
	boolean removeAll(int masterIdx);
}
