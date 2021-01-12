package com.kh.greenfood.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.domain.QuestionOneVo;

@Repository
public class QuestionOneDaoImpl implements QuestionOneDao {

	private static final String NAMESPACE = "com.kh.greenfood.questionOne.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insertQuestionOne(QuestionOneVo questionOneVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertQuestionOne", questionOneVo);

	}

	@Override
	public List<QuestionOneVo> getQuestionOneList() throws Exception {
		
		List<QuestionOneVo> questionOneList = sqlSession.selectList(NAMESPACE + "getQuestionOneList");
//		System.out.println("QuestionOneDaoImpl, getQuestionOneList, questionOneList :" + questionOneList);
		return questionOneList;
	}

	@Override
	public QuestionOneVo selectQuestionOne(int q_o_no) throws Exception {
		QuestionOneVo questionOneVo = sqlSession.selectOne(NAMESPACE + "selectQuestionOne", q_o_no);
		return questionOneVo;
	}

	@Override
	public void updateQuestionOne(QuestionOneVo questionOneVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateQuestionOne", questionOneVo);
		
	}
	
//	-------------- 답변 넣기 ----------------
	@Override
	public void updateQuestionOneAnswer(QuestionOneVo questionOneVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateQuestionOneAnswer", questionOneVo);
		
	}
	
	@Override
	public void deleteQuestionOne(int q_o_no) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteQuestionOne", q_o_no);
		
	}

	

	

}