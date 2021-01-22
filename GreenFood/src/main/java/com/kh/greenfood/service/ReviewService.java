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
	
	// 글 수정
	public void updateReview(ReviewVo reviewVo) throws Exception;
	
	// 글 삭제
	public void deleteReview(int review_no) throws Exception;
	
	// 후기 작성시 넘겨온 주문번호,제품번호,제품명 나타내기
	public ReviewVo selectInfoOrderReview(String order_code, String product_code) throws Exception;

	// 상품평 등록했는지에 따른 count
	public int productReviewsCount(String order_code);

}
