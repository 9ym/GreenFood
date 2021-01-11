package com.kh.greenfood.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.greenfood.dao.EmailDto;
import com.kh.greenfood.domain.TestVo;
import com.kh.greenfood.service.MemberService;
import com.kh.greenfood.util.EmailUtil;
import com.kh.greenfood.util.TempPassCreateUtil;

@Controller
@RequestMapping(value="/main")
public class MainController {
	
	@Inject
	private EmailUtil emailUtil;
	
	@Inject
	private MemberService memberService;
	
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
	
	// 로그인 페이지 -> 비밀번호 찾기
	@RequestMapping(value="/customerFindPw")
	public String customerFindPw() throws Exception{
		return "/main/findPwForm";
	}
	
	// 비밀번호 찾기 실행
	@RequestMapping(value="/customerFindPwRun", method=RequestMethod.POST)
	public String customerFindPwRun(TestVo testVo, RedirectAttributes rttr) throws Exception{
		TestVo testVo1 = memberService.findPw(testVo.getUser_id(), testVo.getUser_email());
		String page = "";
		System.out.println(testVo1);
		// DB에서 확인한 customer 정보가 있다면
		if(testVo1 != null) {
			String origin_email = testVo.getUser_email().trim();
			String findPw_email = testVo1.getUser_email().trim();
			// findPwForm에 입력한 email과 DB의 email이 일치할 경우
			if(origin_email.equals(findPw_email)) {
				// 임시 비밀번호 발급 -> 임시비밀번호 DB에 update
				String tempPassword = TempPassCreateUtil.getTempPassword();
				int count = memberService.changePw(testVo.getUser_id(), tempPassword);
				if(count > 0) {
					// 임시 비밀번호를 기존의 이메일로 보내기
					boolean result = emailUtil.sendMail(origin_email, tempPassword);
					System.out.println(result);
					if (result == true) {
						rttr.addFlashAttribute("msg", "tempPasswordCreate");
						page = "redirect:/";
					} else {
						rttr.addFlashAttribute("msg", "tempPasswordCreateFail");
						page = "redirect:/main/customerFindPw";
					}
					
				} else {
					rttr.addFlashAttribute("msg", "notFoundCustomerInfo");
					page = "redirect:/main/customerFindPw";
				}
			}
			
		// DB에서 확인한 customer 정보가 없다면 -> 비밀번호 찾기 화면으로 돌아가서 alert
		} else {
			rttr.addFlashAttribute("msg", "emailNotEquals");
			page = "redirect:/main/customerFindPw";
		}
		return page;
	}
	
	// 로그인 페이지 -> 아이디 찾기
	@RequestMapping(value="/customerFindId")
	public String customerFindId() throws Exception{
		return "/main/findIdForm";
	}
	
	// 아이디 찾기 실행
	@RequestMapping(value="/customerFindIdRun", method=RequestMethod.POST)
	public String customerFindIdRun(TestVo testVo, RedirectAttributes rttr, Model model) throws Exception{
		System.out.println(testVo);
		TestVo testVo1 = memberService.findId(testVo.getUser_name(), testVo.getUser_email(), testVo.getUser_phone());
		String page = "";
		if(testVo1 != null) {
			String user_id = testVo1.getUser_id();
			rttr.addFlashAttribute("findUser_id", user_id);
			page = "redirect:/";
		} else {
			rttr.addFlashAttribute("msg", "notFoundCustomerInfo");
			page = "redirect:/main/customerFindId";
		}
		
		return page;
	}
	
	/*@RequestMapping(value="/review/reviewMain")
	public String reviewMain() throws Exception{
		return "review/reviewMain";
		
	}*/
}
