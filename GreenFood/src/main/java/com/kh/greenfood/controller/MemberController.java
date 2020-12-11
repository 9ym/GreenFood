package com.kh.greenfood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	//구매자 회원가입
	@RequestMapping(value="/customerMemberJoin")
	public String customerMemberJoin() throws Exception{
		
		return "customerMemberJoinForm";
	}
	
	//판매자 회원가입
	@RequestMapping(value="/sellerMemberJoin")
	public String sellerMemberJoin() throws Exception{
		
		return "sellerMemberJoinForm";
	}
}
