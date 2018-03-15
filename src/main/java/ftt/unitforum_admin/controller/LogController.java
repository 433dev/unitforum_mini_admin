package ftt.unitforum_admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ftt.unitforum_admin.service.log.ILogService;

@Controller
@RequestMapping("/log")
public class LogController extends BaseController {

	@Autowired
	protected ILogService logSvc;
	
	@RequestMapping
	private String actionList() throws Exception {

		return "log/log_list";
	}
}
