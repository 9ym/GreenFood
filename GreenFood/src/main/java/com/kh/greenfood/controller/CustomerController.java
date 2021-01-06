package com.kh.greenfood.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.TestVo;
import com.kh.greenfood.service.MemberService;

@Controller
@RequestMapping(value="/customer")
public class CustomerController {
	
	@Inject
	private MemberService memberService;
	
	// 마이페이지 포워드
	@RequestMapping(value="/customerMyPage")
	public String customerMyPage(String user_id, Model model) throws Exception{
		List<OrderVo> latestOrderedList = memberService.getLatestOrderedList(user_id);
		model.addAttribute("latestOrderedList", latestOrderedList);
		return "customer/customerMyPage";
	}
	
	// 마이페이지 상의 등급별 혜택
	@RequestMapping(value="/customerMembership")
	public String customerMembership () throws Exception{
		return "customer/customerMembership";
	}
	
	// 마이페이지 상의 적립금
	@RequestMapping(value="/customerPoint")
	public String customerPoint () throws Exception{
		return "customer/customerPoint";
	}
	
	// 마이페이지 상의 주문내역 전체보기
	@RequestMapping(value="/customerOrderdList", method=RequestMethod.GET)
	public String customerOrderdList(String user_id, Model model) throws Exception{
		List<OrderVo> orderedList = memberService.getOrderedList(user_id);
		model.addAttribute("orderedList", orderedList);
		return "customer/customerOrderdList";
	}
	
	// 마이페이지 상의 order_code 클릭시 주문상세 내역 보여주기
	@RequestMapping(value="/customerDetailOrder")
	public String customerDetailOrder(String order_code)throws Exception{
		
		return "customer/customerDetailOrder";
	}
	
	// 회원가입 포워드
	@RequestMapping(value="/customerMemberJoinForm")
	public String customerMemberJoinForm() throws Exception{
		return "customer/customerMemberJoinForm";
	}
	
	// 마이페이지 내에 프로필 포워드
	@RequestMapping(value="/customerProfile")
	public String customerProfile() throws Exception{
		return "customer/customerProfile";
	}
	
	// 마이페이지 -> 프로필 session의 password와 입력된 password 비교 
	@RequestMapping(value="/customerProfileRun", method=RequestMethod.POST)
	@ResponseBody
	public String customerProfileRun(HttpSession session, String user_pw) throws Exception{
		TestVo testVo = (TestVo)session.getAttribute("testVo");
		// 비동기 요청 성공시 success, 실패시 fail
		if (testVo.getUser_pw().equals(user_pw)) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 마이페이지 -> 프로필 회원 정보 수정
	@RequestMapping(value="/customerProfileModifyRun", method=RequestMethod.POST)
	public String customerProfileModifyRun(HttpSession session, TestVo testVo, RedirectAttributes rttr) throws Exception{
		int count = memberService.customerModify(testVo);
		TestVo testVo1 = (TestVo)session.getAttribute("testVo");
		String user_pw = testVo1.getUser_pw();
		String page = "";
		if(count > 0) {
			testVo.setUser_pw(user_pw);
			session.setAttribute("testVo", testVo);
			rttr.addFlashAttribute("msg", "modifySuccess");
			page = "redirect:/customer/customerMyPage"; 
		} else {
			rttr.addFlashAttribute("msg", "modifyFail");
			page = "redirect:/customer/customerProfile";
		}
		return page;
	}
	
	// 마이페이지 -> 프로필 비밀번호 변경 모달에서 현재비밀번호를 DB로 보내서 확인
	@RequestMapping(value="/customerProfilePwChangeChkRun", method=RequestMethod.POST)
	@ResponseBody
	public String customerProfilePwChangeChkRun(HttpSession session, String presentPw) throws Exception{
		TestVo testVo = (TestVo)session.getAttribute("testVo");
		String user_id = testVo.getUser_id();
		TestVo testVo1 = memberService.login(user_id, presentPw);
		// 비동기 요청 비밀번호 같을시 equals, 아닐시 fail
		if(testVo1 != null) {
			return "equals";
		} else {
			return "fail";
		}
	}
	
	// 마이페이지 -> 프로필 비밀번호 변경
	@RequestMapping(value="/customerProfilePwChange", method=RequestMethod.POST)
	public String customerProfilePwChange(HttpSession session,String user_pw, RedirectAttributes rttr) throws Exception{
		TestVo testVo = (TestVo)session.getAttribute("testVo");
		String user_id = testVo.getUser_id();
		int count = memberService.changePw(user_id, user_pw);
		String page = "";
		if(count > 0) {
			testVo.setUser_pw(user_pw);
			session.setAttribute("testVo", testVo);
			rttr.addFlashAttribute("msg", "pwChangeSuccess");
			page = "redirect:/customer/customerMyPage";
		} else {
			rttr.addFlashAttribute("msg", "pwChangeFail");
			page = "redirect:/customer/customerProfile";
		}
		return page;
	}
	
	// 회원가입
	@RequestMapping(value="/customerMemberJoinRun", method=RequestMethod.POST)
	public String customerMemberJoinRun(TestVo testVo, RedirectAttributes rttr) throws Exception {
		int count = memberService.insertMember(testVo);

		String page = "";
		// insert 성공시 loginPage로 이동, 실패시 joinForm으로 이동
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
