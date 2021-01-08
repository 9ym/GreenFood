package com.kh.greenfood.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.greenfood.dao.ProductDao;
import com.kh.greenfood.domain.ProductCategoryDto;
import com.kh.greenfood.domain.ProductImageDto;
import com.kh.greenfood.domain.ProductVo;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	private ProductDao productDao;

	/* 상품 보기 */
	@Override
	public ProductVo getProduct(String product_code) {
		ProductVo productVo = productDao.getProduct(product_code);
		return productVo;
	}
	
	/* 상품 사진 보기 */
	@Override
	public ProductImageDto getProductImage(String product_code) {
		ProductImageDto productImageDto = productDao.getProductImage(product_code);
		return productImageDto;
	}
	
	/* 상품 목록 (임시로 상품 전부 다) */
	@Override
	public List<ProductVo> getProductList() {
		List<ProductVo> productList = productDao.getProductList();
		return productList;
	}
	
	/* 상품 사진 목록 (임시로 사진 전부 다) */
	@Override
	public List<ProductImageDto> getProductImageList() {
		List<ProductImageDto> productImageList = productDao.getProductImageList();
		return productImageList;
	}

	/* 상품 목록 - 많이 팔린 순서 */
	@Override
	public List<ProductVo> getPopularProduct(int best_count) {
		List<ProductVo> popularList = productDao.getPopularProduct(best_count);
		return popularList;
	}
	
	/* 상품 목록 - 카테고리 별로 */
	@Override
	public List<ProductVo> getProductCategory(String product_category) {
		List<ProductVo> productCategoryList = productDao.getProductCategory(product_category);
		return productCategoryList;
	}
	
	/* 상품 카테고리 목록 */
	@Override
	public List<ProductCategoryDto> getCategory() {
		List<ProductCategoryDto> categoryList = productDao.getCategory();
		return categoryList;
	}
	
	/* 상품 등록 (ProductVo, ProductImageDto) */
	@Override
	@Transactional
	public boolean insertProductAll(ProductVo productVo, ProductImageDto productImageDto) {
		Boolean resultInsert = false;
		int countProduct = productDao.insertProduct(productVo);
		ProductVo productVoLatest = productDao.getProductLatest();
		if (countProduct > 0) {
			productImageDto.setProduct_code(productVoLatest.getProduct_code());
			System.out.println(productImageDto);
			int countImage = productDao.insertProductImage(productImageDto);
			if (countImage > 0) {
				resultInsert = true;
			}
		}
		return resultInsert;
	}
	
	/* 신상품 (현재 날짜 - ?일 < 등록된 상품) */
	@Override
	public List<ProductVo> getLatestProduct(int conditionDate) {
		List<ProductVo> listLatest = productDao.getLatestProduct(conditionDate);
		return listLatest;
	}
	
	/* 추천상품 (하트 많은 상품 목록) (임시로 주문 건수) */
	@Override
	public List<ProductVo> getBestProduct(int conditionOrderCount) {
		List<ProductVo> listBest = productDao.getBestProduct(conditionOrderCount);
		return listBest;
	}
	
	/* 세일상품 (판매기한 임박한 상품 목록) */
	@Override
	public List<ProductVo> getSaleProduct(int deadline) {
		List<ProductVo> listSale = productDao.getSaleProduct(deadline);
		return listSale;
	}
	
	/* 관련 상품(=카테고리) 랜덤으로 6개 */
	@Override
	public List<ProductVo> getRelatedProduct(ProductVo productVo) {
		List<ProductVo> listRelated = productDao.getRelatedProduct(productVo);
		return listRelated;
	}
	
}
