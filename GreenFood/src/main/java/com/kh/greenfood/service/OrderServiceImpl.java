package com.kh.greenfood.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.greenfood.dao.OrderDao;
import com.kh.greenfood.domain.CartDto;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Inject
	private OrderDao orderDao;

	/* 장바구니에 상품 추가 (중복 없으면 insert, 중복 있으면 update) */
	@Override
	@Transactional
	public String addCart(CartDto cartDto) {
		String addCartResult = "";
		CartDto cartDup = orderDao.findDup(cartDto.getUser_id(), cartDto.getProduct_code()); 
		if (cartDup == null) {
			int count = orderDao.createCart(cartDto);
			if (count != 0) {
				addCartResult = "newCart";
			}
		} else {
			int cart_quantity = cartDup.getCart_quantity() + cartDto.getCart_quantity();
			int count = orderDao.updateDup(cartDup.getCart_no(), cart_quantity);
			if (count != 0) {
				addCartResult = "dupCart";
			}
		}
		return addCartResult;
	}

	/* 장바구니 7일치 목록 */
	@Override
	public List<CartDto> seeCartList(String user_id) {
		List<CartDto> list = orderDao.getCartList(user_id);
		return list;
	}

	/* 장바구니에서 상품 수량 수정 */
	@Override
	public int updateQuantity(String cart_no, int cart_quantity) {
		int count = orderDao.updateQuantity(cart_no, cart_quantity);
		return count;
	}
	
	/* 장바구니에서 상품 지우기 */
	@Override
	public int deleteCartProduct(String cart_no) {
		int count = orderDao.deleteCartProduct(cart_no);
		return count;
	}
	
}
