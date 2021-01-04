package com.kh.greenfood.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.greenfood.domain.ProductCategoryDto;
import com.kh.greenfood.domain.ProductImageDto;
import com.kh.greenfood.domain.ProductVo;
import com.kh.greenfood.service.ProductService;
import com.kh.greenfood.util.S3Util;
import com.kh.greenfood.util.UploadFileUtils;

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
		List<ProductVo> productBestList = productService.getProductBest(6);
		model.addAttribute("productBestList", productBestList);
		model.addAttribute("mainProductCount", productBestList.size());
		
		/* 베스트 상품 각각에 대한 ProductImageDto */
		List<ProductImageDto> productImageList = new ArrayList<>();
		for (ProductVo vo : productBestList) {
			String product_code_img = vo.getProduct_code();
			ProductImageDto imgdto = productService.getProductImage(product_code_img);
//			imgdto.setImage_info_file_name(S3Util.getImageUrl(imgdto.getImage_info_file_name(), vo.getProduct_category()));
//			imgdto.setImage_content_file_name(S3Util.getImageUrl(imgdto.getImage_content_file_name(), vo.getProduct_category()));
//			System.out.println(imgdto);
			productImageList.add(imgdto);
		}
		model.addAttribute("productImageList", productImageList);
		
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
		model.addAttribute("productCategoryList", productCategoryList);
		
		/* 상품 카테고리 */
		List<ProductCategoryDto> categoryList = productService.getCategory();
		model.addAttribute("categoryList", categoryList);
		
		return "product/productCategory";
	}
	
	@RequestMapping(value="/fileInputTest", method=RequestMethod.GET)
	public void test() throws Exception { }
	
	@RequestMapping(value="/fileTest", method=RequestMethod.POST)
	public String fileInput(@RequestParam("file") MultipartFile file, 
							@RequestParam("file2") MultipartFile file2,
							ProductVo vo) throws Exception {
		System.out.println("file 이름 :" + file.getOriginalFilename());
		System.out.println("file2 이름 :" + file2.getOriginalFilename());
//		System.out.println("product_category :" + product_category);
		
		vo.setProduct_order_count(100);
		System.out.println("vo :" + vo);
		
		File f = new File(file.getOriginalFilename());
		file.transferTo(f);
		File f2 = new File(file2.getOriginalFilename());
		file2.transferTo(f2);
		
		System.out.println(f);
		System.out.println(f2);
		
		ProductImageDto dto = new ProductImageDto(file.getOriginalFilename(), file2.getOriginalFilename());
		
		System.out.println(dto);
		
		boolean result = productService.insertProductAll(vo, dto);
		System.out.println("result :" + result);
		
		if (result == true) {
			S3Util.fileUpload(f, file.getOriginalFilename(), vo.getProduct_category());
			S3Util.fileUpload(f2, file2.getOriginalFilename(), vo.getProduct_category());
		}
		
//		S3Util.fileUpload(f, file.getOriginalFilename(), product_category);
//		S3Util.fileDelete(file2.getOriginalFilename());
		
//		UploadFileUtils.calcPath("C:\\Users\\KH302\\Downloads");
		
		return "product/fileInputTest";
	}
	
}
