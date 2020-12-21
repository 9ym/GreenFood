package com.kh.greenfood;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.greenfood.domain.TestVo;
import com.kh.greenfood.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(String user_id, String user_pw, HttpSession session, RedirectAttributes rttr,Model model) {
		TestVo testVo = memberService.login(user_id, user_pw);
		String page = "";
		if(testVo != null) {
			session.setAttribute("testVo", testVo);
			rttr.addFlashAttribute("msg", "loginSuccess");
			model.addAttribute("loginOn", testVo.getUser_id());
			page="redirect:/";
		} else {
			rttr.addFlashAttribute("msg", "loginFail");
			page="redirect:main/loginPage";
		}
		return page;
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
