package com.kh.greenfood;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.kh.greenfood.dao.QuestionDao;
import com.kh.greenfood.domain.QuestionVo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class questionDaoTest {
	
	@Inject
	private QuestionDao questionDao;

	@Test
	public void testInsertQuestion() throws Exception {
		QuestionVo questionVo = new QuestionVo();
		/*questionVo.setQuestion_no(100);*/
		questionVo.setQuestion_title("자주하는 질문 제목1");
		questionVo.setQuestion_content("자주하는 질문 내용1");
		questionDao.insertQuestion(questionVo);
		System.out.println("testInsertQuestion questionVo : " + questionVo);
		
	}
	
	@Test
	public void testGetQuestionList() throws Exception {
		List<QuestionVo> questionList = questionDao.getQuestionList();
		System.out.println("questionList :" + questionList);
	}
	
	@Test
	public void testSelectQuestion() throws Exception {
		QuestionVo questionVo = questionDao.selectQuestion(31);
		System.out.println("questionVo :" + questionVo);
		/*List<QuestionVo> questionList = questionDao.getQuestionList();
		System.out.println("questionList :" + questionList);*/
	}
	
	@Test
	public void testGetQuestionListOfCategory() throws Exception {
		List<QuestionVo> getQuestionListOfCategory = questionDao.getQuestionListOfCategory(201);
		System.out.println("getQuestionListOfCategory :" + getQuestionListOfCategory);
	}
	
	
}
