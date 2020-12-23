package com.kh.greenfood.dao;

import java.util.List;

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
	
}
