package com.kh.greenfood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/customer")
public class CustomerController {
	
	@RequestMapping(value="/customerMyPage")
	public String customerMyPage() throws Exception{
		return "customer/customerMyPage";
	}
	
	@RequestMapping(value="/customerMemberJoinForm")
	public String customerMemberJoinForm() throws Exception{
		return "customer/customerMemberJoinForm";
	}
}
