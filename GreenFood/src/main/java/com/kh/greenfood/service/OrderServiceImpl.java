package com.kh.greenfood.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.greenfood.dao.MemberDao;
import com.kh.greenfood.dao.OrderDao;
import com.kh.greenfood.domain.CartDto;
import com.kh.greenfood.domain.OrderDetailDto;
import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.CustomerVo;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Inject
	private OrderDao orderDao;
	
	@Inject
	private MemberDao memberDao;

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

	/* 장바구니에 상품 1개 넣고 확인 (바로결제 사용) */
	@Override
	public CartDto addCartOne(CartDto cartDto) {
		int count = orderDao.createCart(cartDto);
		CartDto newCartDto = null;
		if (count > 0) {
			newCartDto = orderDao.getCartLatest();
		}
		return newCartDto;
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
	
	/* 결제 완료 - 주문 전부 생성, 멤버 포인트 변경 */
	@Override
	@Transactional
	public boolean setOrder(OrderVo orderVo, List<String> listCartPay, CustomerVo customerVo, int finalPointUse) {
		/* 포인트 차감 */
		int countUpdate = 0;
		if (finalPointUse != 0) {
			int count = memberDao.insertPoint(customerVo.getUser_id(), finalPointUse, 104); // 104 : 포인트 사용
			if (count > 0) { // 원래 포인트 - 추가 포인트
				countUpdate = memberDao.updateUserPoint(customerVo.getUser_point() - finalPointUse, customerVo.getUser_id()); 
			}
		}
		
		/* 주문, 주문 상세 insert */
		int count = orderDao.createOrder(orderVo);
		if (count > 0) {
			OrderVo orderVoLatest = orderDao.getOrderLatest();
			String order_code = orderVoLatest.getOrder_code();
			
			int countAllResult = 0;
			List<CartDto> list = orderDao.getListCartPay(listCartPay);
			for (CartDto cartDto : list) {
				String product_code = cartDto.getProduct_code();
				int order_quantity = cartDto.getCart_quantity();
				int countDetail = orderDao.createOrderDetail(order_code, product_code, order_quantity);
				countAllResult += countDetail;
			}
			
			/* 장바구니 내용 삭제 : 장바구니 번호로 주문 상세 생성한 뒤에 */
			int countDelete = orderDao.deletePayedCart(listCartPay);
			
			/* 결제한 상품 수만큼 tbl_order_detail 생성 && 포인트 변경 && 장바구니 내용 삭제 */
			if (finalPointUse != 0 && countAllResult + countUpdate == list.size() + 1 
					&& countDelete == listCartPay.size()) {
				return true;
			} else if (finalPointUse == 0 && countAllResult == list.size() 
					&& countDelete == listCartPay.size()) {
				return true;
			} 
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
	
	/* 제일 최근에 결제 완료된 주문 */
	@Override
	public OrderVo getOrderLatest() {
		OrderVo orderVoLatest = orderDao.getOrderLatest();
		return orderVoLatest;
	}
	
	/* 주문자 Order State List */
	@Override
	public List<OrderVo> getOrderStateInfoList(String user_id, int order_state) {
		List<OrderVo> orderVoList = orderDao.getOrderStateInfoList(user_id, order_state);
		return orderVoList;
	}

	@Override
	public List<OrderVo> getTotalOrderList(PagingDto pagingDto) {
		List<OrderVo> orderTotalList = orderDao.getTotalOrderList(pagingDto);
		return orderTotalList;
	}
	
	@Override
	public int getTotalOrderListCount(PagingDto pagingDto) {
		int count = orderDao.getTotalOrderListCount(pagingDto);
		return count;
	}
	
	/* admin 장바구니 30일 이상 삭제*/
	@Override
	public int deleteCartAdmin() {
		int count = orderDao.deleteCartAdmin();
		return count;
	}
	
	/* admin 배송 상태변경 and 배송완료된 count에 따라 5면 gold 10이면 vip로 레벨 업 */
	@Override
	public int updateState(String user_id, String order_code, String order_state_dsc) {
		int count = orderDao.updateState(user_id, order_code, order_state_dsc);
		return count;
	}
	
	/* customer 배송 상태 변경 */
	@Override
	@Transactional
	public int updateState(String user_id, String order_code, String order_state, int user_level) {
		// 배송상태 배송중 -> 배송완료
		int count = orderDao.updateState(user_id, order_code, order_state);
		int levelUp = 0;
		if(count > 0) {
			List<OrderDetailDto> orderDetailList = orderDao.getProductDetailList(order_code);
			for(OrderDetailDto list : orderDetailList) {
				String product_code = list.getProduct_code();
				orderDao.updateOrderCount(product_code);
			}
		}
		// 주문 횟수 체크
		int orderCount = memberDao.orderCount(user_id);
		if(count > 0) {
			if(orderCount == 5 || orderCount == 10) {
				int count1 = memberDao.updateUserLevel(user_id, user_level + 1);
				if(count1 > 0) {
					levelUp = count1;
				}
			}
		}
		return levelUp;
	}

	/* 판매기한 체크 */
	@Override
	public int checkDeadLine(String product_code) {
		int count = orderDao.checkDeadLine(product_code);
		return count;
	}
	
}
