package com.kh.greenfood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/main")
public class MainController {

	@RequestMapping(value="/memberJoinForm")
	public String memberJoinForm() throws Exception{
		return "memberJoinForm";
	}
	@RequestMapping(value="/loginPage")
	public String loginPage() throws Exception{
		return "/main/loginPage";
		
	}
	
	@RequestMapping(value="/event/eventMain")
	public String eventMain() throws Exception{
		return "event/eventMain";
		
	}
	
	@RequestMapping(value="/customerCenter/customerCenterMain")
	public String customerCenter() throws Exception{
		return "customerCenter/customerCenterMain";
		
	}
}
