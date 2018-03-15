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
import ftt.unitforum_admin.types.UnitforumArticle;

@RestController
@RequestMapping("/ajax/forum/article")
public class AjaxForumArticleController {
	
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
		
		List<UnitforumArticle> list = articleSvc.getList(masterIdx, langCode.isEmpty() ? null : langCode.toLowerCase(), class1Code.isEmpty() ? null : class1Code, class2Code.isEmpty() ? null : class2Code, startDt, endDt, nickname.isEmpty() ? null : nickname);
		
		return JsonResult.success(list);
	}
	
	@RequestMapping(value = "/hide", method = RequestMethod.POST)
	public Object actionHide(@RequestParam(value="articleIdx", required=true) int articleIdx,
			@RequestParam(value="comment", required=true) String comment) throws Exception {
		if (articleIdx < 1)
			throw new Exception("Invalid parameters.");
		
		if (!articleHistorySvc.addInfo(articleIdx, "0", (byte)1, "Hide article")) {
			throw new Exception("DB Error.");
		}
		
		if (!articleSvc.removeInfo(articleIdx)) {
			throw new Exception("DB Error.");
		}
		
		int articleHistIdx = articleHistorySvc.getArticleHistory(articleIdx);
		
		if (!logSvc.addInfo(articleHistIdx, articleIdx, "0", "article_Hide", comment)) {
			throw new Exception("DB Error.");
		}
		
		return JsonResult.success();
	}
}
