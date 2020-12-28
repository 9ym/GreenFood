package com.kh.greenfood.service;

import java.util.List;

import com.kh.greenfood.domain.ProductCategoryDto;
import com.kh.greenfood.domain.ProductImageDto;
import com.kh.greenfood.domain.ProductVo;

public interface ProductService {
	
	/* 상품 보기 */
	public ProductVo getProduct(String product_code);
	
	/* 상품 사진 보기 */
	public ProductImageDto getProductImage(String product_code);
	
	/* 상품 목록 (임시로 상품 전부 다) */
	public List<ProductVo> getProductList();
	
	/* 상품 사진 목록 (임시로 사진 전부 다) */
	public List<ProductImageDto> getProductImageList();
	
	/* 상품 목록 - 잘 팔리는 6개 */
	public List<ProductVo> getProductBest(int best_count);
	
	/* 상품 목록 - 카테고리 별로 */
	public List<ProductVo> getProductCategory(String product_category);
	
	/* 상품 카테고리 목록 */
	public List<ProductCategoryDto> getCategory();
	
}
