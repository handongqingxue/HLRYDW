package com.hLRYDW.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(ForeController.MODULE_NAME)
public class ForeController {

	public static final String MODULE_NAME="/fore";
	
	@RequestMapping(value="/goPage")
	public String goPage(HttpServletRequest request) {
		String url = null;
		String page = request.getParameter("page");
		url = MODULE_NAME+"/"+page;
		return url;
	}
}
