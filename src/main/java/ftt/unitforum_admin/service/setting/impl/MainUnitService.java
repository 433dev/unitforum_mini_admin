package ftt.unitforum_admin.service.setting.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ftt.unitforum_admin.dao.unitforum.IUnitforumMainUnitDao;
import ftt.unitforum_admin.service.setting.IMainUnitService;
import ftt.unitforum_admin.types.UnitforumMainUnit;

@Service
public class MainUnitService implements IMainUnitService {
	@Autowired
	private IUnitforumMainUnitDao unitforumMainUnitDao;

	@Override
	public List<UnitforumMainUnit> getList(int masterIdx) {
		return unitforumMainUnitDao.queryList(masterIdx);
	}
	
	@Override
	public boolean addInfo(UnitforumMainUnit mainUnitInfo) {
		return unitforumMainUnitDao.insertInfo(mainUnitInfo) > 0 ? true : false;
	}

	@Override
	public boolean removeInfo(int masterIdx, String class1Code) {
		return unitforumMainUnitDao.deleteInfo(masterIdx, class1Code) > 0 ? true : false;
	}
	
	@Override
	public boolean removeAll(int masterIdx) {
		if(getList(masterIdx).size() == 0) {
			return true;
		}
		return unitforumMainUnitDao.deleteAll(masterIdx) > 0 ? true : false;
	}
}
