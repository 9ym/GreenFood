package com.kh.greenfood.controller;

import java.io.File;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.greenfood.domain.ProductImageDto;
import com.kh.greenfood.domain.ProductVo;
import com.kh.greenfood.service.ProductService;
import com.kh.greenfood.util.S3Util;

@Controller
@RequestMapping(value="/upload")
public class UploadController {
	
	@Inject
	private ProductService productService;

	@RequestMapping(value="/fileInputTest", method=RequestMethod.GET)
	public String test() throws Exception {
		return "/product/fileInputTest";
	}
	
	/* 상품 등록 -> ProductVo, ProductImageDto DB 생성 + 이미지 s3 업로드 */
	@RequestMapping(value="/fileTest", method=RequestMethod.POST)
	public String fileInput(@RequestParam("file") MultipartFile file, 
							@RequestParam("file2") MultipartFile file2, ProductVo vo) throws Exception {
		System.out.println("file 이름 :" + file.getOriginalFilename());
		System.out.println("file2 이름 :" + file2.getOriginalFilename());
		
//		vo.setProduct_order_count(200);
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
		
//		S3Util.fileDelete(file2.getOriginalFilename());
		
//		UploadFileUtils.calcPath("C:\\Users\\KH302\\Downloads");
		
		return "product/fileInputTest";
	}
	
	/* s3에 업로드 된 이미지 파일  url 얻기 */
	@RequestMapping(value="/getImageUrl", method=RequestMethod.POST)
	@ResponseBody
	public String getUrl(String fileName, String category) throws Exception {
		fileName = S3Util.getImageUrl(fileName, category);
//		System.out.println("fileName :" + fileName);
//		System.out.println("category :" + category);
		return fileName;
	}
	
}
