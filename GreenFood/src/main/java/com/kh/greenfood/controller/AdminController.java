package com.kh.greenfood.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.ProductCategoryDto;
import com.kh.greenfood.domain.ProductVo;
import com.kh.greenfood.domain.SearchDto;
import com.kh.greenfood.domain.TestVo;
import com.kh.greenfood.service.AdminService;
import com.kh.greenfood.service.ProductService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Inject
	private AdminService adminService;
	
	@Inject
	private ProductService productService;
	
	// 회원 전체 정보 리스트
	@RequestMapping(value="/customerList", method=RequestMethod.GET)
	public String customerList(Model model, PagingDto pagingDto) throws Exception{
		int count = adminService.customerListCount(pagingDto);
		pagingDto.setTotalCount(count);
		pagingDto.setPagingInfo();
		List<TestVo> customerList = adminService.getCustomerList(pagingDto);
		model.addAttribute("customerList", customerList);
		model.addAttribute("pagingDto", pagingDto);
		return "/admin/customerList";
	}
	
	// 탈퇴한 회원 리스트 -> user_deleted 가 'Y'인 회원들만
	@RequestMapping(value="/deletedCustomerList", method=RequestMethod.POST)
	public String deletedCustomerList(Model model, PagingDto pagingDto) throws Exception{
		System.out.println("deletedCustomerList: " + pagingDto);
		int count = adminService.deletedCustomerListCount(pagingDto);
		pagingDto.setTotalCount(count);
		pagingDto.setPagingInfo();
		List<TestVo> customerList = adminService.getDeletedCustomerList(pagingDto);		
		model.addAttribute("customerList", customerList);
		model.addAttribute("pagingDto", pagingDto);
		return "/admin/customerList";
	}
	
	// 회원 강제 탈퇴 -> user_deleted 를 'N' 에서 'Y'로 바꾸는 작업만
	@RequestMapping(value="/deleteCustomer", method=RequestMethod.POST)
	public String deleteCustomer(String user_id, RedirectAttributes rttr) throws Exception {
		int count = adminService.deleteCustomer(user_id);
		if(count > 0) {
			rttr.addFlashAttribute("msg", "deleteComp");
		} else {
			rttr.addFlashAttribute("msg", "deleteFail");
		}
		return "redirect:/admin/customerList";
	}
	
	// 관리자 주문관리
	@RequestMapping(value="/orderManager", method=RequestMethod.GET)
	public String orderManager() throws Exception {
		
		return "/admin/orderManager";
	}
	
	/* 상품 관리 */
	@RequestMapping(value="/productList", method=RequestMethod.GET)
	public String productList(SearchDto searchDto, Model model) throws Exception {
		
		System.out.println("searchDto :" + searchDto);
		
		/* 상품 카테고리 */
		List<ProductCategoryDto> categoryList = productService.getCategory();
		model.addAttribute("categoryList", categoryList);
		
		/* 일단 상품 전부 다 */
		List<ProductVo> productList = productService.getProductList();
		model.addAttribute("productListAll", productList);
		
		return "/admin/productList";
	}
	
}
