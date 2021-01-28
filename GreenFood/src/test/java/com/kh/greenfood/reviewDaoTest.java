package com.kh.greenfood;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.greenfood.dao.QuestionOneDao;
import com.kh.greenfood.dao.ReviewDao;
import com.kh.greenfood.domain.NoticeVo;
import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.QuestionOneVo;
import com.kh.greenfood.domain.ReviewVo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class reviewDaoTest {
	
	@Inject
	private ReviewDao reviewDao;
	
	/*@Test
	public void testInsertQuestion() throws Exception {
		QuestionVo questionVo = new QuestionVo();
		for( int i = 1; i < 100 ; i++) {

			questionVo.setQuestion_title(i + " ��° ���������Դϴ�.");
			questionVo.setQuestion_content(i + " ��° �亯�Դϴ�.");
			questionVo.setQuestion_category(201);
		
			questionDao.insertQuestion(questionVo);
		System.out.println("questionVo :" + questionVo);
	
		}
	}*/

	/*@Test
	public void testInsertQuestionOne() throws Exception {
		QuestionOneVo questionOneVo = new QuestionOneVo();
		questionOneVo.setQ_o_no(100);
		questionOneVo.setQ_o_title("�ʹ� �߿���");
		questionOneVo.setQ_o_content("�����ϰ� ���ּ���");
		questionOneVo.setQ_o_category(201);
		questionOneVo.setQ_o_writer("user02");
		questionOneDao.insertQuestionOne(questionOneVo);
		System.out.println("testInsertQuestionOne, questionOneVo :" + questionOneVo);
		
	}
	*/
	@Test
	public void testInsertReview() throws Exception {
		ReviewVo reviewVo = new ReviewVo();
		reviewVo.setProduct_title("당근");
		reviewVo.setReview_title("당근3");
		reviewVo.setReview_content("후기내용3");
		reviewDao.insertReview(reviewVo);
//		System.out.println("testInsertReview, reviewVo :" + reviewVo );
	}
	
	/*@Test
	public void testReviewList() throws Exception {
		List<ReviewVo> reviewList = reviewDao.getReviewList(pagingDto);
		System.out.println("testReviewList reviewList:" + reviewList);
	}*/
	
	@Test
	public void testSelectReviewOne() throws Exception {
		ReviewVo reviewVo = reviewDao.selectReview(9);
		System.out.println("testReviewList reviewVo:" + reviewVo);
	}
	
	@Test
	public void testSelectInfoOrderReview() throws Exception {
		ReviewVo reviewVo = reviewDao.selectInfoOrderReview("202101060007", "115");
		System.out.println("testSelectInfoOrderReview reviewVo:" + reviewVo);
	}
	
	@Test
	public void testGetProductReviewCount() throws Exception{
		int count = reviewDao.getProductReviewCount("1244");
		System.out.println(count);
	}
	
	
	
	
}
