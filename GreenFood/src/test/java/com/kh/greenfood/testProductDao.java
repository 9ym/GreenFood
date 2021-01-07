package com.kh.greenfood;


import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.greenfood.dao.ProductDao;
import com.kh.greenfood.domain.ProductCategoryDto;
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
	
	@Test
	public void testGetProductBest() throws Exception {
		List<ProductVo> bestList = productDao.getProductBest(3);
		System.out.println("bestList :" + bestList);
	}
	
	@Test
	public void testGetProductCategory() throws Exception {
		List<ProductVo> categoryList = productDao.getProductCategory("2002");
		System.out.println("categoryList :" + categoryList);
	}
	
	@Test
	public void testGetCategory() throws Exception {
		List<ProductCategoryDto> list = productDao.getCategory();
		System.out.println("category :" + list);
	}
	
	@Test
	public void testInsertProduct() throws Exception {
		ProductVo vo = new ProductVo("2001", "잡곡4", 2500, 30, "잡곡 잡곡 잡곡", "ㄱㅇㅇㄴㄷㄹㄴ 잡곡", "50g", "10kg", "수입산");
		int count = productDao.insertProduct(vo);
		System.out.println("count :" + count);
	}
	
	@Test
	public void testInsertProductImage() throws Exception {
		ProductImageDto dto = new ProductImageDto("1101", "ggg.jpg", "ttt.png");
		int count = productDao.insertProductImage(dto);
		System.out.println("count :" + count);
	}
	
	@Test
	public void testLatest() throws Exception {
		List<ProductVo> list = productDao.getLatestProduct(10);
		System.out.println(list);
	}
	
	@Test
	public void testBest() throws Exception {
		List<ProductVo> list = productDao.getProductBest(5);
		System.out.println(list);
	}
	
}
