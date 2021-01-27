package com.kh.greenfood.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.greenfood.domain.OrderDetailDto;
import com.kh.greenfood.domain.OrderListCountDto;
import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.PointVo;
import com.kh.greenfood.domain.ProductCategoryDto;
import com.kh.greenfood.domain.ReviewVo;
import com.kh.greenfood.domain.CustomerVo;
import com.kh.greenfood.service.MemberService;
import com.kh.greenfood.service.OrderService;
import com.kh.greenfood.service.PointService;
import com.kh.greenfood.service.ProductService;
import com.kh.greenfood.service.ReviewService;
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
	
	@Inject
	private ReviewService reviewService;
	
	@Inject
	private PointService pointService;
	
	private final int SILVER = 0;
	
	private final int GOLD = 1;
	
	private final int VIP = 2;
	
	private final int BUY = 101;
	
	// 마이페이지 포워드
	@RequestMapping(value="/customerMyPage", method=RequestMethod.GET)
	public String customerMyPage(HttpSession session, Model model, RedirectAttributes rttr) throws Exception {
		CustomerVo customerVo = (CustomerVo)session.getAttribute("customerVo");
		String user_id = customerVo.getUser_id();
		// 상품 전체보기 카테고리
		getProductCate(model);
		// 상품 전체 품목 OrderVo -> session
		List<OrderVo> orderedList = memberService.getOrderedList(user_id);
		model.addAttribute("orderedList", orderedList);
		// 최근 주문내역 List
		List<OrderVo> latestOrderedList = memberService.getLatestOrderedList(user_id);
		model.addAttribute("latestOrderedList", latestOrderedList);
		// 주문완료 횟수(배송완료 10003)에 따라 5회면 silver->gold 10회면 gold -> vip
		int orderCount = memberService.orderCount(user_id);
		model.addAttribute("orderCount", orderCount);
		// 주문 상세 갯수(입금대기, 상품준비, 배송중, 배송완료)
		List<OrderListCountDto> customerOrderCountList = memberService.getCustomerOrderCountList(user_id);
		model.addAttribute("customerOrderCountList", customerOrderCountList);
		// 포인트 합계
		List<PointVo> pointVo = memberService.getUserPoint(user_id);
		int sum = 0;
		for(PointVo pto : pointVo) {
			int point = pto.getPoint_score();
			int ptocode = pto.getPoint_category();
			if(ptocode != 104) {
				sum += point;
			} else if (ptocode == 104) {
				sum -= point;
			}
		}
		customerVo.setUser_point(sum);
		// 후기 갯수
		int count = reviewService.getReviewCount(user_id);
		model.addAttribute("reviewCount", count);
		return "customer/customerMyPage";
	}
	
	// 마이페이지 -> 등급별 혜택
	@RequestMapping(value="/customerMembership")
	public String customerMembership (Model model) throws Exception{
		getProductCate(model);
		return "customer/customerMembership";
	}
	
	// 마이페이지 -> 적립금 내역
	@RequestMapping(value="/customerPoint")
	public String customerPoint (HttpSession session, Model model) throws Exception{
		getProductCate(model);
		CustomerVo customerVo = (CustomerVo)session.getAttribute("customerVo");
		String user_id = customerVo.getUser_id();
		List<PointVo> pointVo = memberService.getUserPoint(user_id);
		model.addAttribute("pointVo", pointVo);
		return "customer/customerPoint";
	}
	
	// 마이페이지 상의 주문내역 전체보기
	@RequestMapping(value="/customerOrderdList", method=RequestMethod.GET)
	public String customerOrderdList(HttpSession session, Model model) throws Exception{
		getProductCate(model);
		CustomerVo customerVo = (CustomerVo)session.getAttribute("customerVo");
		String user_id = customerVo.getUser_id();
		List<OrderVo> orderedList = memberService.getOrderedList(user_id);
		model.addAttribute("orderedList", orderedList);
		return "customer/customerOrderdList";
	}
	
	// 마이페이지 상의 order_code 클릭시 주문상세 내역 보여주기
	@RequestMapping(value="/customerDetailOrder/{order_code}", method=RequestMethod.GET)
	public String customerDetailOrder(@PathVariable("order_code") String order_code, Model model, HttpSession session)throws Exception{
		CustomerVo customerVo = (CustomerVo)session.getAttribute("customerVo");
		String user_id = customerVo.getUser_id();
		List<Integer> listCount = reviewService.productReviewsCount(order_code);
		model.addAttribute("listCount", listCount);
//		boolean reviewExist;
//		if(listCount > 0) {
//			reviewExist = true;
//			model.addAttribute("reviewExist", reviewExist);
//		} else {
//			reviewExist = false;
//			model.addAttribute("reviewExist", reviewExist);
//		}
		
		// 전체보기 카테고리
		getProductCate(model);
		// 주문 상세 정보 -> 주문 리스트
		List<OrderDetailDto> productDetailInfo = orderService.getProductDetailList(order_code);
		for(OrderDetailDto dto : productDetailInfo) {
			String product_code = dto.getProduct_code();
			int count = orderService.checkDeadLine(product_code);
			dto.setDead_line_count(count);
		}
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
	
	/* customer 배송중->배송완료  customer 주문횟수 5라면 level gold 주문횟수 10이라면 level vip*/
	@RequestMapping(value="/completedDeliveryRun", method=RequestMethod.GET)
	public String completedDeliveryRun(String order_code, String order_state, int order_total_price, HttpSession session, RedirectAttributes rttr) throws Exception {
		CustomerVo customerVo = (CustomerVo)session.getAttribute("customerVo");
		String user_id = customerVo.getUser_id();
		int user_level = customerVo.getUser_level();
		/* user_level에 따라 포인트 % 지급*/
		double percent = 0;
		int discount = 0;
		String page = "";
		switch(user_level) {
			case SILVER:
				percent = 5 * 0.01;
				discount = (int) (percent * order_total_price);
				int count = pointService.insertPoint(user_id, BUY, discount);
				memberService.updateUserPoint(user_id, discount);
				if(count > 0) {
					page = "redirect:/customer/customerDetailOrder/" + order_code;
				}
				break;
			case GOLD:
				percent = 10 * 0.01;
				discount = (int) (percent * order_total_price);
				int count1 = pointService.insertPoint(user_id, BUY, discount);
				memberService.updateUserPoint(user_id, discount);
				if(count1 > 0) {
					page = "redirect:/customer/customerDetailOrder/" + order_code;
				}
				break;
			case VIP:
				percent = 15 * 0.01;
				discount = (int) (percent * order_total_price);
				int count2 = pointService.insertPoint(user_id, BUY, discount);
				memberService.updateUserPoint(user_id, discount);
				if(count2 > 0) {
					page = "redirect:/customer/customerDetailOrder/" + order_code;
				}
				break;
		}
		int levelUp = orderService.updateState(user_id, order_code, order_state, user_level);
		if(levelUp > 0) {
			customerVo.setUser_level(user_level + 1);
			rttr.addFlashAttribute("msg", "levelUp");
		}
		return page;
	}

	// 회원가입 포워드
	@RequestMapping(value="/customerMemberJoinForm")
	public String customerMemberJoinForm() throws Exception{
		return "customer/customerMemberJoinForm";
	}
	
	// 마이페이지 내에 프로필 포워드
	@RequestMapping(value="/customerProfile")
	public String customerProfile(Model model) throws Exception{
		getProductCate(model);
		return "customer/customerProfile";
	}
	
	// 마이페이지 -> 프로필 session의 password와 입력된 password 비교 
	@RequestMapping(value="/customerProfileRun", method=RequestMethod.POST)
	@ResponseBody
	public String customerProfileRun(HttpSession session, String user_pw) throws Exception{
		CustomerVo customerVo = (CustomerVo)session.getAttribute("customerVo");
		// 비동기 요청 성공시 success, 실패시 fail
		if (customerVo.getUser_pw().equals(user_pw)) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 마이페이지 -> 프로필 회원 정보 수정완료 버튼
	@RequestMapping(value="/customerProfileModifyRun", method=RequestMethod.POST)
	public String customerProfileModifyRun(HttpSession session, CustomerVo customerVo, RedirectAttributes rttr) throws Exception{
		int count = memberService.customerModify(customerVo);
		String page = "";
		if(count > 0) {
			customerVo.setUser_pw(((CustomerVo)session.getAttribute("customerVo")).getUser_pw());
			customerVo.setUser_level(((CustomerVo)session.getAttribute("customerVo")).getUser_level());
			session.setAttribute("customerVo", customerVo);
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
		CustomerVo customerVo = (CustomerVo)session.getAttribute("customerVo");
		String user_id = customerVo.getUser_id();
		CustomerVo customerVo1 = memberService.login(user_id, presentPw);
		// 비동기 요청 비밀번호 같을시 equals, 아닐시 fail
		if(customerVo1 != null) {
			return "equals";
		} else {
			return "fail";
		}
	}
	
	// 마이페이지 -> 프로필 비밀번호 변경
	@RequestMapping(value="/customerProfilePwChange", method=RequestMethod.POST)
	public String customerProfilePwChange(HttpSession session,String user_pw, RedirectAttributes rttr) throws Exception{
		CustomerVo customerVo = (CustomerVo)session.getAttribute("customerVo");
		String user_id = customerVo.getUser_id();
		int count = memberService.changePw(user_id, user_pw);
		String page = "";
		if(count > 0) {
			customerVo.setUser_pw(user_pw);
			session.setAttribute("customerVo", customerVo);
			rttr.addFlashAttribute("msg", "pwChangeSuccess");
			page = "redirect:/customer/customerProfile";
		} else {
			rttr.addFlashAttribute("msg", "pwChangeFail");
			page = "redirect:/customer/customerProfile";
		}
		return page;
	}
	
	// 마이페이지 -> 주문상태 클릭했을시 리스트 보여주기
	@RequestMapping(value="/customerOrdStateList/{order_state}", method=RequestMethod.GET)
	public String ordDelivery(@PathVariable("order_state") int order_state, HttpSession session, Model model) throws Exception{
		getProductCate(model);
		CustomerVo customerVo = (CustomerVo)session.getAttribute("customerVo");
		String user_id = customerVo.getUser_id();
		List<OrderVo> orderVoList = orderService.getOrderStateInfoList(user_id, order_state);
		model.addAttribute("orderVoList", orderVoList);
		return "/customer/customerOrdStateList";
	}
	
	// 마이페이지 -> 후기
	@RequestMapping(value="/customerReview", method=RequestMethod.GET)
	public String getReview(HttpSession session, Model model) throws Exception{
		CustomerVo customerVo = (CustomerVo)session.getAttribute("customerVo");
		String user_id = customerVo.getUser_id();
		List<ReviewVo> reviewVoList = reviewService.getReviewList(user_id);
		model.addAttribute("reviewVoList", reviewVoList);
		return "/customer/customerReview";
	}
	
	// 회원가입
	@RequestMapping(value="/customerMemberJoinRun", method=RequestMethod.POST)
	public String customerMemberJoinRun(CustomerVo customerVo, RedirectAttributes rttr) throws Exception {
		// 회원가입시 포인트 1000점 부여
		customerVo.setUser_point(1000);
		// 회원 코드 1002(구매자) 부여
		customerVo.setUser_code("1002");
		int count = memberService.insertMember(customerVo);
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
