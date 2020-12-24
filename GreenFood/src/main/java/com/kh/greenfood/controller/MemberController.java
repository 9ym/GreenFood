package com.kh.greenfood.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.greenfood.domain.TestVo;
import com.kh.greenfood.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	/*@Inject
	private MemberService memberService;*/
	
	/*@RequestMapping(value="/customerMemberJoin")
	public String customerMemberJoin() throws Exception{

		return "customerMemberJoinForm";
	}*/
	
	/*@RequestMapping(value="/customerMemberJoinRun", method=RequestMethod.POST)
	public String customerMemberJoinRun(TestVo testVo, RedirectAttributes rttr) throws Exception {
		System.out.println("customerMemberJoinRun:" + testVo);
		memberService.insertMember(testVo);
		String page = "";
		if(testVo != null) {
			rttr.addFlashAttribute("msg", "memberJoinSuccess");
			page = "loginPage";
		} else {
			rttr.addFlashAttribute("msg", "memberJoinFail");
			page = "redirect:/customerMemberJoin";
		}
		return page;
	}*/
	
	@RequestMapping(value="/sellerMemberJoin")
	public String sellerMemberJoin() throws Exception{
		
		return "sellerMemberJoinForm";
	}
}
