package ftt.unitforum_admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ftt.unitforum_admin.service.code.IPlatformCodeService;
import ftt.unitforum_admin.service.setting.IMasterService;

@Controller
@RequestMapping("/settings")
public class SettingController extends BaseController {
	@Autowired
	private IPlatformCodeService codeSvc;
	
	@Autowired
	private IMasterService masterSvc;

	@RequestMapping
	private String actionIndex(Model model) throws Exception {
		model.addAttribute("masterList", masterSvc.getList());
		model.addAttribute("gameCodeTable", codeSvc.getGameCodeTable());
		
		return "settings/master";
	}
	
	@RequestMapping("/unit")
	private String actionList(Model model, @RequestParam("masterIdx") int masterIdx) throws Exception {
		masterSvc = super.context.getBean(IMasterService.class);
		
		model.addAttribute("gameCodeTable", codeSvc.getGameCodeTable());
		model.addAttribute("masterInfo", masterSvc.getInfo(masterIdx));
		
		return "settings/unit";
	}
}
