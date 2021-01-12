package com.kh.greenfood.dao;

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
	
	
	@Override
	public void insertReview(ReviewVo reviewVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertReview", reviewVo);
		
	}


	@Override
	public List<ReviewVo> getReviewList(PagingDto pagingDto) throws Exception {
		List<ReviewVo> reviewList = sqlSession.selectList(NAMESPACE + "getReviewList", pagingDto);
		System.out.println("ReviewDaoImpl reviewList :" + reviewList);
		return reviewList;
	}


	@Override
	public ReviewVo selectReview(int review_no) throws Exception {
		ReviewVo reviewVo = sqlSession.selectOne(NAMESPACE + "selectReview", review_no);
		return reviewVo;
	}


	@Override
	public void updateReviewReadcount(int review_no) throws Exception {
		sqlSession.update(NAMESPACE + "updateReviewReadcount" , review_no);
		
	}


	@Override
	public int reviewListCount(PagingDto pagingDto) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + "reviewListCount", pagingDto);
		return count;
	}

	
	@Override
	public void updateReview(ReviewVo reviewVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateReview", reviewVo);
		
	}

	@Override
	public void deleteReview(int review_no) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteReview", review_no);
		
	}


	

	

}
