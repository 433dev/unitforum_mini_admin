package ftt.unitforum_admin.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import ftt.unitforum_admin.config.AppConfig;
import ftt.unitforum_admin.service.code.IPlatformCodeService;

@Controller
public class BaseController {
    @Autowired
    protected ApplicationContext context;
    
    @Autowired
	private AppConfig config;
    
    @Autowired
	private IPlatformCodeService codeSvc;
    
    @ModelAttribute
    private void setCommonModelAttribute(Model model) {
    	Date now = new Date();
        
        TimeZone utcTimeZone = TimeZone.getTimeZone("UTC");
        TimeZone sysTimeZone = TimeZone.getDefault();
        
        DateFormat sysDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        DateFormat utcDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
       
        utcDateFormat.setTimeZone(utcTimeZone);
       
        int tzOffset = sysTimeZone.getOffset(now.getTime()) / 3600000;
        
        model.addAttribute("tzUtcNow", String.format("[UTC+0] %s", utcDateFormat.format(now)));
        model.addAttribute("tzSystemNow", String.format("[UTC%+d] %s", tzOffset, sysDateFormat.format(now)));
        model.addAttribute("timeZoneDispName", String.format("UTC%+d", tzOffset));
        
        model.addAttribute("cnfGameName", config.getGameName());
        model.addAttribute("cnfEnv", config.getEnvironment());
        model.addAttribute("staticDomain", config.getStaticResource());
        
        model.addAttribute("langCodeList", codeSvc.getLangCodeList());
    }
}
