package com.kh.greenfood.dao;

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

}
