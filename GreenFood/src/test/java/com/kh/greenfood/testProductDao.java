package com.kh.greenfood;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.greenfood.dao.ProductDao;
import com.kh.greenfood.domain.ProductImageDto;
import com.kh.greenfood.domain.ProductVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class testProductDao {
	
	@Inject
	private ProductDao productDao;

	@Test
	public void testGetProduct() throws Exception {
		ProductVo productVo = productDao.getProduct("1001");
		System.out.println("productVo :" + productVo);
	}
	
	@Test
	public void testGetProductImage() throws Exception {
		ProductImageDto productImageDto = productDao.getProductImage("2001"); 
		System.out.println("productImageDto :" + productImageDto);
	}
	
}
