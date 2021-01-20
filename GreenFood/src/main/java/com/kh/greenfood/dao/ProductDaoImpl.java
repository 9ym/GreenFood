package com.kh.greenfood.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.domain.ProductCategoryDto;
import com.kh.greenfood.domain.ProductImageDto;
import com.kh.greenfood.domain.ProductVo;
import com.kh.greenfood.domain.SearchDto;
import com.kh.greenfood.domain.StarDto;

@Repository
public class ProductDaoImpl implements ProductDao {
	
	private static final String NAMESPACE = "com.kh.greenfood.product.";
	
	@Inject
	private SqlSession sqlSession;

	/* 상품 보기 */
	@Override
	public ProductVo getProduct(String product_code) {
		ProductVo productVo = sqlSession.selectOne(NAMESPACE + "getProduct", product_code);
		return productVo;
	}
	
	/* 상품 사진 보기 */
	@Override
	public ProductImageDto getProductImage(String product_code) {
		ProductImageDto productImageDto = sqlSession.selectOne(NAMESPACE + "getProductImage", product_code);
		return productImageDto;
	}
	
	/* 상품 목록 (임시로 상품 전부 다) */
	@Override
	public List<ProductVo> getProductList() {
		List<ProductVo> productList = sqlSession.selectList(NAMESPACE + "getProductList");
		return productList;
	}
	
	/* 상품 사진 목록 (임시로 사진 전부 다) */
	@Override
	public List<ProductImageDto> getProductImageList() {
		List<ProductImageDto> productImageList = sqlSession.selectList(NAMESPACE + "getProductImageList");
		return productImageList;
	}
	
	/* 상품 목록 - 많이 팔린 순서 */
	@Override
	public List<ProductVo> getPopularProduct(int best_count) {
		List<ProductVo> productPopularList = sqlSession.selectList(NAMESPACE + "getPopularProduct", best_count);
		return productPopularList;
	}
	
	/* 상품 목록 - 카테고리 별로 */
	@Override
	public List<ProductVo> getProductCategory(String product_category) {
		List<ProductVo> productCategoryList = sqlSession.selectList(NAMESPACE + "getProductCategory", product_category);
		return productCategoryList;
	}
	
	/* 상품 카테고리 목록 */
	@Override
	public List<ProductCategoryDto> getCategory() {
		List<ProductCategoryDto> categoryList = sqlSession.selectList(NAMESPACE + "getCategory");
		return categoryList;
	}
	
	/* 상품 추가 */
	@Override
	public int insertProduct(ProductVo productVo) {
		int count = sqlSession.insert(NAMESPACE + "insertProduct", productVo);
		return count;
	}
	
	/* 상품 이미지 추가 */
	@Override
	public int insertProductImage(ProductImageDto productImageDto) {
		int count = sqlSession.insert(NAMESPACE + "insertProductImage", productImageDto);
		return count;
	}
	
	/* 제일 최근에 추가된 상품 */
	@Override
	public ProductVo getProductLatest() {
		ProductVo productVo = sqlSession.selectOne(NAMESPACE + "getProductLatest");
		return productVo;
	}
	
	/* 신상품 (현재 날짜 - ?일 < 등록된 상품) */
	@Override
	public List<ProductVo> getLatestProduct(int conditionDate) {
		List<ProductVo> listLatest = sqlSession.selectList(NAMESPACE + "getLatestProduct", conditionDate); 
		return listLatest;
	}
	
	/* 추천상품 (별 많은 상품 목록) */
	@Override
	public List<ProductVo> getBestProduct(int conditionStarCount) {
		List<ProductVo> listBest = sqlSession.selectList(NAMESPACE + "getBestProduct", conditionStarCount); 
		return listBest;
	}
	
	/* 세일상품 (판매기한 임박한 상품 목록) */
	@Override
	public List<ProductVo> getSaleProduct(int deadline) {
		List<ProductVo> listSale = sqlSession.selectList(NAMESPACE + "getSaleProduct", deadline);
		return listSale;
	}
	
	/* 할인율 수정*/
	@Override
	public ProductVo updateSaleRate(int saleRate, String product_code) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("saleRate", saleRate);
		map.put("product_code", product_code);
		ProductVo productVo = sqlSession.selectOne(NAMESPACE + "updateSaleRate", map);
		return productVo;
	}
	
	/* 관련 상품(=카테고리) 랜덤으로 6개 */
	@Override
	public List<ProductVo> getRelatedProduct(ProductVo productVo) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("product_category", productVo.getProduct_category());
		map.put("product_code", productVo.getProduct_code());
		List<ProductVo> listRelated = sqlSession.selectList(NAMESPACE + "getRelatedProduct", map);
		return listRelated;
	}
	
	/* 후기 별점 생성 */
	@Override
	public int createStar(StarDto starDto) {
		int count = sqlSession.insert(NAMESPACE + "createStar", starDto);
		return count;
	}
	
	/* 후기 별점 평균 */
	@Override
	public int averageStar(String product_code) {
		int star_avg = sqlSession.selectOne(NAMESPACE + "averageStar", product_code);
		return star_avg;
	}
	
	/* 후기 별점 평균값 -> 상품에 업데이트 */ 
	@Override
	public int updateStar(int star_avg, String product_code) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("star_avg", star_avg);
		map.put("product_code", product_code);
		int count = sqlSession.update(NAMESPACE + "updateStar", map);
		return count;
	}
	
	/* 관리자 : 상품 검색 */
	@Override
	public List<ProductVo> getSearchProduct(SearchDto searchDto) {
		List<ProductVo> listSearch = sqlSession.selectList(NAMESPACE + "getSearchProduct", searchDto);
		return listSearch;
	}
	
	/* 관리자 : 상품 검색 - 총 갯수 */
	@Override
	public int getSearchProductCount(SearchDto searchDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getSearchProductCount", searchDto);
		return count;
	}
	
	/* 해당 상품 삭제 */
	@Override
	public int endProduct(List<String> listProductCode) {
		int count = sqlSession.update(NAMESPACE + "endProduct", listProductCode);
		return count;
	}

}
