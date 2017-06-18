package org.easyboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/test/*")
public class TestController {

	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String indexGET()throws Exception{
		
		return "home";
		
	}
	
	
	
}
