package com.kh.greenfood.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.domain.QuestionCategoryDto;
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
	public List<QuestionVo> questionList() throws Exception {
		List<QuestionVo> questionList = sqlSession.selectList(NAMESPACE + "questionList");
//		System.out.println("QuestionDaoImpl, questionList :" + questionList);
		return questionList;
	}

	@Override
	public QuestionVo selectQuestion(int question_no) throws Exception {
		QuestionVo questionVo = sqlSession.selectOne(NAMESPACE + "selectQuestion", question_no);
		return questionVo;
	}

	@Override
	public QuestionVo getQuestionCategory(int question_category) throws Exception {
		QuestionVo questionVo = sqlSession.selectOne(NAMESPACE + "getQuestionCategory", question_category);
		return questionVo;
	}

	@Override
	public void deleteQuestion(int question_no) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteQuestion", question_no);
		
	}
	
	

	/*@Override
	public QuestionVo getQuestionCategory(int question_category) throws Exception {
		QuestionVo questionVo = sqlSession.selectOne(NAMESPACE + "getQuestionCategory", question_category);
		return questionVo;
	}*/
	

	/*@Override
	public List<QuestionCategoryDto> getCategoryList() {
		List<QuestionCategoryDto> categoryList = sqlSession.selectList(NAMESPACE + "getCategoryList");
		return categoryList;
	}*/

	

}
