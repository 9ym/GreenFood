package com.kh.greenfood.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

}
