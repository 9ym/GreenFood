package com.kh.greenfood.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.greenfood.domain.OrderDetailDto;
import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.ProductCategoryDto;
import com.kh.greenfood.domain.ProductImageDto;
import com.kh.greenfood.domain.ProductVo;
import com.kh.greenfood.domain.SearchDto;
import com.kh.greenfood.domain.TestVo;
import com.kh.greenfood.service.AdminService;
import com.kh.greenfood.service.OrderService;
import com.kh.greenfood.service.ProductService;
import com.kh.greenfood.util.S3Util;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Inject
	private AdminService adminService;
	
	@Inject
	private ProductService productService;
	
	@Inject
	private OrderService orderService;
	
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
	public String orderManager(Model model, PagingDto pagingDto) throws Exception {
		int count = orderService.getTotalOrderListCount(pagingDto);	
		pagingDto.setTotalCount(count);
		pagingDto.setPagingInfo();
		List<OrderVo> orderTotalList = orderService.getTotalOrderList(pagingDto);
		model.addAttribute("pagingDto", pagingDto);
		model.addAttribute("orderTotalList", orderTotalList);
		return "/admin/orderManager";
	}
	
	// 관리자 customer 주문 상태 변경시키기
	@RequestMapping(value="/orderManager/changeState", method=RequestMethod.GET)
	public String orderMangerChangeState(Model model, OrderVo orderVo) throws Exception{
		String user_id = orderVo.getUser_id();
		String order_code = orderVo.getOrder_code();
		String order_state_dsc = orderVo.getOrder_state_dsc();
		int count = orderService.updateState(user_id, order_code, order_state_dsc);
		if(count > 0) {
			model.addAttribute("msg","stateChangeSuccess");
		}
		return "/admin/orderManager";
	}
	
	// 관리자 주문 코드 상세보기
	@RequestMapping(value="/orderManager/orderDetail/{order_code}", method=RequestMethod.GET)
	public String orderDetail(@PathVariable("order_code") String order_code, Model model) throws Exception{
			// 주문 상세 정보 -> 주문 리스트
			List<OrderDetailDto> productDetailInfo = orderService.getProductDetailList(order_code);
			getImgUrl(productDetailInfo, model);
			for(OrderDetailDto dto : productDetailInfo) {
				String product_code = dto.getProduct_code();
				int count = orderService.checkDeadLine(product_code);
				dto.setDead_line_count(count);
			}
			// 주문 상세 정보 -> 결제 정보
			OrderVo orderVo = orderService.getOrderUserInfo(order_code, null);
			int total = orderVo.getOrder_total_price();
			int sale = orderVo.getOrder_sale_price();
			int usePoint = orderVo.getOrder_point_use();
			int origin = total + sale + usePoint - 3000;
			orderVo.setOrder_origin_price(origin);
			model.addAttribute("productDetailInfo", productDetailInfo);
			model.addAttribute("orderVo", orderVo);
		return "/admin/orderDetail";
	}
	
	// 30일 이상 지난 장바구니 데이터들 삭제
	@RequestMapping(value="/deleteCartDate", method=RequestMethod.GET)
	@ResponseBody
	public int deleteCartDate(Model model) throws Exception{
		int count = orderService.deleteCartAdmin();
		return count;
	}
	
	/* 상품 관리 */
	/*@RequestMapping(value="/productList", method=RequestMethod.GET)
	public String productList(SearchDto searchDto, Model model) throws Exception {
		System.out.println("searchDto :" + searchDto);
		int count = productService.getSearchProductCount(searchDto);
		searchDto.setTotalCount(count);
		searchDto.setPagingInfo();
		model.addAttribute("searchDto", searchDto);
		 상품 카테고리 
		List<ProductCategoryDto> categoryList = productService.getCategory();
		model.addAttribute("categoryList", categoryList);
		 일단 상품 전부 다 
		List<ProductVo> productList = productService.getProductList();
		model.addAttribute("productListAll", productList);
		return "/admin/productList";
	}*/
	
	/* 상품 관리 - 검색 */
	@RequestMapping(value="/productSearchList", method=RequestMethod.GET)
	public String productSearchList(SearchDto searchDto, Model model) throws Exception {
		
		System.out.println("searchDto :" + searchDto);
		
		/* 상품 카테고리 */
		List<ProductCategoryDto> categoryList = productService.getCategory();
		model.addAttribute("categoryList", categoryList);

		/* 검색 조건 + 페이징 (1page에 10개만 보이기)*/
		int count = productService.getSearchProductCount(searchDto);
		searchDto.setTotalCount(count);
		searchDto.setPagingInfo();
		System.out.println("searchDto-set :" + searchDto);
		model.addAttribute("searchDto", searchDto);
		model.addAttribute("searchCount", count);
		
		/* 검색 결과 -> setPagingInfo() 후에 리스트 받기 */
		List<ProductVo> listSearch = productService.getSearchProduct(searchDto);
		model.addAttribute("productListAll", listSearch);
		
		return "/admin/productList";
	}
	
	/* 상품 등록 페이지 이동 */
	@RequestMapping(value="/productAddForm", method=RequestMethod.GET)
	public String productAddForm(Model model) throws Exception {
		/* 상품 카테고리 */
		List<ProductCategoryDto> categoryList = productService.getCategory();
		model.addAttribute("categoryList", categoryList);
		
		return "/admin/productAdd";
	}
	
	/* 상품 수정 페이지 이동 */
	@RequestMapping(value="/productUpdateForm/{product_code}", method=RequestMethod.GET) 
	public String productUpdate(@PathVariable("product_code") String product_code ,Model model) throws Exception {
		/* 상품 카테고리 */
		List<ProductCategoryDto> categoryList = productService.getCategory();
		model.addAttribute("categoryList", categoryList);
		
		/* 해당 상품 */
		ProductVo productVo = productService.getProduct(product_code);
		model.addAttribute("productVo", productVo);
		
		/* 해당 상품 이미지 */
		ProductImageDto imageDto = productService.getProductImage(product_code);
		model.addAttribute("imageDto", imageDto);
		
		/* 판매 종료 여부 확인 */
		int countEnd = productService.knowEndProduct(product_code);
		model.addAttribute("countEnd", countEnd);
		
		return "/admin/productUpdate";
	}
	
	/* 상품 관리 - 판매 종료 */
	@RequestMapping(value="/endProduct", method=RequestMethod.POST)
	@ResponseBody
	public String endProduct(@RequestParam(value="listEnd[]") List<String> listProductCode, 
			Model model) throws Exception {
		System.out.println("listProductCode :" + listProductCode);
		String resultMsg = "";
		int countEnd = productService.endProduct(listProductCode);
		if (countEnd > 0) {
			resultMsg = "end_success";
		} else {
			resultMsg = "end_fail";
		}
		return resultMsg;
	}
	
	/* img 링크 리스트 */
	private void getImgUrl(List<OrderDetailDto> listCartDto, Model model) throws Exception {
		List<String> listImgUrl = new ArrayList<>();
		for (OrderDetailDto dto : listCartDto) {
			String product_code = dto.getProduct_code();
			String category = productService.getProduct(product_code).getProduct_category();
			String fileName = productService.getProductImage(product_code).getImage_info_file_name();
			String imgUrl = S3Util.getImageUrl(fileName, category);
			listImgUrl.add(imgUrl);
		}
		model.addAttribute("imgList", listImgUrl);
	} 
	
}
