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
		System.out.println("ReviewServiceImpl reviewList :" + reviewList);
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

	

	
	


}