package com.kh.greenfood.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.amazonaws.services.simpleworkflow.flow.worker.SynchronousActivityTaskPoller;
import com.kh.greenfood.domain.CartDto;
import com.kh.greenfood.domain.OrderDetailDto;
import com.kh.greenfood.domain.OrderListCountDto;
import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.PointVo;
import com.kh.greenfood.domain.ProductCategoryDto;
import com.kh.greenfood.domain.TestVo;
import com.kh.greenfood.service.MemberService;
import com.kh.greenfood.service.OrderService;
import com.kh.greenfood.service.ProductService;
import com.kh.greenfood.util.S3Util;

@Controller
@RequestMapping(value="/customer")
public class CustomerController {
	
	@Inject
	private ProductService productService;
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private OrderService orderService;
	
	// 마이페이지 포워드
	@RequestMapping(value="/customerMyPage", method=RequestMethod.GET)
	public String customerMyPage(HttpSession session, Model model, RedirectAttributes rttr) throws Exception {
		TestVo testVo = (TestVo)session.getAttribute("testVo");
		String user_id = testVo.getUser_id();
		// 상품 전체보기 카테고리
		getProductCate(model);
		// 상품 전체 품목 OrderVo -> session
		List<OrderVo> orderedList = memberService.getOrderedList(user_id);
		model.addAttribute("orderedList", orderedList);
		// 최근 주문내역 List
		List<OrderVo> latestOrderedList = memberService.getLatestOrderedList(user_id);
		model.addAttribute("latestOrderedList", latestOrderedList);
		// 주문완료 횟수(배송완료 10003)
		int orderCount = memberService.orderCount(user_id);
		model.addAttribute("orderCount", orderCount);
		// 주문 상세 갯수(입금대기, 상품준비, 배송중, 배송완료)
		List<OrderListCountDto> customerOrderCountList = memberService.getCustomerOrderCountList(user_id);
		model.addAttribute("customerOrderCountList", customerOrderCountList);
		// 포인트 합계
		if(testVo.getUser_point() != 0) {
			int pointSum = memberService.getPointSum(user_id);
			testVo.setUser_point(pointSum);
		}
		return "customer/customerMyPage";
	}
	
	// 마이페이지 -> 등급별 혜택
	@RequestMapping(value="/customerMembership")
	public String customerMembership () throws Exception{
		return "customer/customerMembership";
	}
	
	// 마이페이지 -> 적립금 내역
	@RequestMapping(value="/customerPoint")
	public String customerPoint (HttpSession session, Model model) throws Exception{
		TestVo testVo = (TestVo)session.getAttribute("testVo");
		String user_id = testVo.getUser_id();
		List<PointVo> pointVo = memberService.getUserPoint(user_id);
		model.addAttribute("pointVo", pointVo);
		return "customer/customerPoint";
	}
	
	// 마이페이지 상의 주문내역 전체보기
	@RequestMapping(value="/customerOrderdList", method=RequestMethod.GET)
	public String customerOrderdList(HttpSession session, Model model) throws Exception{
		TestVo testVo = (TestVo)session.getAttribute("testVo");
		String user_id = testVo.getUser_id();
		List<OrderVo> orderedList = memberService.getOrderedList(user_id);
		model.addAttribute("orderedList", orderedList);
		return "customer/customerOrderdList";
	}
	
	// 마이페이지 상의 order_code 클릭시 주문상세 내역 보여주기
	@RequestMapping(value="/customerDetailOrder/{order_code}")
	public String customerDetailOrder(@PathVariable("order_code") String order_code, Model model, HttpSession session)throws Exception{
		TestVo testVo = (TestVo)session.getAttribute("testVo");
		String user_id = testVo.getUser_id();
		// 주문 상세 정보 -> 주문 리스트
		List<OrderDetailDto> productDetailInfo = orderService.getProductDetailList(order_code);
		model.addAttribute("productDetailInfo", productDetailInfo);
		
		getImgUrl(productDetailInfo, model);
		// 주문 상세 정보 -> 결제 정보
		OrderVo orderVo = orderService.getOrderUserInfo(order_code, user_id);
		int total = orderVo.getOrder_total_price();
		int sale = orderVo.getOrder_sale_price();
		int usePoint = orderVo.getOrder_point_use();
		int origin = total + sale + usePoint - 3000;
		orderVo.setOrder_origin_price(origin);
		model.addAttribute("orderVo", orderVo);
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
	
	// 마이페이지 -> 프로필 회원 정보 수정완료 버튼
	@RequestMapping(value="/customerProfileModifyRun", method=RequestMethod.POST)
	public String customerProfileModifyRun(HttpSession session, TestVo testVo, RedirectAttributes rttr) throws Exception{
		int count = memberService.customerModify(testVo);
		String page = "";
		if(count > 0) {
			testVo.setUser_pw(((TestVo)session.getAttribute("testVo")).getUser_pw());
			testVo.setUser_level(((TestVo)session.getAttribute("testVo")).getUser_level());
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
			page = "redirect:/customer/customerProfile";
		} else {
			rttr.addFlashAttribute("msg", "pwChangeFail");
			page = "redirect:/customer/customerProfile";
		}
		return page;
	}
	
	// 회원가입
	@RequestMapping(value="/customerMemberJoinRun", method=RequestMethod.POST)
	public String customerMemberJoinRun(TestVo testVo, RedirectAttributes rttr) throws Exception {
		// 회원가입시 포인트 1000점 부여
		testVo.setUser_point(1000);
		// 회원 코드 1002(구매자) 부여
		testVo.setUser_code("1002");
		System.out.println("joinRun: " + testVo);
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
	
	private void getProductCate (Model model) throws Exception{
		/* 상품 카테고리 */
		List<ProductCategoryDto> categoryList = productService.getCategory();
		model.addAttribute("categoryList", categoryList);
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
