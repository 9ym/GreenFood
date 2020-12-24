package com.kh.greenfood.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.greenfood.domain.TestVo;
import com.kh.greenfood.service.MemberService;

@Controller
@RequestMapping(value="/customer")
public class CustomerController {
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value="/customerMyPage")
	public String customerMyPage() throws Exception{
		return "customer/customerMyPage";
	}
	
	@RequestMapping(value="/customerMemberJoinForm")
	public String customerMemberJoinForm() throws Exception{
		return "customer/customerMemberJoinForm";
	}
	
	@RequestMapping(value="/customerMemberJoinRun", method=RequestMethod.POST)
	public String customerMemberJoinRun(TestVo testVo, RedirectAttributes rttr) throws Exception {
		System.out.println("customerMemberJoinRun:" + testVo);
		int count = memberService.insertMember(testVo);
		
		String page = "";
		if(count > 0) {
			rttr.addFlashAttribute("msg", "memberJoinSuccess");
			page = "redirect:/main/loginPage";
		} else {
			rttr.addFlashAttribute("msg", "memberJoinFail");
			page = "redirect:/customerMemberJoinForm";
		}
		return page;
	}
}
