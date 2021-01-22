package com.kh.greenfood.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.domain.CartDto;
import com.kh.greenfood.domain.OrderDetailDto;
import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.PagingDto;

@Repository
public class OrderDaoImpl implements OrderDao {
	
	private static final String NAMESPACE = "com.kh.greenfood.order.";
	
	@Inject
	private SqlSession sqlSession;

	/* 장바구니에 상품 1개 넣기 */
	@Override
	public int createCart(CartDto cartDto) {
		int count = sqlSession.insert(NAMESPACE + "createCart", cartDto);
		return count;
	}

	/* 제일 최근에 생긴 장바구니 (바로결제 사용) */
	@Override
	public CartDto getCartLatest() {
		CartDto cartDto = sqlSession.selectOne(NAMESPACE + "getCartLatest");
		return cartDto;
	}
	
	/* 장바구니 7일치, 불러오기 */
	@Override
	public List<CartDto> getCartList(String user_id) {
		List<CartDto> list = sqlSession.selectList(NAMESPACE + "getCartList", user_id);
		return list;
	}
	
	/* 장바구니 7일치, 안에 중복 상품 있는지 */
	@Override
	public CartDto findDup(String user_id, String product_code) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("product_code", product_code);
		CartDto cartDto = sqlSession.selectOne(NAMESPACE + "findDup", map);
		return cartDto;
	}
	
	/* 장바구니 7일치, 중복 상품 : 수량, 생성일 업데이트 */
	@Override
	public int updateDup(String cart_no, int cart_quantity) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cart_no", cart_no);
		map.put("cart_quantity", cart_quantity);
		int count = sqlSession.update(NAMESPACE + "updateDup", map);
		return count;
	}
	
	/* 장바구니에서 상품 수량 수정 */
	@Override
	public int updateQuantity(String cart_no, int cart_quantity) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cart_no", cart_no);
		map.put("cart_quantity", cart_quantity);
		int count = sqlSession.update(NAMESPACE + "updateQuantity", map);
		return count;
	}
	
	/* 장바구니에서 상품 지우기 */
	@Override
	public int deleteCartProduct(String cart_no) {
		int count = sqlSession.delete(NAMESPACE + "deleteCartProduct", cart_no);
		return count;
	}
	
	/* 결제한 상품 : 장바구니에서 삭제 */
	@Override
	public int deletePayedCart(List<String> listCartNo) {
		int count = sqlSession.delete(NAMESPACE + "deletePayedCart", listCartNo);
		return count;
	}
	
	/* 관리자 admin : ?일 이전에 생긴 tbl_cart 삭제 ?? */
	
	/* 결제할 상품 목록 */
	@Override
	public List<CartDto> getListCartPay(List<String> listCartNo) {
		List<CartDto> listCartpay = sqlSession.selectList(NAMESPACE + "getListCartPay", listCartNo);
		return listCartpay;
	}
	
	/* 결제 완료 - 주문 생성 */
	@Override
	public int createOrder(OrderVo orderVo) {
		int count = sqlSession.insert(NAMESPACE + "createOrder", orderVo);
		return count;
	}
	
	/* 제일 최근에 결제된 주문 */
	@Override
	public OrderVo getOrderLatest() {
		OrderVo orderVo = sqlSession.selectOne(NAMESPACE + "getOrderLatest");
		return orderVo;
	}
	
	/* 주문 상세 생성 */
	@Override
	public int createOrderDetail(String order_code, String product_code, int order_quantity) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("order_code", order_code);
		map.put("product_code", product_code);
		map.put("order_quantity", order_quantity);
		int count = sqlSession.insert(NAMESPACE + "createOrderDetail", map);
		return count;
	}
	
	/* 마이페이지 상세내역 오더정보 불러오기 */
	@Override
	public List<OrderDetailDto> getProductDetailList(String order_code) {
		List<OrderDetailDto> productDetailInfo = sqlSession.selectList(NAMESPACE + "getProductDetailList",order_code);
		return productDetailInfo;
	}

	/* 주문자 정보 */
	@Override
	public OrderVo getOrderUserInfo(String order_code, String user_id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("order_code", order_code);
		map.put("user_id", user_id);
		OrderVo orderVo = sqlSession.selectOne(NAMESPACE + "getOrderUserInfo", map);
		return orderVo;
	}
	
	/* 주문자 Order State List */
	@Override
	public List<OrderVo> getOrderStateInfoList(String user_id, int order_state) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("order_state", order_state);
		map.put("user_id", user_id);
		List<OrderVo> orderVoList = sqlSession.selectList(NAMESPACE + "getOrderStateInfoList", map);
		return orderVoList;
	}

	/* admin 고객 주문 리스트 */
	@Override
	public List<OrderVo> getTotalOrderList(PagingDto pagingDto) {
		List<OrderVo> orderTotalList = sqlSession.selectList(NAMESPACE + "getTotalOrderList", pagingDto);
		return orderTotalList;
	}
	
	/* admin 주문관리 토탈 카운트 */
	@Override
	public int getTotalOrderListCount(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getTotalOrderListCount", pagingDto);
		return count;
	}
	
	/* admin 장바구니 30일 이상 삭제 */
	@Override
	public int deleteCartAdmin() {
		int count = sqlSession.delete(NAMESPACE + "deleteCartAdmin");
		return count;
	}
	
	/* admin 배송 상태변경 */
	@Override
	public int updateState(String user_id, String order_code, String order_state_dsc) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("order_code", order_code);
		map.put("order_state_dsc", order_state_dsc);
		int count = sqlSession.update(NAMESPACE + "updateState", map);
		return count;
	}

	/* 판매기한 체크*/
	@Override
	public int checkDeadLine(String product_code) {
		int count = sqlSession.selectOne(NAMESPACE + "checkDeadLine", product_code);
		return count;
	}

}
