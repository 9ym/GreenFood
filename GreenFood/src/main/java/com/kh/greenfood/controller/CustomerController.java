package com.kh.greenfood.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.greenfood.domain.NoticeVo;
import com.kh.greenfood.domain.TestVo;
import com.kh.greenfood.service.MemberService;
import com.kh.greenfood.service.NoticeService;

@Controller
@RequestMapping(value="/customer")
public class CustomerController {
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private NoticeService noticeService;
	
	@RequestMapping(value="/customerMyPage")
	public String customerMyPage() throws Exception{
		return "customer/customerMyPage";
	}
	
	@RequestMapping(value="/customerMemberJoinForm")
	public String customerMemberJoinForm() throws Exception{
		return "customer/customerMemberJoinForm";
	}
	
	@RequestMapping(value="/customerProfile")
	public String customerProfile(String user_pw) throws Exception{
		
		return "customer/customerProfile";
	}
	
	
	@RequestMapping(value="/customerProfileRun", method=RequestMethod.POST)
	public String cutomerProfileRun(HttpSession session, String user_pw) throws Exception{
		System.out.println(user_pw);
		TestVo testVo = (TestVo)session.getAttribute("testVo");
		if (testVo.getUser_pw().equals(user_pw)) {
			
		} else {
			
		}
		return null;
	}
	
	@RequestMapping(value="/customerMemberJoinRun", method=RequestMethod.POST)
	public String customerMemberJoinRun(TestVo testVo, RedirectAttributes rttr) throws Exception {
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
