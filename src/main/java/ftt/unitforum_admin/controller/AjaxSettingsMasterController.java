package ftt.unitforum_admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ftt.unitforum_admin.service.setting.impl.MainUnitService;
import ftt.unitforum_admin.service.setting.impl.MasterService;
import ftt.unitforum_admin.service.setting.impl.SubUnitService;
import ftt.unitforum_admin.service.setting.impl.WorldService;
import ftt.unitforum_admin.types.JsonResult;
import ftt.unitforum_admin.types.UnitforumMaster;

@RestController
@RequestMapping("/ajax/settings/master")
public class AjaxSettingsMasterController {
	@Autowired
	private MasterService masterSvc;
	
	@Autowired
	private WorldService worldSvc;
	
	@Autowired
	private MainUnitService mainUnitSvc;
	
	@Autowired
	private SubUnitService subUnitSvc;
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Object actionAdd(@RequestParam("ssn") int ssn, @RequestParam("desc") String desc, @RequestParam("viewType") int viewType, @RequestParam("unitType") String unitType) throws Exception {
		if (ssn < 1 || desc.isEmpty())
			throw new Exception("Invalid parameters.");
		
		UnitforumMaster info = new UnitforumMaster();
		info.setMasterIdx(2);
		info.setSsn(ssn);
		info.setDesc(desc);
		info.setViewType(viewType);
		info.setUnitType(unitType);
		
		if (!masterSvc.addInfo(info))
			throw new Exception("DB Error.");
		
		return JsonResult.success();
	}
	
	@RequestMapping(value = "/changeStatus", method = RequestMethod.POST)
	public Object actionChangeStatus(@RequestParam("masterIdx") int masterIdx, @RequestParam("status") boolean status) throws Exception {
		char showYn = status ? 'Y' : 'N';
		
		if (!masterSvc.changeShowStatus(masterIdx, showYn)) {
			throw new Exception("DB Error.");
		}
	
		return JsonResult.success();
	}
	
	@RequestMapping(value = "/changeDesc", method = RequestMethod.POST)
	public Object actionChangeDesc(@RequestParam("masterIdx") int masterIdx, @RequestParam("desc") String desc) throws Exception {
		if (!masterSvc.changeDescription(masterIdx, desc)) {
			throw new Exception("DB Error.");
		}
		
		return JsonResult.success();
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public Object actionRemove(@RequestParam("masterIdx") int masterIdx) throws Exception {
		if (!masterSvc.removeInfo(masterIdx)) {
			throw new Exception("DB Error.");
		}
		
		if (!worldSvc.removeAll(masterIdx)) {
			throw new Exception("DB Error.");
		}
		
		if (!mainUnitSvc.removeAll(masterIdx)) {
			throw new Exception("DB Error.");
		}
		
		if (!subUnitSvc.removeAllOfMaster(masterIdx)) {
			throw new Exception("DB Error.");
		}
		
		return JsonResult.success();
	}
}
