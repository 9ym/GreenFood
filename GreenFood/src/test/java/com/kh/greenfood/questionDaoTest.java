package com.kh.greenfood;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.kh.greenfood.dao.QuestionDao;
import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.QuestionVo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class questionDaoTest {
	
	@Inject
	private QuestionDao questionDao;
	
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

	@Test
	public void testInsertQuestion() throws Exception {
		QuestionVo questionVo = new QuestionVo();
		questionVo.setQuestion_no(100);
		questionVo.setQuestion_title("�����ϴ� ���� ����1");
		questionVo.setQuestion_content("�����ϴ� ���� ����1");
		questionDao.insertQuestion(questionVo);
		System.out.println("testInsertQuestion questionVo : " + questionVo);
	}
	
	@Test
	public void testGetQuestionList(PagingDto pagingDto) throws Exception {
		List<QuestionVo> questionList = questionDao.getQuestionList(pagingDto);
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
	public void testGetQuestionListCategory() throws Exception {
		List<QuestionVo> getQuestionListCategory = questionDao.getQuestionListCategory(201);
		System.out.println("getQuestionListCategory :" + getQuestionListCategory);
	}
	
	
}
