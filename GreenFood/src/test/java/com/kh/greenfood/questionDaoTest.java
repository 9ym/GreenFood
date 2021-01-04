package com.kh.greenfood;

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
	
	
	
	
}
