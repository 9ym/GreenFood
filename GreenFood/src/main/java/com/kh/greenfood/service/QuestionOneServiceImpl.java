package com.kh.greenfood.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.kh.greenfood.dao.QuestionOneDao;
import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.QuestionOneVo;

@Service
public class QuestionOneServiceImpl implements QuestionOneService {
	
	@Inject
	private QuestionOneDao questionOneDao;

	// 입력
	@Override
	public void insertQuestionOne(QuestionOneVo questionOneVo) throws Exception {
		questionOneDao.insertQuestionOne(questionOneVo);
	}

	// 목록
	@Override
	public List<QuestionOneVo> getQuestionOneList() throws Exception {
		List<QuestionOneVo> questionOneList = questionOneDao.getQuestionOneList();
		return questionOneList;
	}

	// 글 조회
	@Override
	public QuestionOneVo selectQuestionOne(int q_o_no) throws Exception {
		QuestionOneVo questinoOneVo = questionOneDao.selectQuestionOne(q_o_no);
		return questinoOneVo;
	}
	
	// 글 수정
	@Override
	public void updateQuestionOne(QuestionOneVo questionOneVo) throws Exception {
		questionOneDao.updateQuestionOne(questionOneVo);
		
	}

	// 답변 넣기(수정)
	@Override
	public void updateQuestionOneAnswer(QuestionOneVo questionOneVo) throws Exception {
		questionOneDao.updateQuestionOneAnswer(questionOneVo);
	}
	
	// 글 삭제
	@Override
	public void deleteQuestionOne(int q_o_no) throws Exception {
		questionOneDao.deleteQuestionOne(q_o_no);
		
	}

	// user 에 따른  문의글 갯수 읽어오기
	@Override
	public int questionOneListCountUser(String q_o_writer) throws Exception {
		int count = questionOneDao.questionOneListCountUser(q_o_writer);
		return count;
	}

	// user 에 따른 주문내역 가져오기
	@Override
	public List<OrderVo> getOrderedList(String user_id) throws Exception{
		List<OrderVo> orderedList = questionOneDao.getOrderedList(user_id);
		return orderedList;
	}

}
