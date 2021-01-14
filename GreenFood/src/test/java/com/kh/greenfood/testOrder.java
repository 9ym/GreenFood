package com.kh.greenfood;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.greenfood.dao.OrderDao;
import com.kh.greenfood.domain.CartDto;
import com.kh.greenfood.service.OrderService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class testOrder {

	@Inject
	private OrderDao orderDao;
	
	@Inject
	private OrderService orderService;
	

	@Test
	public void testCreateCart() throws Exception {
//		CartDto dto = new CartDto("user", "1120", 5); // 견과류8
////		CartDto dto = new CartDto("user", "1003", 10); // 당근
//		int count = orderDao.createCart(dto);
//		System.out.println("count :" + count);
	}

	
	@Test
	public void testGetCartList() throws Exception {
		List<CartDto> list = orderDao.getCartList("user");
		System.out.println("list :" + list);
	}
	
	@Test
	public void testFineDup() throws Exception {
		CartDto dto = orderDao.findDup("user", "1300"); // 아무번호
		System.out.println("dup :" + dto);
	}
	

	@Test
	public void testAddCart() throws Exception {

//		CartDto dto = new CartDto("user", "1120", 11); // 견과류8 상품 11개 추가
//		CartDto dto = new CartDto("user", "1005", 5); // 당근 11개
//		String result = orderService.addCart(dto);
//		System.out.println("result :" + result);
	}

	
	
}
