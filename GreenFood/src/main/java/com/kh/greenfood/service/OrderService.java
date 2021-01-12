package com.kh.greenfood.service;

import java.util.List;

import com.kh.greenfood.domain.CartDto;

public interface OrderService {

	/* 장바구니에 상품 추가 (중복 없으면 insert, 중복 있으면 update) */
	public String addCart(CartDto cartDto); 
	
	/* 장바구니 7일치 목록 */
	public List<CartDto> seeCartList(String user_id);
	
}