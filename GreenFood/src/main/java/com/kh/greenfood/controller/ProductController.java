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

	@RequestMapping(value="/detail/{product_code}", method=RequestMethod.GET)
	public String detail(@PathVariable String product_code, Model model) throws Exception {
		ProductVo productVo = productService.getProduct(product_code);
		ProductImageDto productImageDto = productService.getProductImage(product_code); 
		model.addAttribute("productVo", productVo);
		model.addAttribute("productImageDto", productImageDto);
		
		List<ProductVo> productBestList = productService.getProductBest(6);
		model.addAttribute("productBestList", productBestList);
		model.addAttribute("mainProductCount", productBestList.size());
		
		/*List<ProductImageDto> productImageList = productService.getProductImageList();
		model.addAttribute("productImageList", productImageList);*/
		List<ProductImageDto> productImageList = new ArrayList<>();
		for (ProductVo vo : productBestList) {
			String product_code_img = vo.getProduct_code();
			ProductImageDto imgdto = productService.getProductImage(product_code_img);
			productImageList.add(imgdto);
		}
		model.addAttribute("productImageList", productImageList);
		
		return "product/productForm";
	}
	
	@RequestMapping(value="/category/{product_category}", method=RequestMethod.GET)
	public String category(@PathVariable String product_category, Model model) throws Exception {
		List<ProductVo> productCategoryList = productService.getProductCategory(product_category);
		model.addAttribute("productCategoryList", productCategoryList);
		return "product/productCategory";
	}
	
}
