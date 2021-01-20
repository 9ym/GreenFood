package com.kh.greenfood.dao;

import java.util.List;

import com.kh.greenfood.domain.CartDto;
import com.kh.greenfood.domain.OrderDetailDto;
import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.PagingDto;

public interface OrderDao {
	
	/* 장바구니 cart */

	/* 장바구니에 상품 1개 넣기 */
	public int createCart(CartDto cartDto);
	
	/* 제일 최근에 생긴 장바구니 (바로결제 사용) */
	public CartDto getCartLatest();
	
	/* 장바구니 7일치, 불러오기 */
	public List<CartDto> getCartList(String user_id);

	/* 장바구니 7일치, 안에 중복 상품 있는지 */
	public CartDto findDup(String user_id, String product_code);
	
	/* 중복된 상품 정보 */ 
//	public CartDto getDup(String user_id, String product_code);
	
	/* 장바구니 7일치, 중복 상품 : 수량, 생성일 업데이트 */
	public int updateDup(String cart_no, int cart_quantity);
	
	/* 장바구니에서 상품 수량 수정 */
	public int updateQuantity(String cart_no, int cart_quantity);
	
	/* 장바구니에서 상품 지우기 */
	public int deleteCartProduct(String cart_no);
	
	/* 결제한 상품 : 장바구니에서 삭제 */
	public int deletePayedCart(List<String> listCartNo);
	
	/* 관리자 admin : ?일 이전에 생긴 tbl_cart 삭제 ?? - 매퍼는 있음 */
	
	
	
	/* 주문 order */
	
	/* 결제할 상품 목록 */
	public List<CartDto> getListCartPay (List<String> listCartNo);
	
	/* 결제 완료 - 주문 생성 */
	public int createOrder(OrderVo orderVo);
	
	/* 제일 최근에 결제된 주문 */
	public OrderVo getOrderLatest();
	
	/* 주문 상세 생성 */
	public int createOrderDetail(String order_code, String product_code, int order_quantity);
	
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

	/* admin 장바구니 30 이상 삭제 */
	public int deleteCartAdmin();
	
	/* admin 배송 상태변경 */
	public int updateState(String user_id, String order_code, String order_state_dsc);

	/* 판매기한 체크 */
	public int checkDeadLine(String product_code);
	
}
