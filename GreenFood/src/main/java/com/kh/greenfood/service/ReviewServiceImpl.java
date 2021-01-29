package com.kh.greenfood.service;


import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.greenfood.dao.OrderDao;
import com.kh.greenfood.dao.ReviewDao;
import com.kh.greenfood.domain.OrderDetailDto;
import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.ReviewVo;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Inject
	private ReviewDao reviewDao;
	
	@Inject
	private OrderDao orderDao;

	// 입력
	@Override
	@Transactional
	public int insertReview(ReviewVo reviewVo) throws Exception {
		int count = reviewDao.insertReview(reviewVo);
		int countResult = 0;
		if(count > 0) {
			String product_code = reviewVo.getProduct_code();
			int avg_count = reviewDao.averageStar(product_code);
			countResult = reviewDao.updateStar(avg_count, product_code);
		}
		return countResult;
	}

	// 목록
	@Override
	public List<ReviewVo> getReviewList(PagingDto pagingDto) throws Exception {
		List<ReviewVo> reviewList = reviewDao.getReviewList(pagingDto);
		return reviewList;
	}

	// 글 조회
	@Override
	public ReviewVo selectReview(int review_no) throws Exception {
		reviewDao.updateReviewReadcount(review_no);
		ReviewVo reviewVo = reviewDao.selectReview(review_no);
		return reviewVo;
	}

	// 전체 개시글 수 가져오기
	@Override
	public int reviewListCount(PagingDto pagingDto) throws Exception {
		int count = reviewDao.reviewListCount(pagingDto);
		return count;
	}
	
	// 글 수정
	@Override
	public void updateReview(ReviewVo reviewVo) throws Exception {
		reviewDao.updateReview(reviewVo);
		
	}

	// 글 삭제
	@Override
	public void deleteReview(int review_no) throws Exception {
		reviewDao.deleteReview(review_no);
		
	}
	
	// 후기 작성시 넘겨온 주문번호,제품번호,제품명 나타내기
	@Override
	public ReviewVo selectInfoOrderReview(String order_code, String product_code) throws Exception {
		ReviewVo reviewVo = reviewDao.selectInfoOrderReview(order_code, product_code);
		System.out.println("ReviewServiceImpl, selectInfoOrderReview :" + reviewVo);

		return reviewVo;
	}
	
	// 상품평 등록했는지에 따른 count
	@Override
	@Transactional
	public List<Integer> productReviewsCount(String order_code) {
		List<OrderDetailDto> orderDetailList = orderDao.getProductDetailList(order_code);
		System.out.println("서스" + orderDetailList);
		List<Integer> list = new ArrayList<>();
		for(OrderDetailDto dto : orderDetailList) {
			int count = reviewDao.productReviewsCount(order_code, dto.getProduct_code());
			list.add(count);
		}
		return list;
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

	// 상품 보기에서 리뷰카운트
	@Override
	public int getProductReviewCount(String product_code) {
		int count = reviewDao.getProductReviewCount(product_code);
		return count;
	}
}
