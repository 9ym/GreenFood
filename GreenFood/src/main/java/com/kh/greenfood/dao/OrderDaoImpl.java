package com.kh.greenfood.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.domain.CartDto;

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
	
	/* 관리자 admin : ?일 이전에 생긴 tbl_cart 삭제 ?? */

}
