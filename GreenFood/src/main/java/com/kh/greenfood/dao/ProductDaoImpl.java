package com.kh.greenfood.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.domain.ProductCategoryDto;
import com.kh.greenfood.domain.ProductImageDto;
import com.kh.greenfood.domain.ProductVo;

@Repository
public class ProductDaoImpl implements ProductDao {
	
	private static final String NAMESPACE = "com.kh.greenfood.product.";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public ProductVo getProduct(String product_code) {
		ProductVo productVo = sqlSession.selectOne(NAMESPACE + "getProduct", product_code);
		return productVo;
	}
	
	@Override
	public ProductImageDto getProductImage(String product_code) {
		ProductImageDto productImageDto = sqlSession.selectOne(NAMESPACE + "getProductImage", product_code);
		return productImageDto;
	}
	
	@Override
	public List<ProductVo> getProductList() {
		List<ProductVo> productList = sqlSession.selectList(NAMESPACE + "getProductList");
		return productList;
	}
	
	@Override
	public List<ProductImageDto> getProductImageList() {
		List<ProductImageDto> productImageList = sqlSession.selectList(NAMESPACE + "getProductImageList");
		return productImageList;
	}
	
	@Override
	public List<ProductVo> getProductBest(int best_count) {
		List<ProductVo> productBestList = sqlSession.selectList(NAMESPACE + "getProductBest", best_count);
		return productBestList;
	}
	
	@Override
	public List<ProductVo> getProductCategory(String product_category) {
		List<ProductVo> productCategoryList = sqlSession.selectList(NAMESPACE + "getProductCategory", product_category);
		return productCategoryList;
	}
	
	@Override
	public List<ProductCategoryDto> getCategory() {
		List<ProductCategoryDto> categoryList = sqlSession.selectList(NAMESPACE + "getCategory");
		return categoryList;
	}
	
	@Override
	public int insertProduct(ProductVo productVo) {
		int count = sqlSession.insert(NAMESPACE + "insertProduct", productVo);
		return count;
	}
	
	@Override
	public int insertProductImage(ProductImageDto productImageDto) {
		int count = sqlSession.insert(NAMESPACE + "insertProductImage", productImageDto);
		return count;
	}
	
	@Override
	public ProductVo getProductLatest() {
		ProductVo productVo = sqlSession.selectOne(NAMESPACE + "getProductLatest");
		return productVo;
	}

}
