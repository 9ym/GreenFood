package com.kh.greenfood.dao;

import java.util.List;

import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.ReviewVo;

public interface ReviewDao {

	// 입력
	public int insertReview(ReviewVo reviewVo) throws Exception;
	
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
	
	// 후기 작성시 넘겨온 주문번호,제품번호,제품명 나타내기
	public ReviewVo selectInfoOrderReview(String order_code, String product_code) throws Exception;

	// 상품평 등록했는 지에 따른 카운트
	public int productReviewsCount(String order_code);

	// 마이페이지 - 리뷰 모음
	public List<ReviewVo> getReivewList(String user_id);

	// 마이페이지 - 리뷰 카운트
	public int getReviewCount(String user_id);
	
	// 평균 별점
	public int averageStar(String product_code);

	// 평균 별점 product에 update
	public int updateStar(int avg_count, String product_code);

	// 상품 보기에서 리뷰카운트
	public int getProductReviewCount(String product_code);
}
