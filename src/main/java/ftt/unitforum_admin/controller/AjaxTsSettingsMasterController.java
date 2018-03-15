package ftt.unitforum_admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ftt.unitforum_admin.service.setting.impl.MainUnitService;
import ftt.unitforum_admin.service.setting.impl.MasterService;
import ftt.unitforum_admin.service.setting.impl.SubUnitService;
import ftt.unitforum_admin.service.setting.impl.WorldService;
import ftt.unitforum_admin.types.JsonResult;
import ftt.unitforum_admin.types.UnitforumMaster;

@Controller
@RequestMapping("/api/settings/master")
public class AjaxTsSettingsMasterController extends BaseController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
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
		info.setMasterIdx(1);
		info.setSsn(ssn);
		info.setDesc(desc);
		info.setViewType(viewType);
		info.setUnitType(unitType);
		
		if (!masterSvc.addInfo(info))
			logger.error("ts master Id 생성 fail, ssn={}, desc={}, viewType={}, unitType={}", ssn, desc, viewType, unitType);
		
		return JsonResult.success();
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public Object actionRemove(@RequestParam("masterIdx") int masterIdx) throws Exception {
		if (!masterSvc.removeInfo(masterIdx-1)) {
			logger.error("ts master Id 삭제 fail, masterIdx={}", masterIdx);
		}
		
		if (!worldSvc.removeAll(masterIdx-1)) {
			logger.error("ts master Id 삭제 fail, masterIdx={}", masterIdx);
		}
		
		if (!mainUnitSvc.removeAll(masterIdx-1)) {
			logger.error("ts master Id 삭제 fail, masterIdx={}", masterIdx);
		}
		
		if (!subUnitSvc.removeAllOfMaster(masterIdx-1)) {
			logger.error("ts master Id 삭제 fail, masterIdx={}", masterIdx);
		}
		
		return JsonResult.success();
	}
}
