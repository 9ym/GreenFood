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
import com.kh.greenfood.domain.ReviewVo;
import com.kh.greenfood.domain.SearchDto;
import com.kh.greenfood.domain.StarDto;
import com.kh.greenfood.service.ProductService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class testProduct {
	
	@Inject
	private ProductDao productDao;
	
	@Inject
	private ProductService productService;

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
		List<ProductVo> popularList = productDao.getPopularProduct(3);
		System.out.println("bestList :" + popularList);
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
		ProductVo vo = new ProductVo("2001", "aaa222", 999, "ㄷㄷㄷ", "ㅁㅁㅁ", "10g", "1봉지", "수입");
		int shelfLife = 0;
		int saleRate = 25;
		int salesDeadlines = 0;
		int count = productDao.insertProduct(vo, shelfLife, saleRate, salesDeadlines);
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
		List<ProductVo> list = productDao.getBestProduct(10);
		System.out.println(list);
	}
	
	@Test
	public void testSale() throws Exception {
		List<ProductVo> list = productDao.getSaleProduct(5);
		System.out.println(list);
	}
	
	@Test
	public void testSetService() throws Exception {
		StarDto dto = new StarDto();
		dto.setUser_id("user");
		dto.setOrder_code("202101060007");
		dto.setProduct_code("1003");
		dto.setStar_point(2);
		productService.setStar(dto);
	}
	
	@Test
	public void testGetSearchProduct() throws Exception {
		SearchDto dto = new SearchDto("star", "all", "desc", ""); // 레몬은 된다...
		List<ProductVo> listSearch = productDao.getSearchProduct(dto);
		System.out.println(listSearch);
	}
	
	@Test
	public void testGetReviewdListProduct() throws Exception {
		List<ReviewVo> reviewListproduct = productDao.getReviewdListProduct("1243", 1, 5);
		System.out.println("reviewListproduct : " + reviewListproduct);
	}
	
	@Test
	public void testGetSearchTitle() throws Exception {
		List<ProductVo> list = productDao.getSearchTitle("고");
		System.out.println("list :" + list);
	}
	
}
