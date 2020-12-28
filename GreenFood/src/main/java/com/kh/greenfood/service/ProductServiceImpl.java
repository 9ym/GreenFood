package com.kh.greenfood.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.greenfood.dao.ProductDao;
import com.kh.greenfood.domain.ProductCategoryDto;
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
	
	@Override
	public List<ProductVo> getProductList() {
		List<ProductVo> productList = productDao.getProductList();
		return productList;
	}
	
	@Override
	public List<ProductImageDto> getProductImageList() {
		List<ProductImageDto> productImageList = productDao.getProductImageList();
		return productImageList;
	}

	@Override
	public List<ProductVo> getProductBest(int best_count) {
		List<ProductVo> productBestList = productDao.getProductBest(best_count);
		return productBestList;
	}
	
	@Override
	public List<ProductVo> getProductCategory(String product_category) {
		List<ProductVo> productCategoryList = productDao.getProductCategory(product_category);
		return productCategoryList;
	}
	
	@Override
	public List<ProductCategoryDto> getCategory() {
		List<ProductCategoryDto> categoryList = productDao.getCategory();
		return categoryList;
	}
	
}
