package com.kh.greenfood.service;

import java.util.List;

import com.kh.greenfood.domain.CartDto;
import com.kh.greenfood.domain.OrderDetailDto;
import com.kh.greenfood.domain.OrderVo;

public interface OrderService {

	/* 장바구니에 상품 추가 (중복 없으면 insert, 중복 있으면 update) */
	public String addCart(CartDto cartDto); 
	
	/* 장바구니 7일치 목록 */
	public List<CartDto> seeCartList(String user_id);
	
	/* 장바구니에서 상품 수량 수정 */
	public int updateQuantity(String cart_no, int cart_quantity);
	
	/* 장바구니에서 상품 지우기 */
	public int deleteCartProduct(String cart_no);

	/* 결제할 상품 목록 */
	public List<CartDto> getListCartPay (List<String> listCartNo);
	
	/* 결제 완료 - 주문 전부 생성 */
	public boolean setOrder(OrderVo orderVo, List<String> listCartPay);
	
	/* 오더 정보 불러오기 */
	public List<OrderDetailDto> getProductDetailList (String order_code);

	/* 주문자 정보 */
	public OrderVo getOrderUserInfo(String order_code, String user_id);
	
}
