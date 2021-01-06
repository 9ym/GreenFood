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

	@Override
	public void insertQuestion(QuestionVo questionVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertQuestion", questionVo);

	}

	@Override
	public List<QuestionVo> getQuestionList(PagingDto pagingDto) throws Exception {
		List<QuestionVo> questionList = sqlSession.selectList(NAMESPACE + "getQuestionList", pagingDto);
//		System.out.println("QuestionDaoImpl, questionList, pagingDto :" + pagingDto);
//		System.out.println("QuestionDaoImpl, questionList, questionList :" + questionList);
		return questionList;
	}

	@Override
	public QuestionVo selectQuestion(int question_no) throws Exception {
		QuestionVo questionVo = sqlSession.selectOne(NAMESPACE + "selectQuestion", question_no);
		return questionVo;
	}

	
	@Override
	public void updateQuestion(QuestionVo questionVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateQuestion", questionVo);
		
	}

	@Override
	public void deleteQuestion(int question_no) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteQuestion", question_no);
		
	}

	// 카테고리 별 리스트 받아오기
	@Override
	public List<QuestionVo> getQuestionListOfCategory(int question_category) throws Exception {
		List<QuestionVo> questionListOfCategory = sqlSession.selectList(NAMESPACE + "getQuestionListOfCategory", question_category);
		return questionListOfCategory;
	}

	@Override
	public int questionListCount(PagingDto pagingDto) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + "questionListCount", pagingDto);
//		System.out.println("QuestionDaoImpl ,questionListCount, count :" + count);
		return count;
	}

	

}
