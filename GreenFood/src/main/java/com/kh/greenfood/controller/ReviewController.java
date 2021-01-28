package com.kh.greenfood.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.ProductCategoryDto;
import com.kh.greenfood.domain.ReviewVo;
import com.kh.greenfood.domain.CustomerVo;
import com.kh.greenfood.service.PointService;
import com.kh.greenfood.service.ProductService;
import com.kh.greenfood.service.ReviewService;

@Controller
@RequestMapping(value="/review")
public class ReviewController {
	
	@Inject
	private ReviewService reviewService;
	
	@Inject
	private PointService pointService;
	
	@Inject
	private ProductService productService;
	
	private final int reviewPoint = 102;
	
	// 후기 작성시 넘겨온 주문번호,제품번호,제품명 나타내기
	@RequestMapping(value="/reviewWrite/{order_code}")

	public String reviewWrite(@PathVariable("order_code") String order_code, String product_code, Model model) throws Exception{
		getProductCate(model);
		ReviewVo reviewVo = reviewService.selectInfoOrderReview(order_code, product_code);
		model.addAttribute("reviewVo", reviewVo);
		return "/review/reviewWrite";
	}
	
	// -------------------------- 후기 입력하기 --------------------------------
	@RequestMapping(value="/insertReview", method=RequestMethod.POST)
	public String insertReview(ReviewVo reviewVo, HttpSession session, Model model) throws Exception {
//		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");

		CustomerVo customerVo = (CustomerVo)session.getAttribute("customerVo");
		String user_id = customerVo.getUser_id();
		
		/* 후기 남긴 포인트 지급 */
		pointService.insertPoint(user_id, 102, 500);
		
		int resultCount = reviewService.insertReview(reviewVo);
		if(resultCount > 0) {
			model.addAttribute("msg", "reviewOk");
		} else {
			model.addAttribute("msg", "reviewFail");
		}
			
		return "redirect:/review/reviewMain";
	}
	
//	-------------------- 후기 데이타 리스트에 보여주기 -------------------------
	@RequestMapping(value="/reviewMain", method=RequestMethod.GET)
	public String reviewList(Model model, PagingDto pagingDto) throws Exception {
				
		int count = reviewService.reviewListCount(pagingDto);
		pagingDto.setTotalCount(count);
		pagingDto.setPagingInfo();
		
		List<ReviewVo> reviewList = reviewService.getReviewList(pagingDto);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pagingDto", pagingDto);
		return "review/reviewMain";
	}

	// -------------------  후기 리스트에 해당하는 글 상세보기  --------------------
	@RequestMapping(value="/reviewContent/{review_no}", method=RequestMethod.GET)
	public String reviewContent(@PathVariable("review_no") int review_no, Model model) throws Exception{
		ReviewVo reviewVo = reviewService.selectReview(review_no);
		model.addAttribute("reviewVo", reviewVo);
		return "review/reviewContent";
	}
	
	// --------------------------  후기 수정하기	 -------------------------
	@RequestMapping(value="/updateReview", method=RequestMethod.POST)
	public String updateReview(ReviewVo reviewVo) throws Exception {
		reviewService.updateReview(reviewVo);
						
		return "redirect:/review/reviewMain";
	}

	// ----------------------- 후기 삭제하기 ----------------------------------------
	
	@RequestMapping(value="/deleteReview", method=RequestMethod.GET)
	public String deleteReview(int review_no) throws Exception {
		reviewService.deleteReview(review_no);
		return "redirect:/review/reviewMain";
	}
	
	private void getProductCate (Model model) throws Exception{
		/* 상품 카테고리 */
		List<ProductCategoryDto> categoryList = productService.getCategory();
		model.addAttribute("categoryList", categoryList);
	}
			
}
