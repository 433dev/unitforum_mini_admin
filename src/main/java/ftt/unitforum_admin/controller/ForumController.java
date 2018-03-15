package ftt.unitforum_admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ftt.unitforum_admin.service.code.IPlatformCodeService;
import ftt.unitforum_admin.service.setting.IMasterService;

@Controller
@RequestMapping("/forum")
public class ForumController extends BaseController {
	@Autowired
	private IPlatformCodeService codeSvc;
	
	@Autowired
	private IMasterService masterSvc;

	@RequestMapping
	private String init(Model model) throws Exception {
		model.addAttribute("gameCodeTable", codeSvc.getGameCodeTable());
		model.addAttribute("gameList", masterSvc.getUsedList());

		return "forum/forum_list";
	}

	@RequestMapping("/list")
	private String actionList(Model model, @RequestParam("ssn") int ssn, @RequestParam("masterIdx") int masterIdx) throws Exception {
		model.addAttribute("gameName", codeSvc.getAvailableGameList().stream().filter(t -> t.getSsn() == ssn).findFirst().get().getName());
		model.addAttribute("langCodeList", codeSvc.getLangCodeList());
		model.addAttribute("masterIdx", masterIdx);
		
		return "forum/article_list";
	}
}
