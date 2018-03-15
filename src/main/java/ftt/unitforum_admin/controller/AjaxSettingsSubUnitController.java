package ftt.unitforum_admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ftt.unitforum_admin.service.setting.impl.SubUnitService;
import ftt.unitforum_admin.types.JsonResult;
import ftt.unitforum_admin.types.UnitforumSubUnit;

@RestController
@RequestMapping("/ajax/settings/subunit")
public class AjaxSettingsSubUnitController {
	@Autowired
	private SubUnitService subUnitSvc;
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public Object actionList(@RequestParam("masterIdx") int masterIdx, @RequestParam("class1Code") String class1Code) throws Exception {
		if (masterIdx < 1)
			throw new Exception("Invalid parameters.");
		
		List<UnitforumSubUnit> list = subUnitSvc.getList(masterIdx, class1Code);
		
		return JsonResult.success(list);
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Object actionAdd(@RequestParam("masterIdx") int masterIdx, @RequestParam("class1Code") String class1Code, @RequestParam("class2Code") String class2Code, @RequestParam("class2Name") String class2Name) throws Exception {
		if (masterIdx < 1 || class1Code.isEmpty() || class2Code.isEmpty() || class2Name.isEmpty())
			throw new Exception("Invalid parameters.");
		
		UnitforumSubUnit info = new UnitforumSubUnit();
		info.setMasterIdx(masterIdx);
		info.setClass1Code(class1Code);
		info.setClass2Code(class2Code);
		info.setClass2Name(class2Name);

		if (!subUnitSvc.addInfo(info)) {
			throw new Exception("DB Error.");
		}
		
		return JsonResult.success();
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public Object actionRemove(@RequestParam("masterIdx") int masterIdx, @RequestParam("class1Code") String class1Code, @RequestParam("class2Code") String class2Code) throws Exception {
		if (masterIdx < 1 || class1Code.isEmpty() || class2Code.isEmpty())
			throw new Exception("Invalid parameters.");
		
		if (!subUnitSvc.removeInfo(masterIdx, class1Code, class2Code)) {
			throw new Exception("DB Error.");
		}
		return JsonResult.success();
	}
}
