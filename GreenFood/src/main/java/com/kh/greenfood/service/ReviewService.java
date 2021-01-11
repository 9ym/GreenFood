package com.kh.greenfood.service;


import java.util.List;

import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.ReviewVo;

public interface ReviewService {

	// 입력
	public void insertReview(ReviewVo reviewVo) throws Exception;
	
	// 목록
	public List<ReviewVo> getReviewList(PagingDto pagingDto) throws Exception;
	
	// 글 조회
	public ReviewVo selectReview(int review_no) throws Exception;
	
	// 전체 개시글 수 가져오기
	public int reviewListCount(PagingDto pagingDto) throws Exception;
	
	
	
}
