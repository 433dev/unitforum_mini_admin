package ftt.unitforum_admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import ftt.unitforum_admin.types.JsonResult;

@Order(0)
@ControllerAdvice(annotations = RestController.class)
public class CommonRestExceptionHandler {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@ResponseBody
	@ExceptionHandler(Exception.class)
	public Object handleException(Exception e) {
		logger.error("[defaultRestExceptionHandler] class:{}, msg:{}", e.getClass(), e.getMessage());
		return JsonResult.fail(-100, e.getMessage());
	}
}