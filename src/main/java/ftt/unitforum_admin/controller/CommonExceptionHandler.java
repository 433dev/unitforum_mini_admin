package ftt.unitforum_admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.LocaleResolver;

@Order(1)
@ControllerAdvice(annotations = Controller.class)
public class CommonExceptionHandler {
	
	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private LocaleResolver localeResolver;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@ExceptionHandler(Exception.class)
	public String handleException(Exception e, HttpServletRequest request, Model model, HandlerMethod handlerMethod) {
		Object[] args = new String[] { null };
		String errorMessage = messageSource.getMessage("resource.common.message.pageerror", args, "페이지 오류입니다.", localeResolver.resolveLocale(request)); 
		model.addAttribute("message", errorMessage);
		logger.error("[defaultExceptionHandler] class:{}, msg:{}", e.getClass(), e.getMessage());
		return "pageError";
	}
}
