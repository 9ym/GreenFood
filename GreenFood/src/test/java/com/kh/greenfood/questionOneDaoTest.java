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

			questionVo.setQuestion_title(i + " ��° ���������Դϴ�.");
			questionVo.setQuestion_content(i + " ��° �亯�Դϴ�.");
			questionVo.setQuestion_category(201);
		
			questionDao.insertQuestion(questionVo);
		System.out.println("questionVo :" + questionVo);
	
		}
	}*/

	@Test
	public void testInsertQuestionOne() throws Exception {
		QuestionOneVo questionOneVo = new QuestionOneVo();
		/*questionOneVo.setQ_o_no(100);*/
		questionOneVo.setQ_o_title("�ʹ� �߿���");
		questionOneVo.setQ_o_content("�����ϰ� ���ּ���");
		questionOneVo.setQ_o_category(201);
		questionOneVo.setQ_o_writer("user02");
		questionOneDao.insertQuestionOne(questionOneVo);
		System.out.println("testInsertQuestionOne, questionOneVo :" + questionOneVo);
		/*questionOneVo.setQuestion_no(100);
		questionOneVo.setQuestion_title("�����ϴ� ���� ����1");
		questionOneVo.setQuestion_content("�����ϴ� ���� ����1");
		questionDao.insertQuestion(questionVo);
		System.out.println("testInsertQuestion questionVo : " + questionVo);*/
	}
	
	@Test
	public void testGetOrderList() throws Exception {
		questionOneDao.getOrderedList("user");
	}
	
	
}
