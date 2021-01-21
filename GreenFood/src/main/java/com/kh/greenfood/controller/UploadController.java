package com.kh.greenfood.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.greenfood.domain.ProductCategoryDto;
import com.kh.greenfood.domain.ProductImageDto;
import com.kh.greenfood.domain.ProductVo;
import com.kh.greenfood.service.ProductService;
import com.kh.greenfood.util.S3Util;

@Controller
@RequestMapping(value="/upload")
public class UploadController {
	
	@Inject
	private ProductService productService;

	/* 상품 등록 페이지 이동 
	@RequestMapping(value="/productAddForm", method=RequestMethod.GET)
	public String productAddForm(Model model) throws Exception {
		 상품 카테고리 
		List<ProductCategoryDto> categoryList = productService.getCategory();
		model.addAttribute("categoryList", categoryList);
		
		return "/admin/productAdd";
	}*/
	
	/* 상품 등록 -> ProductVo, ProductImageDto DB 생성 + 이미지 s3 업로드 */
	@RequestMapping(value="/productAdd", method=RequestMethod.POST)
	public String productAdd(@RequestParam("file") MultipartFile file, @RequestParam("file2") MultipartFile file2,
			Model model, ProductVo vo, int shelfLife, int saleRate, int salesDeadlines) throws Exception {
		
		System.out.println("in in in in in");
		System.out.println("vo:" + vo);
		System.out.println("shelfLife:" + shelfLife);
		System.out.println("saleRate:" + saleRate);
		System.out.println("salesDeadlines:" + salesDeadlines);
		System.out.println("file 이름 :" + file.getOriginalFilename());
		System.out.println("file2 이름 :" + file2.getOriginalFilename());
		
		/* 상품 카테고리 */
		List<ProductCategoryDto> categoryList = productService.getCategory();
		model.addAttribute("categoryList", categoryList);
		
		/* 일단 상품 전부 다 */ 
		List<ProductVo> productList = productService.getProductList();
		model.addAttribute("productListAll", productList);
		
		/* img 파일 변환 - ProductImageDto 생성 */
		File f = new File(file.getOriginalFilename());
		file.transferTo(f);
		File f2 = new File(file2.getOriginalFilename());
		file2.transferTo(f2);
		ProductImageDto dto = new ProductImageDto(file.getOriginalFilename(), file2.getOriginalFilename());
		
		/* ProductVo, ProductImageDto DB 생성 */
		boolean result = productService.insertProductAll(vo, dto, shelfLife, saleRate, salesDeadlines);
		System.out.println("result :" + result);
		
		/* 상품 등록 성공 -> 이미지 s3 업로드 */
		String resultMsg = "";
		if (result == true) {
			S3Util.fileUpload(f, file.getOriginalFilename(), vo.getProduct_category());
			S3Util.fileUpload(f2, file2.getOriginalFilename(), vo.getProduct_category());
			resultMsg = "add_success";
		} else {
			resultMsg = "add_fail";
		}
		model.addAttribute("resultMsg", resultMsg);
//		S3Util.fileDelete(file2.getOriginalFilename()); 
		// 이미지 삭제... 아마 사용할 일 없을것  상품-판매 종료, 아예 삭제는 안 함
//		UploadFileUtils.calcPath("C:\\Users\\KH302\\Downloads"); 
		
		return "/admin/productAdd";
	}
	
	/* s3에 업로드 된 이미지 파일  url 얻기 */
	@RequestMapping(value="/getImageUrl", method=RequestMethod.POST)
	@ResponseBody
	public String getUrl(String fileName, String category) throws Exception {
		fileName = S3Util.getImageUrl(fileName, category);
		return fileName;
	}
	
}
