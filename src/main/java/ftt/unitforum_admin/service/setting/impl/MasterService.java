package ftt.unitforum_admin.service.setting.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ftt.unitforum_admin.dao.unitforum.IUnitforumMasterDao;
import ftt.unitforum_admin.service.setting.IMasterService;
import ftt.unitforum_admin.types.UnitforumMaster;

@Service
public class MasterService implements IMasterService {
		
	@Autowired
	private IUnitforumMasterDao unitforumMasterDao;

	@Override
	public List<UnitforumMaster> getList() {
		return unitforumMasterDao.queryList();
	}

	@Override
	public List<UnitforumMaster> getUsedList() {
		return unitforumMasterDao.queryUsedList();
	}
	
	@Override
	public UnitforumMaster getInfo(int masterIdx) {
		return unitforumMasterDao.queryInfo(masterIdx);
	}

	@Override
	public boolean addInfo(UnitforumMaster masterInfo) {
		return unitforumMasterDao.insertInfo(masterInfo) > 0 ? true : false;
	}

	@Override
	public boolean changeShowStatus(int masterIdx, char showYn) {
		return unitforumMasterDao.updateShowStatus(masterIdx, showYn) > 0 ? true : false;
	}

	@Override
	public boolean changeDescription(int masterIdx, String desc) {
		return unitforumMasterDao.updateDescription(masterIdx, desc) > 0 ? true : false;
	}

	@Override
	public boolean removeInfo(int masterIdx) {
		return unitforumMasterDao.deleteInfo(masterIdx) > 0 ? true : false;
	}
}
