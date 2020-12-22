package com.kh.greenfood.service;

import com.kh.greenfood.domain.ProductImageDto;
import com.kh.greenfood.domain.ProductVo;

public interface ProductService {
	
	/* 상품 보기 */
	public ProductVo getProduct(String product_code);
	
	/* 상품 사진 보기 */
	public ProductImageDto getProductImage(String product_code);
}
