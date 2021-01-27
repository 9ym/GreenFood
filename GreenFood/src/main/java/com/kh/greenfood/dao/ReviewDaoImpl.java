package com.kh.greenfood.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.ReviewVo;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	private static final String NAMESPACE = "com.kh.greenfood.review.";
	
	@Inject
	private SqlSession sqlSession;
	
	// 입력
	@Override
	public int insertReview(ReviewVo reviewVo) throws Exception {
		int count = sqlSession.insert(NAMESPACE + "insertReview", reviewVo);
		return count;
		
	}

	// 목록
	@Override
	public List<ReviewVo> getReviewList(PagingDto pagingDto) throws Exception {
		List<ReviewVo> reviewList = sqlSession.selectList(NAMESPACE + "getReviewList", pagingDto);
		return reviewList;
	}

	// 글 조회
	@Override
	public ReviewVo selectReview(int review_no) throws Exception {
		ReviewVo reviewVo = sqlSession.selectOne(NAMESPACE + "selectReview", review_no);
		return reviewVo;
	}

	// 조회수 가져오기
	@Override
	public void updateReviewReadcount(int review_no) throws Exception {
		sqlSession.update(NAMESPACE + "updateReviewReadcount" , review_no);
		
	}

	// 전체 개시글 수 가져오기
	@Override
	public int reviewListCount(PagingDto pagingDto) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + "reviewListCount", pagingDto);
		return count;
	}

	// 글 수정
	@Override
	public void updateReview(ReviewVo reviewVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateReview", reviewVo);
		
	}

	// 글 삭제
	@Override
	public void deleteReview(int review_no) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteReview", review_no);
		
	}

	// 후기 작성시 넘겨온 주문번호,제품번호,제품명 나타내기
	@Override
	public ReviewVo selectInfoOrderReview(String order_code, String product_code) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("order_code", order_code);
		map.put("product_code", product_code);
		ReviewVo reviewVo = sqlSession.selectOne(NAMESPACE + "selectInfoOrderReview", map);
		return reviewVo;
	}

	// 상품평 등록했는 지에 따른 카운트
	@Override
	public int productReviewsCount(String order_code, String product_code) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("order_code", order_code);
		map.put("product_code", product_code);
		int count = sqlSession.selectOne(NAMESPACE + "productReviewsCount", map);
		return count;
	}

	// 마이페이지 - 리뷰 모음
	@Override
	public List<ReviewVo> getReivewList(String user_id) {
		List<ReviewVo> reviewVoList = sqlSession.selectList(NAMESPACE + "getMyReviewList", user_id);
		return reviewVoList;
	}

	// 마이페이지 - 리뷰 카운트
	@Override
	public int getReviewCount(String user_id) {
		int count = sqlSession.selectOne(NAMESPACE + "getReviewCount", user_id);
		return count;
	}

	// 평균 별점
	@Override
	public int averageStar(String product_code) {
		int avg_count = sqlSession.selectOne(NAMESPACE + "averageStar",product_code);
		return avg_count;
	}

	// 평균 별점 product에 update
	@Override
	public int updateStar(int avg_count, String product_code) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("star_avg", avg_count);
		map.put("product_code", product_code);
		int count = sqlSession.update(NAMESPACE + "updateStar", map);
		return count;
		
	}

	// 상품 보기에서 리뷰카운트
	@Override
	public int getProductReviewCount(String product_code) {
		int count = sqlSession.selectOne(NAMESPACE + "getProductReviewCount", product_code); 
		return count;
	}

}
