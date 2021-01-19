package com.kh.greenfood.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.kh.greenfood.dao.QuestionOneDao;
import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.QuestionOneVo;

@Service
public class QuestionOneServiceImpl implements QuestionOneService {
	
	@Inject
	private QuestionOneDao questionOneDao;

	@Override
	public void insertQuestionOne(QuestionOneVo questionOneVo) throws Exception {
		questionOneDao.insertQuestionOne(questionOneVo);
	}

	@Override
	public List<QuestionOneVo> getQuestionOneList() throws Exception {
		List<QuestionOneVo> questionOneList = questionOneDao.getQuestionOneList();
		return questionOneList;
	}

	@Override
	public QuestionOneVo selectQuestionOne(int q_o_no) throws Exception {
		QuestionOneVo questinoOneVo = questionOneDao.selectQuestionOne(q_o_no);
		System.out.println("QuestionOneServiceImpl selectQuestionOne questinoOneVo : " + questinoOneVo ) ;
		return questinoOneVo;
	}
	
	@Override
	public void updateQuestionOne(QuestionOneVo questionOneVo) throws Exception {
		questionOneDao.updateQuestionOne(questionOneVo);
		
	}

//	---------------------- 답변 넣기 --------------------------
	@Override
	public void updateQuestionOneAnswer(QuestionOneVo questionOneVo) throws Exception {
		System.out.println("QuestionOneServiceImpl updateQuestionOneAnswer questionOneVo : " + questionOneVo);
		questionOneDao.updateQuestionOneAnswer(questionOneVo);
		
	}
	
	@Override
	public void deleteQuestionOne(int q_o_no) throws Exception {
		questionOneDao.deleteQuestionOne(q_o_no);
		
	}

	@Override
	public int questionOneListCountUser(String q_o_writer) throws Exception {
//		System.out.println("QuestionOneServiceImpl, questionOneListCountUser, q_o_writer:" + q_o_writer);
		int count = questionOneDao.questionOneListCountUser(q_o_writer);
//		System.out.println("QuestionOneServiceImpl, questionOneListCountUser, count : " + count);
		return count;
	}

	

	@Override
	public List<OrderVo> getOrderedList(String user_id) {
		List<OrderVo> orderedList = questionOneDao.getOrderedList(user_id);
		return orderedList;
	}

	

}
