package com.kh.greenfood;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.greenfood.dao.QuestionOneDao;
import com.kh.greenfood.domain.QuestionOneVo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class questionOneDaoTest {
	
	@Inject
	private QuestionOneDao questionOneDao;
	
	/*@Test
	public void testInsertQuestion() throws Exception {
		QuestionVo questionVo = new QuestionVo();
		for( int i = 1; i < 100 ; i++) {

			questionVo.setQuestion_title(i + " 번째 공지사항입니다.");
			questionVo.setQuestion_content(i + " 번째 답변입니다.");
			questionVo.setQuestion_category(201);
		
			questionDao.insertQuestion(questionVo);
		System.out.println("questionVo :" + questionVo);
	
		}
	}*/

	@Test
	public void testInsertQuestionOne() throws Exception {
		QuestionOneVo questionOneVo = new QuestionOneVo();
		/*questionOneVo.setQ_o_no(100);*/
		questionOneVo.setQ_o_title("너무 추워요");
		questionOneVo.setQ_o_content("따뜻하게 해주세요");
		questionOneVo.setQ_o_category(201);
		questionOneVo.setQ_o_writer("user02");
		questionOneDao.insertQuestionOne(questionOneVo);
		System.out.println("testInsertQuestionOne, questionOneVo :" + questionOneVo);
		/*questionOneVo.setQuestion_no(100);
		questionOneVo.setQuestion_title("자주하는 질문 제목1");
		questionOneVo.setQuestion_content("자주하는 질문 내용1");
		questionDao.insertQuestion(questionVo);
		System.out.println("testInsertQuestion questionVo : " + questionVo);*/
	}
	
	
	
}
