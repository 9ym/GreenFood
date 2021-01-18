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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.greenfood.domain.CartDto;
import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.ProductCategoryDto;
import com.kh.greenfood.domain.TestVo;
import com.kh.greenfood.service.MemberService;
import com.kh.greenfood.service.OrderService;
import com.kh.greenfood.service.ProductService;
import com.kh.greenfood.util.S3Util;

@Controller
@RequestMapping(value="/order")
public class OrderController {
	
	@Inject
	private OrderService orderService;
	
	@Inject
	private ProductService productService;
	
	/* 장바구니 이동 */
	@RequestMapping(value="/cart", method=RequestMethod.GET)
	public String cart(HttpSession session, Model model) throws Exception {
		TestVo testVo = (TestVo) session.getAttribute("testVo");
		List<CartDto> list = orderService.seeCartList(testVo.getUser_id());
		model.addAttribute("cartList", list);
		
		/* img 링크 리스트 */
		getImgUrl(list, model);
		
		/* 상품 카테고리 */
		List<ProductCategoryDto> categoryList = productService.getCategory();
		model.addAttribute("categoryList", categoryList);
		
		return "order/cartForm";
	}
	
	/* 장바구니에 상품 추가 */
	@RequestMapping(value="/addCart", method=RequestMethod.POST)
	@ResponseBody
	public String cartIn(String user_id, String product_code, String product_title, 
			int product_price, int product_sale_rate, int cart_quantity) throws Exception {
		CartDto cartDto = new CartDto(user_id, product_code, product_title, 
				product_price, product_sale_rate, cart_quantity);
		String result = orderService.addCart(cartDto);
		return result;
	}
	
	/* 장바구니에서 상품 갯수 수정 */
	@RequestMapping(value="/changeCartQuantity", method=RequestMethod.POST)
	@ResponseBody
	public String changeCartQuantity(String cart_no, int cart_quantity) throws Exception {
		String result = "changeCartQuantity fail";
		int count = orderService.updateQuantity(cart_no, cart_quantity);
		if (count > 0) {
			result = "changeCartQuantity success";
		}
		return result;
	}
	
	/* 장바구니에서 상품 지우기 */
	@RequestMapping(value="/deleteCartProduct", method=RequestMethod.POST)
	@ResponseBody
	public String deleteCartProduct(String cart_no) throws Exception {
		String result = "deleteCartProduct_fail";
		int count = orderService.deleteCartProduct(cart_no);
		if (count > 0) {
			result = "deleteCartProduct_success";
		}
		return result;
	}
	
	/* 결제 페이지 */
	@RequestMapping(value="/pay", method=RequestMethod.POST)
	public String pay(String totalPrice, String totalSale, @RequestParam(value="cart_no") List<String> listCartNo, 
			Model model, HttpSession session) throws Exception {
		
		/* 가격 정보 */
		List<String> listPrices = new ArrayList<>();
		listPrices.add(totalPrice);
		listPrices.add(totalSale);
		model.addAttribute("listPrices", listPrices);
		
		/* 회원 정보 */
		TestVo testVo = (TestVo) session.getAttribute("testVo");
		model.addAttribute("testVo", testVo);
		
		/* 결제할 상품 정보 */
		List<CartDto> listCartPay = orderService.getListCartPay(listCartNo);
		model.addAttribute("listCartPay", listCartPay);
		
		return "order/payForm";
	}
	
	/* 바로 결제 -> 결제 페이지 */
	@RequestMapping(value="/payImmediate", method=RequestMethod.POST)
	public void pay(CartDto cartDto, Model model, HttpSession session) throws Exception {
		
		TestVo testVo = (TestVo) session.getAttribute("testVo");
		cartDto.setUser_id(testVo.getUser_id());
//		model.addAttribute("listCartPay", listCartPay);
		
		System.out.println(cartDto);
		
		int price = cartDto.getProduct_price();
		int priceSale = 0;
		int sale = cartDto.getProduct_sale_rate();
		if (sale != 0) {
//			price = (int)(Math.ceil(price * ((100 - sale) / 100)));
			priceSale = (int)((price * (sale / 100)));
			price -= priceSale;
			System.out.println("priceSale : " + priceSale);
			System.out.println("price : " + price);
		}
		String totalPrice = String.valueOf(price * cartDto.getCart_quantity());
		String totalSale = String.valueOf(priceSale * cartDto.getCart_quantity());
		
		System.out.println("totalPrice : " + totalPrice);
		System.out.println("totalSale : " + totalSale);
		
		List<String> listCartNo = new ArrayList<>();
		listCartNo.add(cartDto.getCart_no());
		
		System.out.println("listCartNo : " + listCartNo);
		
//		return "order/payForm";
	}
	
	/* 결제 완료 */
	@RequestMapping(value="/payCompleted", method=RequestMethod.POST)
	@ResponseBody
	public String payCompleted(int finalTotalPrice, int finalSalePrice, int finalPointUse, String payResult,
			@RequestParam(value="listAddr[]") List<String> listAddr, 
			@RequestParam(value="listCartPay[]") List<String> listCartPay, HttpSession session) throws Exception {
		
		/* OrderVo에 필요한 값 */
		String order_state = "";
		String order_pay_method = "";
		switch (payResult) {
		case "pay_card":
			order_state = "10000"; // 상품준비중
			order_pay_method = "card"; // 카드
			break;
		case "pay_transfer":
			order_state = "10000"; // 상품준비중
			order_pay_method = "transfer"; // 계좌이체
			break;
		case "pay_notYet":
			order_state = "10001"; // 입금대기중
			order_pay_method = "deposit"; // 무통장입금
			break;
		}
		TestVo testVo = (TestVo) session.getAttribute("testVo");
		OrderVo orderVo = new OrderVo(testVo.getUser_id(), finalTotalPrice, finalSalePrice, finalPointUse, 
				order_state, listAddr.get(0), listAddr.get(1), listAddr.get(2), order_pay_method);
		
		/* DB에 결제 데이터 저장 : 주문, 포인트 변경 */
		boolean result = orderService.setOrder(orderVo, listCartPay, testVo, finalPointUse);
		
		String finalPayResult = "";
		if (result) {
			/* 포인트 사용 : 수정된 testVo로 session에 넣기 */
			session.removeAttribute("testVo");
			int user_point = testVo.getUser_point() - finalPointUse;
			testVo.setUser_point(user_point);
			session.setAttribute("testVo", testVo);
			System.out.println("use-"+testVo);
			
			/* 주문 상세 페이지 이동하는데 필요한 order_code */
			OrderVo orderVoLatest = orderService.getOrderLatest();
			String orderCodeLatest = orderVoLatest.getOrder_code();
			finalPayResult = orderCodeLatest;
		} else {
			finalPayResult = "pay_fail";
		}
		return finalPayResult;
	}
	
	/* img 링크 리스트 */
	private void getImgUrl(List<CartDto> listCartDto, Model model) throws Exception {
		List<String> listImgUrl = new ArrayList<>();
		for (CartDto dto : listCartDto) {
			String product_code = dto.getProduct_code();
			String category = productService.getProduct(product_code).getProduct_category();
			String fileName = productService.getProductImage(product_code).getImage_info_file_name();
			String imgUrl = S3Util.getImageUrl(fileName, category);
			listImgUrl.add(imgUrl);
		}
		model.addAttribute("imgList", listImgUrl);
	} 
	
	@RequestMapping(value="/ordDelivery/{order_state}", method=RequestMethod.GET)
	public String ordDelivery(@PathVariable("order_state") int order_state) throws Exception{
		System.out.println(order_state);
		return "";
	}
	
}
