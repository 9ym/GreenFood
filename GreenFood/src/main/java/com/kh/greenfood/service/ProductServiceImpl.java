package com.kh.greenfood.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.greenfood.dao.ProductDao;
import com.kh.greenfood.domain.ProductImageDto;
import com.kh.greenfood.domain.ProductVo;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	private ProductDao productDao;

	@Override
	public ProductVo getProduct(String product_code) {
		ProductVo productVo = productDao.getProduct(product_code);
		return productVo;
	}
	
	@Override
	public ProductImageDto getProductImage(String product_code) {
		ProductImageDto productImageDto = productDao.getProductImage(product_code);
		return productImageDto;
	}

}
