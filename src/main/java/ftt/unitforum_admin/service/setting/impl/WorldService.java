package ftt.unitforum_admin.service.setting.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ftt.unitforum_admin.dao.unitforum.IUnitforumWorldDao;
import ftt.unitforum_admin.service.setting.IWorldService;
import ftt.unitforum_admin.types.UnitforumWorld;

@Service
public class WorldService implements IWorldService {
	@Autowired
	private IUnitforumWorldDao unitforumWorldDao;

	@Override
	public List<UnitforumWorld> getList(int masterIdx) {
		return unitforumWorldDao.queryList(masterIdx);
	}

	@Override
	public boolean addInfo(UnitforumWorld worldInfo) {
		return unitforumWorldDao.insertInfo(worldInfo) > 0 ? true : false;
	}

	@Override
	public boolean removeInfo(int masterIdx, int worldId) {
		return unitforumWorldDao.deleteInfo(masterIdx, worldId) > 0 ? true : false;
	}
	
	@Override
	public boolean removeAll(int masterIdx) {
		if(getList(masterIdx).size() == 0) {
			return true;
		}
		return unitforumWorldDao.deleteAll(masterIdx) > 0 ? true : false;
	}
}
