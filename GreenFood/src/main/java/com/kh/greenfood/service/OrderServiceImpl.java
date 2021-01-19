package com.kh.greenfood.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.greenfood.dao.OrderDao;
import com.kh.greenfood.domain.CartDto;
import com.kh.greenfood.domain.OrderDetailDto;
import com.kh.greenfood.domain.OrderVo;

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
	
	/* 결제할 상품 목록 */
	@Override
	public List<CartDto> getListCartPay(List<String> listCartNo) {
		List<CartDto> listCartPay = orderDao.getListCartPay(listCartNo);
		return listCartPay;
	}
	
	/* 결제 완료 - 주문 전부 생성 */
	@Override
	@Transactional
	public boolean setOrder(OrderVo orderVo, List<String> listCartPay) {
		int count = orderDao.createOrder(orderVo);
		if (count > 0) {
			OrderVo orderVoLatest = orderDao.getOrderLatest();
			System.out.println("gg-"+orderVoLatest);
			String order_code = orderVo.getOrder_code();
			
			List<CartDto> list = orderDao.getListCartPay(listCartPay);
//			System.out.println(list);
//			for (CartDto cartDto : list) {
//				String product_code = cartDto.getProduct_code();
//				int order_quantity = cartDto.getCart_quantity();
//				System.out.println(cartDto);
//				int countGG = orderDao.createOrderDetail(order_code, product_code, order_quantity);
//				System.out.println("ttt-"+countGG);
//				return true;
//			}
			
		}
		return false;
	}
	
	/* 오더 정보불러오기 */
	@Override
	public List<OrderDetailDto> getProductDetailList(String order_code) {
		List<OrderDetailDto> productDetailInfo = orderDao.getProductDetailList(order_code);
		return productDetailInfo;
	}
	

	/* 주문자 정보 */
	@Override
	public OrderVo getOrderUserInfo(String order_code, String user_id) {
		OrderVo orderVo = orderDao.getOrderUserInfo(order_code, user_id);
		return orderVo;
	}
	
}
