package com.kh.greenfood.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.ProductCategoryDto;
import com.kh.greenfood.domain.ProductImageDto;
import com.kh.greenfood.domain.ProductVo;
import com.kh.greenfood.domain.ReviewVo;
import com.kh.greenfood.service.ProductService;
import com.kh.greenfood.service.ReviewService;

@Controller
@RequestMapping(value="/product")
public class ProductController {
	
	@Inject
	private ProductService productService;
	
	@Inject
	private ReviewService reviewService;

	/* 상품 상세 페이지 */
	@RequestMapping(value="/detail/{product_code}", method=RequestMethod.GET)
	public String detail(@PathVariable String product_code, Model model, PagingDto pagingDto) throws Exception {
		/* 리뷰 페이징 */
		int count = reviewService.getProductReviewCount(product_code);
		pagingDto.setTotalCount(count);
		pagingDto.setPerPage(5);
		pagingDto.setPagingInfo();
		model.addAttribute("pagingDto", pagingDto);
		
		/* 개별 상품에 대한 정보 */
		ProductVo productVo = productService.getProduct(product_code);
		ProductImageDto productImageDto = productService.getProductImage(product_code); 
		model.addAttribute("productVo", productVo);
		model.addAttribute("productImageDto", productImageDto);
		
		/* 관련 상품(=카테고리) 랜덤으로 6개 */
		List<ProductVo> listRelated = productService.getRelatedProduct(productVo);
		model.addAttribute("listRelated", listRelated);
		
		addProductImageDtoList(listRelated, model);
		addProductCategoryList(model);
		
		
		return "product/productForm";
	}
	
	/* 카테고리에 따른 상품 목록 */
	@RequestMapping(value="/category/{product_category}", method=RequestMethod.GET)
	public String category(@PathVariable String product_category, Model model) throws Exception {
		/* 해당 카테고리 상품 목록 */
		List<ProductVo> productCategoryList = productService.getProductCategory(product_category);
		model.addAttribute("productList", productCategoryList);
		
		addProductImageDtoList(productCategoryList, model);
		addProductCategoryList(model);
		
		return "product/categoryListForm";
	}
	
	/* 신상품(상품 등록 날짜) new / 베스트(임시:주문 건수) best / 세일상품(판매기한) sale */
	@RequestMapping(value="/menu/{menu_type}", method=RequestMethod.GET)
	public String menu(@PathVariable String menu_type, Model model) throws Exception {
		/* 메뉴에 맞는 상품 목록 */
		List<ProductVo> menuList = null;
		switch (menu_type) {
		case "new":
			menuList = productService.getLatestProduct(14); // 현재 날짜로부터 2주 전까지 등록된 상품
			break;
		case "best":
			menuList = productService.getBestProduct(3); // 임시 : 별점 3 이상부터
			break;
		case "sale":
			menuList = productService.getSaleProduct(14, 10); // 현재 날짜로부터 2주, 10% 할인
			break;
		}
		model.addAttribute("productList", menuList);
		
		addProductImageDtoList(menuList, model);
		addProductCategoryList(model);
		
		return "product/menuListForm";
	}
	
	/* 상품명으로 전체 검색 */
	@RequestMapping(value="/searchTitle/{product_title}", method=RequestMethod.GET)
	public String getSearchTitle(@PathVariable String product_title, Model model) throws Exception {
		/* 비슷한 상품명 리스트 + 이미지 리스트 */
		List<ProductVo> listSearchTitle = productService.getSearchTitle(product_title);
		model.addAttribute("productList", listSearchTitle);
		addProductImageDtoList(listSearchTitle, model);
		
		/* 검색 결과 메세지 */
		String result = "";
		if (listSearchTitle.size() != 0) {
			result = "isList";
		} else {
			result = "noList";
		}
		model.addAttribute("msgResult", result);
		
		/* 검색 내용 넘기기 */
		model.addAttribute("searchTitle", product_title);
		
		addProductCategoryList(model);
		
		return "product/menuListForm";
	}
	
	/* 상품 각각에 대한 ProductImageDto */
	private void addProductImageDtoList(List<ProductVo> productList, Model model) throws Exception {
		List<ProductImageDto> listImageDto = new ArrayList<>();
		for (ProductVo vo : productList) {
			String product_code = vo.getProduct_code();
			ProductImageDto imgDto = productService.getProductImage(product_code);
			listImageDto.add(imgDto);
		}
		model.addAttribute("productImageList", listImageDto);
	}
	
	/* 상품 카테고리 */
	private void addProductCategoryList(Model model) throws Exception {
		List<ProductCategoryDto> categoryList = productService.getCategory();
		model.addAttribute("categoryList", categoryList);
	}
	
	// -------------------------- 후기 선택하면 후기 리스트 가져오기 --------------------------------
	@RequestMapping(value="/review/getReviewdListProduct", method=RequestMethod.POST)
	@ResponseBody
	public List<ReviewVo> getReviewdListProduct(String review_no, String product_code, Model model, HttpSession session, int startRow, int endRow, PagingDto pagingDto, int page) throws Exception {
		pagingDto.setPage(page);
		List<ReviewVo> reviewListProduct = productService.getReviewdListProduct(product_code, startRow, endRow);
		model.addAttribute("reviewListProduct", reviewListProduct);
		return reviewListProduct;
	}
	
}
