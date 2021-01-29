package com.kh.greenfood.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	/* 상품 등록 -> ProductVo, ProductImageDto DB 생성 + 이미지 s3 업로드 */
	@RequestMapping(value="/productAdd", method=RequestMethod.POST)
	public String productAdd(@RequestParam("file") MultipartFile file, @RequestParam("file2") MultipartFile file2,
			Model model, ProductVo vo, int shelfLife, int saleRate, int salesDeadlines, RedirectAttributes rttr) throws Exception {
		
		/* img 파일 변환 - ProductImageDto 생성 */
		File f = new File(file.getOriginalFilename());
		file.transferTo(f);
		File f2 = new File(file2.getOriginalFilename());
		file2.transferTo(f2);
		ProductImageDto dto = new ProductImageDto(file.getOriginalFilename(), file2.getOriginalFilename());
		
		/* ProductVo, ProductImageDto DB 생성 */
		boolean result = productService.insertProductAll(vo, dto, shelfLife, saleRate, salesDeadlines);
		
		/* 상품 등록 성공 -> 이미지 s3 업로드 */
		String resultMsg = "";
		if (result == true) {
			S3Util.fileUpload(f, file.getOriginalFilename(), vo.getProduct_category());
			S3Util.fileUpload(f2, file2.getOriginalFilename(), vo.getProduct_category());
			resultMsg = "add_success";
		} else {
			resultMsg = "add_fail";
		}
		rttr.addFlashAttribute("reaultMsg", resultMsg);
		
		/* 상품 카테고리 */
		List<ProductCategoryDto> categoryList = productService.getCategory();
		model.addAttribute("categoryList", categoryList);
		
		ProductVo voLatest = productService.getProductLatest();
		
		/* 방금 막 등록한 관리자-상품 페이지로 이동 */
		return "redirect:/admin/productUpdateForm/" + voLatest.getProduct_code();
	}
	
	/* 상품 수정 -> ProductVo, ProductImageDto DB 수정 + 이미지 s3 삭제 후 업로드 */
	@RequestMapping(value="/productUpdate", method=RequestMethod.POST)
	public String productUpdate(@RequestParam("file") MultipartFile file, @RequestParam("file2") MultipartFile file2,
		ProductVo vo, int shelfLife, int saleRate, int salesDeadlines, 
		String shelfLifeStr, String saleRateStr, String salesDeadlinesStr,
		String categoryOrigin, String isImage , Model model, RedirectAttributes rttr) throws Exception {
		
		/* 상품 카테고리 */
		List<ProductCategoryDto> categoryList = productService.getCategory();
		model.addAttribute("categoryList", categoryList);
		
		/* 원래 ProductImageDto */
		ProductImageDto imageDtoOrigin = productService.getProductImage(vo.getProduct_code());
		
		/* img 파일 변환 - ProductImageDto 생성 */
		ProductImageDto imageDtoUpdate = null;
		File f = null;
		File f2 = null;
		switch (isImage) {
		case "isInfo" :
			f = new File(file.getOriginalFilename());
			file.transferTo(f);
			imageDtoUpdate = new ProductImageDto(vo.getProduct_code(), file.getOriginalFilename(), null);
			break;
		case "isContent" :
			f2 = new File(file2.getOriginalFilename());
			file2.transferTo(f2);
			imageDtoUpdate = new ProductImageDto(vo.getProduct_code(), null, file2.getOriginalFilename());
			break;
		case "isAll" :
			f = new File(file.getOriginalFilename());
			file.transferTo(f);
			f2 = new File(file2.getOriginalFilename());
			file2.transferTo(f2);
			imageDtoUpdate = new ProductImageDto(vo.getProduct_code(), 
					file.getOriginalFilename(), file2.getOriginalFilename());
			break;
		}
		
		/* 유통기한, 할인율, 판매 기한 수정 여부 */
		HashMap<String, Object> mapShelfLife = new HashMap<>();
		mapShelfLife.put("shelfLifeStr", shelfLifeStr);
		mapShelfLife.put("shelfLife", shelfLife);
		HashMap<String, Object> mapSaleRate = new HashMap<>();
		mapSaleRate.put("saleRateStr", saleRateStr);
		mapSaleRate.put("saleRate", saleRate);
		HashMap<String, Object> mapSalesDeadlines = new HashMap<>();
		mapSalesDeadlines.put("salesDeadlinesStr", salesDeadlinesStr);
		mapSalesDeadlines.put("salesDeadlines", salesDeadlines);
		
		/* ProductVo, ProductImageDto DB 수정 */
		String updateResult = productService.updateProduct(vo, imageDtoUpdate, 
				mapShelfLife, mapSaleRate, mapSalesDeadlines, isImage);
		
		/* 상품 등록 성공 -> 이미지 s3 수정 여부 */
		String resultMsg = "";
		if (updateResult.equals("update_product")) {
			/* imageDtoOrigin 그대로 + productVo 카테고리 변경 : s3 에서 카테고리 수정 */
			if (isImage.equals("changeCategory")) {
				// 바꾼 카테로 이미지 복사하고 -> 이전 카테에서 이미지 삭제
				S3Util.fileCopy(imageDtoOrigin.getImage_info_file_name(), 
						categoryOrigin, vo.getProduct_category());
				S3Util.fileCopy(imageDtoOrigin.getImage_content_file_name(), 
						categoryOrigin, vo.getProduct_category());
				S3Util.fileDelete(imageDtoOrigin.getImage_info_file_name(), categoryOrigin);
				S3Util.fileDelete(imageDtoOrigin.getImage_content_file_name(), categoryOrigin);
			}
			resultMsg = "update_product_success";
		/* 상품 등록 성공 -> 이미지 s3 삭제 후 업로드 */
		} else if (updateResult.equals("update_all")){
			switch (isImage) {
			case "isInfo" :
				S3Util.fileDelete(imageDtoOrigin.getImage_info_file_name(), categoryOrigin);
				S3Util.fileUpload(f, file.getOriginalFilename(), vo.getProduct_category());
				break;
			case "isContent" :
				S3Util.fileDelete(imageDtoOrigin.getImage_content_file_name(), categoryOrigin);
				S3Util.fileUpload(f2, file2.getOriginalFilename(), vo.getProduct_category());
				break;
			case "isAll" :
				S3Util.fileDelete(imageDtoOrigin.getImage_info_file_name(), categoryOrigin);
				S3Util.fileDelete(imageDtoOrigin.getImage_content_file_name(), categoryOrigin);
				S3Util.fileUpload(f, file.getOriginalFilename(), vo.getProduct_category());
				S3Util.fileUpload(f2, file2.getOriginalFilename(), vo.getProduct_category());
				break;
			}
			resultMsg = "update_all_success";
		} else {
			resultMsg = "update_fail";
		}
		rttr.addFlashAttribute("resultMsg", resultMsg);
		
		return "redirect:/admin/productUpdateForm/" + vo.getProduct_code();
	}
	
	/* s3에 업로드 된 이미지 파일  url 얻기 */
	@RequestMapping(value="/getImageUrl", method=RequestMethod.POST)
	@ResponseBody
	public String getUrl(String fileName, String category) throws Exception {
		fileName = S3Util.getImageUrl(fileName, category);
		
		return fileName;
	}
	
}
