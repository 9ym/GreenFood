package com.kh.greenfood.service;

import java.util.HashMap;
import java.util.List;

import com.kh.greenfood.domain.ProductCategoryDto;
import com.kh.greenfood.domain.ProductImageDto;
import com.kh.greenfood.domain.ProductVo;
import com.kh.greenfood.domain.ReviewVo;
import com.kh.greenfood.domain.SearchDto;
import com.kh.greenfood.domain.StarDto;

public interface ProductService {
	
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
	
	/* 상품 등록 (ProductVo, ProductImageDto) */
	public boolean insertProductAll(ProductVo productVo, ProductImageDto productImageDto,
			int shelfLife, int saleRate, int salesDeadlines);
	
	/* 신상품 (현재 날짜 - ?일 < 등록된 상품) */
	public List<ProductVo> getLatestProduct(int conditionDate);
	
	/* 추천상품 (별 많은 상품 목록) */
	public List<ProductVo> getBestProduct(int conditionStarCount);
	
	/* 세일상품 (판매기한 임박한 상품 목록), 할인율 수정 */
	public List<ProductVo> getSaleProduct(int deadline, int saleRate);
	
	/* 관련 상품(=카테고리) 랜덤으로 6개 */
	public List<ProductVo> getRelatedProduct(ProductVo productVo);
	
	/* 상품 후기 - 후기글, 평점 별, ... ;;; 후기글 서비스, 별점 서비스 따로??? */
	
	/* 후기 별점 -> 생성, 평균, 상품에 업데이트 */
	public int setStar(StarDto starDto);
	
	/* 관리자 : 상품 검색 */
	public List<ProductVo> getSearchProduct(SearchDto searchDto);
	
	/* 관리자 : 상품 검색 - 총 갯수 */
	public int getSearchProductCount(SearchDto searchDto);
	
	/* 해당 상품 판매 종료 */
	public int endProduct(List<String> listProductCode);
	
	/* 판매 종료 여부 확인 */
	public int knowEndProduct(String product_code);
	

	/* 리뷰 리스트 받아오기 */
	public List<ReviewVo> getReviewdListProduct(String product_code, int startRow, int endRow);

	/* 해당 상품 다시 판매 */
	public int startProduct(String product_code);
	
	/* 상품 수정 + 이미지 수정 */
	public String updateProduct(ProductVo productVo, ProductImageDto productImageDto, 
			HashMap<String, Object> mapShelfLife, HashMap<String, Object> mapSaleRate,
			HashMap<String, Object> mapSalesDeadlines, String isImage);

	/* 상품명으로 전체 검색 */
	public List<ProductVo> getSearchTitle(String product_title);
	
	/* 제일 최근에 추가된 상품 */
	public ProductVo getProductLatest();
	
}
