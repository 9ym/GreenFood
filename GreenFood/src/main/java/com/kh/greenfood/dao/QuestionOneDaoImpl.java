package com.kh.greenfood.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.QuestionOneVo;

@Repository
public class QuestionOneDaoImpl implements QuestionOneDao {

	private static final String NAMESPACE = "com.kh.greenfood.questionOne.";
	
	@Inject
	private SqlSession sqlSession;
	
	// 입력
	@Override
	public void insertQuestionOne(QuestionOneVo questionOneVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertQuestionOne", questionOneVo);
	}

	// 목록
	@Override
	public List<QuestionOneVo> getQuestionOneList() throws Exception {
		List<QuestionOneVo> questionOneList = sqlSession.selectList(NAMESPACE + "getQuestionOneList");
		return questionOneList;
	}

	// 글 조회
	@Override
	public QuestionOneVo selectQuestionOne(int q_o_no) throws Exception {
		QuestionOneVo questionOneVo = sqlSession.selectOne(NAMESPACE + "selectQuestionOne", q_o_no);
		return questionOneVo;
	}

	// 글 수정
	@Override
	public void updateQuestionOne(QuestionOneVo questionOneVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateQuestionOne", questionOneVo);
		
	}
	
	// 답변 넣기(수정)
	@Override
	public void updateQuestionOneAnswer(QuestionOneVo questionOneVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateQuestionOneAnswer", questionOneVo);
		
	}
	
	// 글 삭제
	@Override
	public void deleteQuestionOne(int q_o_no) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteQuestionOne", q_o_no);
		
	}

	// user 에 따른  문의글 갯수 읽어오기
	@Override
	public int questionOneListCountUser(String q_o_writer) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + "questionOneListCountUser", q_o_writer);
		return count;
	}

	// user 에 따른 주문내역 가져오기
	@Override
	public List<OrderVo> getOrderedList(String user_id) throws Exception {
		List<OrderVo> orderedList = sqlSession.selectList(NAMESPACE + "getOrderedList", user_id);
		return orderedList;
	}
}
