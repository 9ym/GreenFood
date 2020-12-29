package com.kh.greenfood.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String customerProfile() throws Exception{
		return "customer/customerProfile";
	}
	
	
	@RequestMapping(value="/customerProfileRun", method=RequestMethod.POST)
	@ResponseBody
	public String customerProfileRun(HttpSession session, String user_pw) throws Exception{
		TestVo testVo = (TestVo)session.getAttribute("testVo");
		// 프로필상 입력한 user_pw == session의 user_pw
		if (testVo.getUser_pw().equals(user_pw)) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@RequestMapping(value="/customerProfileModifyRun", method=RequestMethod.POST)
	public void customerProfileModifyRun(TestVo testVo) throws Exception{
		System.out.println("customerProfileModifyRun: " + testVo);
		
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
