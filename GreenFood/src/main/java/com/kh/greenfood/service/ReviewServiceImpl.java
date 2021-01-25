package com.kh.greenfood.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.kh.greenfood.dao.ReviewDao;
import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.ReviewVo;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Inject
	private ReviewDao reviewDao;

	@Override
	public void insertReview(ReviewVo reviewVo) throws Exception {
		reviewDao.insertReview(reviewVo);
		
	}

	@Override
	public List<ReviewVo> getReviewList(PagingDto pagingDto) throws Exception {
		List<ReviewVo> reviewList = reviewDao.getReviewList(pagingDto);
//		System.out.println("ReviewServiceImpl reviewList :" + reviewList);
		return reviewList;
	}

	@Override
	public ReviewVo selectReview(int review_no) throws Exception {
		reviewDao.updateReviewReadcount(review_no);
		ReviewVo reviewVo = reviewDao.selectReview(review_no);
		return reviewVo;
	}


	@Override
	public int reviewListCount(PagingDto pagingDto) throws Exception {
		int count = reviewDao.reviewListCount(pagingDto);
		return count;
	}
	
	@Override
	public void updateReview(ReviewVo reviewVo) throws Exception {
		reviewDao.updateReview(reviewVo);
		
	}

	@Override
	public void deleteReview(int review_no) throws Exception {
		reviewDao.deleteReview(review_no);
		
	}

	@Override

	public ReviewVo selectInfoOrderReview(String order_code, String product_code) throws Exception {
		ReviewVo reviewVo = reviewDao.selectInfoOrderReview(order_code, product_code);
		System.out.println("ReviewServiceImpl, selectInfoOrderReview :" + reviewVo);

		return reviewVo;
	}
	
	// 상품평 등록했는지에 따른 count
	@Override
	public int productReviewsCount(String order_code) {
		int count = reviewDao.productReviewsCount(order_code);
		return count;
	}
	
	// 마이페이지 - 리뷰 모음
	@Override
	public List<ReviewVo> getReviewList(String user_id) {
		List<ReviewVo> reviewVoList = reviewDao.getReivewList(user_id);
		return reviewVoList;
	}
	
	// 마이페이지 - 리뷰 카운트
	@Override
	public int getReviewCount(String user_id) {
		int count = reviewDao.getReviewCount(user_id);
		return count;
	}
}
