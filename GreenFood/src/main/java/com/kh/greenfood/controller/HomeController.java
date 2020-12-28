package com.kh.greenfood.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
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
import com.kh.greenfood.domain.TestVo;
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
		List<ProductVo> productBestList = productService.getProductBest(6);
		model.addAttribute("productBestList", productBestList);
		model.addAttribute("mainProductCount", productBestList.size());
		
		/* 베스트 6 상품 목록 - 이미지 */
		List<ProductImageDto> productImageList = new ArrayList<>();
		for (ProductVo vo : productBestList) {
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
	
	@RequestMapping(value="/checkDupId/{user_id}", method=RequestMethod.GET)
	@ResponseBody
	public String checkDupId(@PathVariable("user_id") String user_id) {
		TestVo testVo = memberService.selectMember(user_id);
		System.out.println(testVo);
		String message = "";
		if(testVo == null) {
			message = "idDontExist";
		} else {
			message = "idExist";
		}
		return message;
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
	
	/*@RequestMapping(value="/")
	public String productShowHome(Model model) throws Exception {
		List<ProductVo> productList = productService.getProductList();
		System.out.println("--" + productList);
		model.addAttribute("productList", productList);
		return "home";
	}*/
	
}
