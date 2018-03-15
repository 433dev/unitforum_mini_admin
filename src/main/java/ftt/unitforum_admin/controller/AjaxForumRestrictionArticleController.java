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
import ftt.unitforum_admin.service.forum.IArticleService;
import ftt.unitforum_admin.service.log.ILogService;
import ftt.unitforum_admin.types.JsonResult;
import ftt.unitforum_admin.types.UnitforumArticleHistory;

@RestController
@RequestMapping("/ajax/restriction/article")
public class AjaxForumRestrictionArticleController {
	@Autowired
    protected ApplicationContext context;
    
	@Autowired
	protected IArticleService articleSvc;
	
	@Autowired
	protected IArticleHistoryService articleHistorySvc;
	
	@Autowired
	protected ILogService logSvc;
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public Object actionList(@RequestParam(value="masterIdx", required=true) int masterIdx,
			@RequestParam(value="langCode", required=false) String langCode,
			@RequestParam(value="class1Code", required=false) String class1Code,
			@RequestParam(value="class2Code", required=false) String class2Code,
			@RequestParam(value="startDt", required=false) @DateTimeFormat(pattern="yyyy-MM-dd HH:mm") Date startDt,
			@RequestParam(value="endDt", required=false) @DateTimeFormat(pattern="yyyy-MM-dd HH:mm") Date endDt,
			@RequestParam(value="nickname", required=false) String nickname) throws Exception {
		if (masterIdx < 1)
			throw new Exception("Invalid parameters.");
		
		List<UnitforumArticleHistory> list = articleHistorySvc.getList(masterIdx, langCode.isEmpty() ? null : langCode.toLowerCase(), class1Code.isEmpty() ? null : class1Code, class2Code.isEmpty() ? null : class2Code, startDt, endDt, nickname.isEmpty() ? null : nickname);
		
		return JsonResult.success(list);
	}
	
	@RequestMapping(value = "/show", method = RequestMethod.POST)
	public Object actionShow(@RequestParam(value="articleIdx", required=true) int articleIdx) throws Exception {
		if (articleIdx < 1)
			throw new Exception("Invalid parameters.");
		
		if (!articleSvc.addInfo(articleIdx)) {
			throw new Exception("DB Error.");
		}
		
		if (!articleHistorySvc.removeInfo(articleIdx)) {
			throw new Exception("DB Error.");
		}
		
		if (!logSvc.addInfo(0, articleIdx, "0", "article_Show", "")) {
			throw new Exception("DB Error.");
		}
		
		return JsonResult.success();
	}
}
