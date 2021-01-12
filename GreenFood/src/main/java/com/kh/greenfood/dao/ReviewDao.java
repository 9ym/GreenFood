package com.kh.greenfood.dao;

import java.util.List;

import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.QuestionOneVo;
import com.kh.greenfood.domain.ReviewVo;

public interface ReviewDao {

	// 입력
	public void insertReview(ReviewVo reviewVo) throws Exception;
	
	// 목록
	public List<ReviewVo> getReviewList(PagingDto pagingDto) throws Exception;
	
	// 글 조회
	public ReviewVo selectReview(int review_no) throws Exception;
	
	// 조회수 가져오기
	public void updateReviewReadcount(int review_no) throws Exception;
	
	// 전체 개시글 수 가져오기
	public int reviewListCount(PagingDto pagingDto) throws Exception;

	// 글 수정
	public void updateReview(ReviewVo reviewVo) throws Exception;	
	
	// 글 삭제
	public void deleteReview(int review_no) throws Exception;
}
