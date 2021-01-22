package com.kh.greenfood.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.greenfood.dao.ProductDao;
import com.kh.greenfood.domain.ProductCategoryDto;
import com.kh.greenfood.domain.ProductImageDto;
import com.kh.greenfood.domain.ProductVo;
import com.kh.greenfood.domain.ReviewVo;
import com.kh.greenfood.domain.SearchDto;
import com.kh.greenfood.domain.StarDto;

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
	public boolean insertProductAll(ProductVo productVo, ProductImageDto productImageDto, 
			int shelfLife, int saleRate, int salesDeadlines) {
		Boolean resultInsert = false;
		/* int 파라미터들 값이 0 이냐 아니냐에 따라서 DB에 넣을 때 다름 */
		int countProduct = productDao.insertProduct(productVo, shelfLife, saleRate, salesDeadlines);
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
	
	/* 추천상품 (별 많은 상품 목록) */
	@Override
	public List<ProductVo> getBestProduct(int conditionStarCount) {
		List<ProductVo> listBest = productDao.getBestProduct(conditionStarCount);
		return listBest;
	}
	
	/* 세일상품 (판매기한 임박한 상품 목록), 할인율 수정 */
	@Override
	public List<ProductVo> getSaleProduct(int deadline, int saleRate) {
		List<ProductVo> listSale = productDao.getSaleProduct(deadline);
		for (ProductVo vo : listSale) {
			if (vo.getProduct_sale_rate() < saleRate) {
				vo = productDao.updateSaleRate(saleRate, vo.getProduct_code());
			}
		}
		return listSale;
	}
	
	/* 관련 상품(=카테고리) 랜덤으로 6개 */
	@Override
	public List<ProductVo> getRelatedProduct(ProductVo productVo) {
		List<ProductVo> listRelated = productDao.getRelatedProduct(productVo);
		return listRelated;
	}
	
	/* 상품 후기 - 후기글, 평점 별, ... ;;; 후기글 서비스, 별점 서비스 따로??? */
	
	/* 후기 별점 -> 생성, 평균, 상품에 업데이트 */
	@Override
	@Transactional
	public int setStar(StarDto starDto) {
		int countCreate = productDao.createStar(starDto);
		int countUpdate = 0;
		if (countCreate > 0) {
			int star_avg = productDao.averageStar(starDto.getProduct_code());
			countUpdate = productDao.updateStar(star_avg, starDto.getProduct_code());
		}
		return countUpdate;
	}
	
	/* 관리자 : 상품 검색 */
	@Override
	public List<ProductVo> getSearchProduct(SearchDto searchDto) {
		List<ProductVo> listSearch = productDao.getSearchProduct(searchDto);
		return listSearch;
	}
	
	/* 관리자 : 상품 검색 - 총 갯수 */
	@Override
	public int getSearchProductCount(SearchDto searchDto) {
		int count = productDao.getSearchProductCount(searchDto);
		return count;
	}
	
	/* 해당 상품 판매 종료 */
	@Override
	public int endProduct(List<String> listProductCode) {
		int count = productDao.endProduct(listProductCode);
		return count;
	}
	
	/* 판매 종료 여부 확인 */
	@Override
	public int knowEndProduct(String product_code) {
		int count = productDao.knowEndProduct(product_code);
		return count;
	}

	@Override
	public List<ReviewVo> getReviewdListProduct(String product_title) throws Exception {
		List<ReviewVo> reviewListProduct = productDao.getReviewdListProduct(product_title);
		return reviewListProduct;
	}
	
	/* 해당 상품 다시 판매 */
	@Override
	public int startProduct(String product_code) {
		int count = productDao.startProduct(product_code);
		return count;
	}
	
	/* 상품 수정 + 이미지 수정 */
	@Override
	public String updateProduct(ProductVo productVo, ProductImageDto productImageDto, 
			HashMap<String, Object> mapShelfLife, HashMap<String, Object> mapSaleRate,
			HashMap<String, Object> mapSalesDeadlines, String isImage) {
		String updateResult = "";
		int countProductUpdate = productDao.updateProduct(productVo, mapShelfLife, mapSaleRate, mapSalesDeadlines);
		if (countProductUpdate > 0) {
			updateResult = "update_product";
			System.out.println("---"+ updateResult);
			System.out.println("==="+ productImageDto);
			if (productImageDto != null) {
				int countImageUpdate = productDao.updateProductImage(productImageDto, 
						productVo.getProduct_code(), isImage);
				if (countImageUpdate > 0) {
					updateResult = "update_all";
				}
			}
		} else {
			updateResult = "update_fail";
		}
		return updateResult;
	}
	
}
