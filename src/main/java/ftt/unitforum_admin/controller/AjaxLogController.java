package ftt.unitforum_admin.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ftt.unitforum_admin.service.forum.IArticleHistoryService;
import ftt.unitforum_admin.service.log.ILogService;
import ftt.unitforum_admin.types.JsonResult;
import ftt.unitforum_admin.types.UnitforumLog;

@RestController
@RequestMapping("/ajax/log")
public class AjaxLogController {
	
	@Autowired
	protected ApplicationContext context;
    
	@Autowired
	protected ILogService logSvc;
	
	@Autowired
	protected IArticleHistoryService articleHistorySvc;
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public Object actionList(@RequestParam(value="startDt", required=false) @DateTimeFormat(pattern="yyyy-MM-dd HH:mm") Date startDt,
			@RequestParam(value="endDt", required=false) @DateTimeFormat(pattern="yyyy-MM-dd HH:mm") Date endDt) throws Exception {
		
		List<UnitforumLog> list = logSvc.getList(startDt, endDt);
		
		return JsonResult.success(list);
	}
}
