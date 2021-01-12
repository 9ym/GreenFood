package com.kh.greenfood.controller;


import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.greenfood.domain.CartDto;
import com.kh.greenfood.domain.ProductImageDto;
import com.kh.greenfood.domain.ProductVo;
import com.kh.greenfood.domain.TestVo;
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
		List<String> listImgUrl = new ArrayList<>();
		List<ProductVo> listProduct = new ArrayList<>();
		for (CartDto dto : list) {
			String product_code = dto.getProduct_code();
			String category = productService.getProduct(product_code).getProduct_category();
			String fileName = productService.getProductImage(product_code).getImage_info_file_name();
			String imgUrl = S3Util.getImageUrl(fileName, category);
			listImgUrl.add(imgUrl);
			ProductVo vo = productService.getProduct(product_code);
			listProduct.add(vo);
		}
		model.addAttribute("cartList", list);
		model.addAttribute("imgList", listImgUrl);
		model.addAttribute("productList", listProduct);
		return "order/cartForm";
	}
	
	/* 장바구니에 상품 추가 */
	@RequestMapping(value="/addCart", method=RequestMethod.POST)
	@ResponseBody
	public String cartIn(String user_id, String product_code, int cart_quantity) throws Exception {
		CartDto cartDto = new CartDto(user_id, product_code, cart_quantity);
		System.out.println("cartDto :" + cartDto);
		String result = orderService.addCart(cartDto);
		return result;
	}
	
	/* 결제 */
	@RequestMapping(value="/pay", method=RequestMethod.GET)
	public String pay() throws Exception {
		return "order/payForm";
	}
	
}
