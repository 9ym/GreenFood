package com.kh.greenfood.service;

import java.util.List;

import com.kh.greenfood.domain.CartDto;
import com.kh.greenfood.domain.OrderDetailDto;
import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.TestVo;

public interface OrderService {

	/* 장바구니에 상품 추가 (중복 없으면 insert, 중복 있으면 update) */
	public String addCart(CartDto cartDto); 
	
	/* 장바구니에 상품 1개 넣고 확인 (바로결제 사용) */
	public CartDto addCartOne(CartDto cartDto);
	
	/* 장바구니 7일치 목록 */
	public List<CartDto> seeCartList(String user_id);
	
	/* 장바구니에서 상품 수량 수정 */
	public int updateQuantity(String cart_no, int cart_quantity);
	
	/* 장바구니에서 상품 지우기 */
	public int deleteCartProduct(String cart_no);

	/* 결제할 상품 목록 */
	public List<CartDto> getListCartPay (List<String> listCartNo);
	
	/* 결제 완료 - 주문 전부 생성, 멤버 포인트 변경 */
	public boolean setOrder(OrderVo orderVo, List<String> listCartPay, TestVo testVo, int finalPointUse);
	
	/* 제일 최근에 결제 완료된 주문 */
	public OrderVo getOrderLatest();
	
	/* 오더 정보 불러오기 */
	public List<OrderDetailDto> getProductDetailList (String order_code);

	/* 주문자 정보 */
	public OrderVo getOrderUserInfo(String order_code, String user_id);

	/* 주문자 Order State List */
	public List<OrderVo> getOrderStateInfoList(String user_id, int order_state);

	/* admin 주문 관리 - 주문 전체 정보 */
	public List<OrderVo> getTotalOrderList(PagingDto pagingDto);
	
	/* admin 주문 전체 카운트 */
	public int getTotalOrderListCount(PagingDto pagingDto);

	/* admin 장바구니 30일 이상 삭제 */
	public int deleteCartAdmin();
	
	/* admin 배송 상태변경 */
	public int updateState(String user_id, String order_code, String order_state_dsc);

	/* 판매기한 체크 */
	public int checkDeadLine(String product_code);
	
}
