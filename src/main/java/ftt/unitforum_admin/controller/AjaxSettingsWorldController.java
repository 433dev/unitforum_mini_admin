package ftt.unitforum_admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ftt.unitforum_admin.service.setting.impl.WorldService;
import ftt.unitforum_admin.types.JsonResult;
import ftt.unitforum_admin.types.UnitforumWorld;

@RestController
@RequestMapping("/ajax/settings/world")
public class AjaxSettingsWorldController {
	@Autowired
	private WorldService worldSvc;
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public Object actionList(@RequestParam("masterIdx") int masterIdx) throws Exception {
		if (masterIdx < 1)
			throw new Exception("Invalid parameters.");
		
		List<UnitforumWorld> list = worldSvc.getList(masterIdx);;
		
		return JsonResult.success(list);
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Object actionAdd(@RequestParam("masterIdx") int masterIdx, @RequestParam("worldIdx") int worldIdx, @RequestParam("worldName") String worldName) throws Exception {
		UnitforumWorld info = new UnitforumWorld();
		info.setMasterIdx(masterIdx);
		info.setWorldIdx(worldIdx);
		info.setWorldName(worldName);

		if (!worldSvc.addInfo(info)) {
			throw new Exception("DB Error.");
		}
		return JsonResult.success();
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public Object actionRemove(@RequestParam("masterIdx") int masterIdx, @RequestParam("worldIdx") int worldIdx) throws Exception {
		if (!worldSvc.removeInfo(masterIdx, worldIdx)) {
			throw new Exception("DB Error.");
		}
		return JsonResult.success();
	}
}
