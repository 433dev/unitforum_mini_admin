package ftt.unitforum_admin.service.code.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ftt.unitforum_admin.config.AppConfig;
import ftt.unitforum_admin.service.code.IPlatformCodeService;
import ftt.unitforum_admin.types.CodeObject;
import ftt.unitforum_admin.types.UnitforumGame;

@Service
public class PlatformCodeService implements IPlatformCodeService {
	@Autowired
	private AppConfig config;
	
	public List<UnitforumGame> getAvailableGameList() {
		List<UnitforumGame> unitForumGameList = new ArrayList<UnitforumGame>();
		
		unitForumGameList.add(new UnitforumGame(1, config.getGameName()));
		
		return unitForumGameList;
	}
	
	public List<CodeObject> getLangCodeList() {
		List<CodeObject> langCodeList = new ArrayList<CodeObject>();
		
		for (String[] d : config.getLanguage()) {
			langCodeList.add(new CodeObject(Integer.parseInt(d[0]), d[1], "", d[2], true));
		}
		
		return langCodeList;
	}
	
	public Map<Integer, String> getGameCodeTable() {
		HashMap<Integer, String> result = new HashMap<Integer, String>();
		
		try {
			List<UnitforumGame> list = this.getAvailableGameList();
			
			for (UnitforumGame d : list) {
				result.put(d.getSsn(), d.getName());
			}
			
		} catch (Exception e) {
		}
		
		return result;
	}

	public Map<Integer, String> getLangCodeTable() {
		HashMap<Integer, String> result = new HashMap<Integer, String>();
		
		try {
			List<CodeObject> list = this.getLangCodeList();
			
			for (CodeObject d : list) {
				result.put(d.getCode(), d.getName());
			}
			
		} catch (Exception e) {
		}
		
		return result;
	}
}
