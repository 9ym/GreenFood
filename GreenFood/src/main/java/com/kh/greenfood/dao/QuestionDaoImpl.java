package com.kh.greenfood.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.QuestionVo;

@Repository
public class QuestionDaoImpl implements QuestionDao {
	
	private static final String NAMESPACE = "com.kh.greenfood.question.";
	
	@Inject
	private SqlSession sqlSession;

	// 자주하는 질문
	@Override
	public void insertQuestion(QuestionVo questionVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertQuestion", questionVo);

	}

	// 자주하는 질문 리스트
	@Override
	public List<QuestionVo> getQuestionList(PagingDto pagingDto) throws Exception {
		List<QuestionVo> questionList = sqlSession.selectList(NAMESPACE + "getQuestionList", pagingDto);
		return questionList;
	}

	// 자주하는 질문 리스트 카테고리
	@Override
	public QuestionVo selectQuestion(int question_no) throws Exception {
		QuestionVo questionVo = sqlSession.selectOne(NAMESPACE + "selectQuestion", question_no);
		return questionVo;
	}

	// 자주하는 질문 카운트
	@Override
	public void updateQuestion(QuestionVo questionVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateQuestion", questionVo);
		
	}

	// 자주하는 질문 상세보기
	@Override
	public void deleteQuestion(int question_no) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteQuestion", question_no);
		
	}

	// 자주하는 질문 수정
	@Override
	public int questionListCount(PagingDto pagingDto) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + "questionListCount", pagingDto);
		return count;
	}

	// 자주하는 질문 삭제
	@Override
	public List<QuestionVo> getQuestionListCategory(int question_category) {
		List<QuestionVo> questionListCategory = sqlSession.selectList(NAMESPACE + "getQuestionListCategory", question_category);
		return questionListCategory;
	}


}
