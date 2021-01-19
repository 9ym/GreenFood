package com.kh.greenfood.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.ReviewVo;
import com.kh.greenfood.service.ReviewService;

@Controller
@RequestMapping(value="/review")
public class ReviewController {
	
	@Inject
	private ReviewService reviewService;
	
	
	@RequestMapping(value="/reviewWrite/{order_code}")
	public String reviewWrite(@PathVariable("order_code") String order_code, Model model) throws Exception{
		System.out.println("ReviewController, reviewWrite : " + order_code);
		
		
		return "/review/reviewWrite";
	}
	
	// -------------------------- 후기 입력하기 --------------------------------
	@RequestMapping(value="/insertReview", method=RequestMethod.POST)
	public String insertReview(ReviewVo reviewVo, HttpSession session) throws Exception {
//		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
			
//		commentVo.setUser_id(memberVo.getUser_id());
//		System.out.println("noticeVo:" + noticeVo);
		System.out.println("insert: " +  reviewVo);
		
		
		/*Date review_date = reviewVo.getReview_date();
		SimpleDateFormat change_date;
		
		change_date = new SimpleDateFormat("yyyy-mm-dd");
		System.out.println("change_date : " + change_date);*/
		
		
		
		System.out.println("insertReview reviewVo:" + reviewVo);
		reviewService.insertReview(reviewVo);
			
		return "redirect:/review/reviewMain";
	}
	
//	-------------------- 후기 데이타 리스트에 보여주기 -------------------------
	@RequestMapping(value="/reviewMain", method=RequestMethod.GET)
	public String reviewList(Model model, PagingDto pagingDto) throws Exception {
				
		int count = reviewService.reviewListCount(pagingDto);
		pagingDto.setTotalCount(count);
		pagingDto.setPagingInfo();
		
		List<ReviewVo> reviewList = reviewService.getReviewList(pagingDto);
		
		System.out.println("CustomerCenterController, reviewList, reviewList:" + reviewList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pagingDto", pagingDto);
		return "review/reviewMain";
	}

	// -------------------  후기 리스트에 해당하는 글 상세보기  --------------------
	@RequestMapping(value="/reviewContent/{review_no}", method=RequestMethod.GET)
	public String reviewContent(@PathVariable("review_no") int review_no, Model model) throws Exception{
		System.out.println("reviewContent review_no  :" + review_no);
		ReviewVo reviewVo = reviewService.selectReview(review_no);
		model.addAttribute("reviewVo", reviewVo);
		System.out.println("reviewContent reviewVo :" + reviewVo);
		return "review/reviewContent";
	}
	
	// --------------------------  후기 수정하기	 -------------------------
	@RequestMapping(value="/updateReview", method=RequestMethod.POST)
	public String updateReview(ReviewVo reviewVo) throws Exception {
		System.out.println("ReviewController updateReview, reviewVo: " + reviewVo);
		reviewService.updateReview(reviewVo);
//		rttr.addFlashAttribute("msg", "updateSuccess");
						
		return "redirect:/review/reviewMain";
	}

	// ----------------------- 후기 삭제하기 ----------------------------------------
	
	@RequestMapping(value="/deleteReview", method=RequestMethod.GET)
	public String deleteReview(int review_no) throws Exception {
		reviewService.deleteReview(review_no);
		return "redirect:/review/reviewMain";
	}
			
}
