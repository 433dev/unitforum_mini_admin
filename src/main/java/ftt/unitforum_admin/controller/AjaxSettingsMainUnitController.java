package ftt.unitforum_admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ftt.unitforum_admin.service.setting.impl.MainUnitService;
import ftt.unitforum_admin.service.setting.impl.SubUnitService;
import ftt.unitforum_admin.types.JsonResult;
import ftt.unitforum_admin.types.UnitforumMainUnit;

@RestController
@RequestMapping("/ajax/settings/mainunit")
public class AjaxSettingsMainUnitController {
	@Autowired
	private MainUnitService mainUnitSvc;
	
	@Autowired
	private SubUnitService subUnitSvc;
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public Object actionList(@RequestParam("masterIdx") int masterIdx) throws Exception {
		if (masterIdx < 1)
			throw new Exception("Invalid parameters.");
		
		List<UnitforumMainUnit> list = mainUnitSvc.getList(masterIdx);
		
		return JsonResult.success(list);
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Object actionAdd(@RequestParam("masterIdx") int masterIdx, @RequestParam("class1Code") String class1Code, @RequestParam("class1Name") String class1Name) throws Exception {
		if (masterIdx < 1 || class1Code.isEmpty() || class1Name.isEmpty())
			throw new Exception("Invalid parameters.");
		
		UnitforumMainUnit info = new UnitforumMainUnit();
		info.setMasterIdx(masterIdx);
		info.setClass1Code(class1Code);
		info.setClass1Name(class1Name);

		if (!mainUnitSvc.addInfo(info)) {
			throw new Exception("DB Error.");
		}
		
		return JsonResult.success();
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public Object actionRemove(@RequestParam("masterIdx") int masterIdx, @RequestParam("class1Code") String class1Code) throws Exception {
		if (masterIdx < 1 || class1Code.isEmpty())
			throw new Exception("Invalid parameters.");
		
		if (!mainUnitSvc.removeInfo(masterIdx, class1Code)) {
			throw new Exception("DB Error.");
		}
		
		if (!subUnitSvc.removeAll(masterIdx, class1Code)) {
			throw new Exception("DB Error.");
		}
		
		return JsonResult.success();
	}
}
