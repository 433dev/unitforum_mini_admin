package ftt.unitforum_admin.service.setting.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ftt.unitforum_admin.dao.unitforum.IUnitforumSubUnitDao;
import ftt.unitforum_admin.service.setting.ISubUnitService;
import ftt.unitforum_admin.types.UnitforumSubUnit;

@Service
public class SubUnitService implements ISubUnitService {
	@Autowired
	private IUnitforumSubUnitDao unitforumSubUnitDao;

	@Override
	public List<UnitforumSubUnit> getList(int masterIdx, String class1Code) {
		return unitforumSubUnitDao.queryList(masterIdx, class1Code);
	}

	@Override
	public boolean addInfo(UnitforumSubUnit subUnitInfo) {
		return unitforumSubUnitDao.insertInfo(subUnitInfo) > 0 ? true : false;
	}

	@Override
	public boolean removeInfo(int masterIdx, String class1Code, String class2Code) {
		return unitforumSubUnitDao.deleteInfo(masterIdx, class1Code, class2Code) > 0 ? true : false;
	}
	
	@Override
	public boolean removeAllOfMaster(int masterIdx) {
		if(getList(masterIdx, "").isEmpty()) {
			return true;
		}
		return unitforumSubUnitDao.deleteAllOfMaster(masterIdx) > 0 ? true : false;
	}
	
	@Override
	public boolean removeAll(int masterIdx, String class1Code) {
		return unitforumSubUnitDao.deleteAll(masterIdx, class1Code) > 0 ? true : false;
	}
}
