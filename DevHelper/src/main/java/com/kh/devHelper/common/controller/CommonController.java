package com.kh.devHelper.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

	@RequestMapping("openMonaco")
	public String openMonaco() {
		return "react-app/index";
	}
	
	
	
}
