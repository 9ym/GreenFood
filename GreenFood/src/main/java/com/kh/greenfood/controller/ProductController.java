package com.kh.greenfood.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.greenfood.domain.ProductCategoryDto;
import com.kh.greenfood.domain.ProductImageDto;
import com.kh.greenfood.domain.ProductVo;
import com.kh.greenfood.service.ProductService;

@Controller
@RequestMapping(value="/product")
public class ProductController {
	
	@Inject
	private ProductService productService;

	/* 상품 상세 페이지 */
	@RequestMapping(value="/detail/{product_code}", method=RequestMethod.GET)
	public String detail(@PathVariable String product_code, Model model) throws Exception {
		/* 개별 상품에 대한 정보 */
		ProductVo productVo = productService.getProduct(product_code);
		ProductImageDto productImageDto = productService.getProductImage(product_code); 
		model.addAttribute("productVo", productVo);
		model.addAttribute("productImageDto", productImageDto);
		
		/* 베스트 상품 6개 */
		/*List<ProductVo> productBestList = productService.getProductBest(6);
		model.addAttribute("productBestList", productBestList);
		model.addAttribute("mainProductCount", productBestList.size());*/
		
		/* 같은 카테고리 상품 목록 */
//		List<ProductVo> productCategoryList = productService.getProductCategory(productVo.getProduct_category());
//		model.addAttribute("productCategoryList", productCategoryList);
		
		/* 관련 상품(=카테고리) 랜덤으로 6개 */
		List<ProductVo> listRelated = productService.getRelatedProduct(productVo);
		model.addAttribute("listRelated", listRelated);
//		System.out.println(listRelated);
		
		/* 관련 상품(=카테고리) 각각에 대한 ProductImageDto */
		List<ProductImageDto> productImageList = new ArrayList<>();
		for (ProductVo vo : listRelated) {
			String product_code_img = vo.getProduct_code();
			ProductImageDto imgdto = productService.getProductImage(product_code_img);
			productImageList.add(imgdto);
		}
		model.addAttribute("productImageList", productImageList);
//		System.out.println(productImageList);
		
		/* 상품 카테고리 */
		List<ProductCategoryDto> categoryList = productService.getCategory();
		model.addAttribute("categoryList", categoryList);
		
		return "product/productForm";
	}
	
	/* 카테고리에 따른 상품 목록 */
	@RequestMapping(value="/category/{product_category}", method=RequestMethod.GET)
	public String category(@PathVariable String product_category, Model model) throws Exception {
		/* 해당 카테고리 상품 목록 */
		List<ProductVo> productCategoryList = productService.getProductCategory(product_category);
		model.addAttribute("productList", productCategoryList);
		
		/* 같은 카테고리 내의 상품 각각에 대한 ProductImageDto */
		List<ProductImageDto> productImageList = new ArrayList<>();
		for (ProductVo vo : productCategoryList) {
			String product_code_img = vo.getProduct_code();
			ProductImageDto imgdto = productService.getProductImage(product_code_img);
			productImageList.add(imgdto);
		}
		model.addAttribute("productImageList", productImageList);
		
		/* 상품 카테고리 */
		List<ProductCategoryDto> categoryList = productService.getCategory();
		model.addAttribute("categoryList", categoryList);
		
		return "product/categoryListForm";
	}
	
	/* 신상품(상품 등록 날짜) new / 베스트(임시:주문 건수) best / 세일상품(유통기한) sale */
	@RequestMapping(value="/menu/{menu_type}", method=RequestMethod.GET)
	public String menu(@PathVariable String menu_type, Model model) throws Exception {
		/* 메뉴에 맞는 상품 목록 */
		List<ProductVo> list = null;
		switch (menu_type) {
		case "new":
			list = productService.getLatestProduct(14); // 현재 날짜로부터 2주 전까지 등록된 상품
			break;
		case "best":
			list = productService.getBestProduct(5); // 임시 : 주문 건수 5 이상부터
			break;
		case "sale":
			// 아직 노노
			break;
		}
		model.addAttribute("productList", list);
		
		/* 상품 각각에 대한 ProductImageDto */
		List<ProductImageDto> productImageList = new ArrayList<>();
		for (ProductVo vo : list) {
			String product_code_img = vo.getProduct_code();
			ProductImageDto imgdto = productService.getProductImage(product_code_img);
			productImageList.add(imgdto);
		}
		model.addAttribute("productImageList", productImageList);
		
		/* 상품 카테고리 */
		List<ProductCategoryDto> categoryList = productService.getCategory();
		model.addAttribute("categoryList", categoryList);
		
		return "product/menuListForm";
	}
	
}
