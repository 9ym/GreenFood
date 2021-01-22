package com.kh.greenfood.dao;

import java.util.HashMap;
import java.util.List;

import com.kh.greenfood.domain.ProductCategoryDto;
import com.kh.greenfood.domain.ProductImageDto;
import com.kh.greenfood.domain.ProductVo;
import com.kh.greenfood.domain.SearchDto;
import com.kh.greenfood.domain.StarDto;

public interface ProductDao {
	
	/* 상품 보기 */
	public ProductVo getProduct(String product_code);
	
	/* 상품 사진 보기 */
	public ProductImageDto getProductImage(String product_code);
	
	/* 상품 목록 (임시로 상품 전부 다) */
	public List<ProductVo> getProductList();
	
	/* 상품 사진 목록 (임시로 사진 전부 다) */
	public List<ProductImageDto> getProductImageList();
	
	/* 상품 목록 - 많이 팔린 순서 */
	public List<ProductVo> getPopularProduct(int best_count);
	
	/* 상품 목록 - 카테고리 별로 */
	public List<ProductVo> getProductCategory(String product_category);
	
	/* 상품 카테고리 목록 */
	public List<ProductCategoryDto> getCategory();
	
	/* 상품 추가 */
	public int insertProduct(ProductVo productVo, int shelfLife, int saleRate, int salesDeadlines);
	
	/* 상품 이미지 추가 */
	public int insertProductImage(ProductImageDto productImageDto);
	
	/* 제일 최근에 추가된 상품 */
	public ProductVo getProductLatest();
	
	/* 신상품 (현재 날짜 - ?일 < 등록된 상품) */
	public List<ProductVo> getLatestProduct(int conditionDate);
	
	/* 추천상품 (평점 좋은 상품 목록) */
	public List<ProductVo> getBestProduct(int conditionStarCount);
	
	/* 세일상품 (판매기한 임박한 상품 목록) */
	public List<ProductVo> getSaleProduct(int deadline);
	
	/* 할인율 수정*/
	public ProductVo updateSaleRate(int saleRate, String product_code);
	
	/* 관련 상품(=카테고리) 랜덤으로 6개 */
	public List<ProductVo> getRelatedProduct(ProductVo productVo);
	
	/* 후기 별점 생성 */
	public int createStar(StarDto starDto);
	
	/* 후기 별점 평균 */
	public int averageStar(String product_code);
	
	/* 후기 별점 평균값 -> 상품에 업데이트 */
	public int updateStar(int star_avg, String product_code);
	
	/* 관리자 : 상품 검색 */
	public List<ProductVo> getSearchProduct(SearchDto searchDto);
	
	/* 관리자 : 상품 검색 - 총 갯수 */
	public int getSearchProductCount(SearchDto searchDto);
	
	/* 해당 상품 판매 종료 */
	public int endProduct(List<String> listProductCode);
		
	/* 판매 종료 여부 확인 */
	public int knowEndProduct(String product_code);
	
	/* 해당 상품 다시 판매 */
	public int startProduct(String product_code);
	
	/* 상품 수정 */
	public int updateProduct(ProductVo productVo, HashMap<String, Object> mapShelfLife, 
			HashMap<String, Object> mapSaleRate, HashMap<String, Object> mapSalesDeadlines);
	
	/* 상품 이미지 수정 */
	public int updateProductImage(ProductImageDto productImageDto, String product_code, String isImage);
	
}
