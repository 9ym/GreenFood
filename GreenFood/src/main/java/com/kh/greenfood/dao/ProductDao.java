package com.kh.greenfood.dao;

import java.util.List;

import com.kh.greenfood.domain.ProductCategoryDto;
import com.kh.greenfood.domain.ProductImageDto;
import com.kh.greenfood.domain.ProductVo;

public interface ProductDao {
	
	/* 상품 보기 */
	public ProductVo getProduct(String product_code);
	
	/* 상품 사진 보기 */
	public ProductImageDto getProductImage(String product_code);
	
	/* 상품 목록 (임시로 상품 전부 다) */
	public List<ProductVo> getProductList();
	
	/* 상품 사진 목록 (임시로 사진 전부 다) */
	public List<ProductImageDto> getProductImageList();
	
	/* 상품 목록 - 베스트 */
	public List<ProductVo> getProductBest(int best_count);
	
	/* 상품 목록 - 카테고리 별로 */
	public List<ProductVo> getProductCategory(String product_category);
	
	/* 상품 카테고리 목록 */
	public List<ProductCategoryDto> getCategory();
	
	/* 상품 추가 */
	public int insertProduct(ProductVo productVo);
	
	/* 상품 이미지 추가 */
	public int insertProductImage(ProductImageDto productImageDto);
	
	/* 제일 최근에 추가된 상품 */
	public ProductVo getProductLatest();
	
	/* 신상품 (현재 날짜 - ?일 < 등록된 상품) */
	public List<ProductVo> getLatestProduct(int conditionDate);
	
	/* 추천상품 (하트 많은 상품 목록) (임시로 주문 건수) */
	public List<ProductVo> getBestProduct(int conditionOrderCount);
	
	/* 세일상품 (유통기한 임박한 상품 목록) */
//	public List<ProductVo> getSaleProduct();
	
	/* 관련 상품(=카테고리) 랜덤으로 6개 */
	public List<ProductVo> getRelatedProduct(ProductVo productVo);
	
}
