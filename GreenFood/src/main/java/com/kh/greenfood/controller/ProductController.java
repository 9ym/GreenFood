package com.kh.greenfood.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.greenfood.domain.ProductImageDto;
import com.kh.greenfood.domain.ProductVo;
import com.kh.greenfood.service.ProductService;

@Controller
@RequestMapping(value="/product")
public class ProductController {
	
	@Inject
	private ProductService productService;

	@RequestMapping(value="/detail/{product_code}", method=RequestMethod.GET)
	public String detail(@PathVariable String product_code, /*@PathVariable String image_code,*/ Model model) throws Exception {
		ProductVo productVo = productService.getProduct(product_code);
		/* 일단 product_code -> home.jsp 이미지 1개만  */
		ProductImageDto productImageDto = productService.getProductImage(product_code); 
		model.addAttribute("productVo", productVo);
		model.addAttribute("productImageDto", productImageDto);
		return "product/productForm";
	}
	
}
