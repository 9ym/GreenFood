package com.kh.greenfood.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.greenfood.domain.ProductCategoryDto;
import com.kh.greenfood.domain.ProductImageDto;
import com.kh.greenfood.domain.ProductVo;
import com.kh.greenfood.domain.CustomerVo;
import com.kh.greenfood.service.MemberService;
import com.kh.greenfood.service.ProductService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private ProductService productService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome -GreenFood-! The client locale is {}.", locale);
		
		/* 베스트 6 상품 목록 */
		List<ProductVo> productPopularList = productService.getPopularProduct(6);
		model.addAttribute("productPopularList", productPopularList);
		model.addAttribute("mainProductCount", productPopularList.size());
		
		/* 베스트 6 상품 목록 - 이미지 */
		List<ProductImageDto> productImageList = new ArrayList<>();
		for (ProductVo vo : productPopularList) {
			String product_code_img = vo.getProduct_code();
			ProductImageDto imgdto = productService.getProductImage(product_code_img);
			productImageList.add(imgdto);
		}
		model.addAttribute("productImageList", productImageList);
		
		/* 상품 카테고리 */
		List<ProductCategoryDto> categoryList = productService.getCategory();
		model.addAttribute("categoryList", categoryList);
		
		return "home";
	}
	
	/* 아이디 중복체크 */
	@RequestMapping(value="/checkDupId/{user_id}", method=RequestMethod.GET)
	@ResponseBody
	public String checkDupId(@PathVariable("user_id") String user_id) {
		CustomerVo customerVo = memberService.selectMember(user_id);
		String message = "";
		if(customerVo == null) {
			message = "idDontExist";
		} else {
			message = "idExist";
		}
		return message;
	}
	
	/* 로그인 진행 */
	@RequestMapping(value="/loginRun", method=RequestMethod.POST)
	public String login(String user_id, String user_pw, String checked_id, HttpSession session, RedirectAttributes rttr,Model model, HttpServletResponse response) {
		
		CustomerVo customerVo = memberService.login(user_id, user_pw);
		String page = "";
		// customerVo가 있고, 회원 탈퇴가 안된 회원만 로그인
		if(customerVo != null && !customerVo.getUser_deleted().equals("Y")) {
			
			Cookie cookie = new Cookie("save_id", user_id);
			if(checked_id != null && !checked_id.equals("")) {
				cookie.setMaxAge(60 * 60 * 60);
			} else {
				cookie.setMaxAge(0);
			}
			response.addCookie(cookie);
			
			// 회원 가입일자 간소화 0000-00-00 00:00:00 -> 0000-00-00
			String user_date = customerVo.getUser_date();
			int lastIndex = user_date.lastIndexOf("-") + 3;
			String user_join_date = user_date.substring(0, lastIndex);
			customerVo.setUser_date(user_join_date);
			// 끝 회원가입일자 간소화
			
			// 로그인 되어 있지 않은 상태로 로그인이 필요한 페이지 접근시 session에 저장된 "dest" 값을 받아와서 로그인한 뒤에 redirect
			// "dest"값은 Interceptor에서 저장시킴
			session.setAttribute("customerVo", customerVo);
			String dest = (String)session.getAttribute("dest");
			session.removeAttribute("dest");
			if(dest != null) {
				page = "redirect:" + dest;
			} else {
				page = "redirect:/";
			}
			// customerVo가 없을 때 -> 로그인 실패 alert
		} else if(customerVo == null){
			rttr.addFlashAttribute("msg", "loginFail");
			page="redirect:/main/loginPage";
			// 로그인 시도 -> 삭제 처리된 아이디로 접근 -> alert
		} else if(customerVo.getUser_deleted().equals("Y")) {
			rttr.addFlashAttribute("msg", "deletedCustomer");
			page="redirect:/main/loginPage";
		}
		return page;
	}
	
	/* 로그아웃 */
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
