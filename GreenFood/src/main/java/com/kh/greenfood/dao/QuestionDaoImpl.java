package com.kh.greenfood.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	public List<QuestionVo> getQuestionList() throws Exception {
		List<QuestionVo> questionList = sqlSession.selectList(NAMESPACE + "getQuestionList");
//		System.out.println("QuestionDaoImpl, questionList :" + questionList);
		return questionList;
	}

	@Override
	public QuestionVo selectQuestion(int question_no) throws Exception {
		QuestionVo questionVo = sqlSession.selectOne(NAMESPACE + "selectQuestion", question_no);
		return questionVo;
	}

	/*@Override
	public QuestionVo getQuestionCategory(int question_category) throws Exception {
		QuestionVo questionVo = sqlSession.selectOne(NAMESPACE + "getQuestionCategory", question_category);
		return questionVo;
	}*/
	
	@Override
	public void updateQuestion(QuestionVo questionVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateQuestion", questionVo);
		
	}

	@Override
	public void deleteQuestion(int question_no) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteQuestion", question_no);
		
	}

	@Override
	public List<QuestionVo> getQuestionListOfCategory(int questino_category) throws Exception {
		List<QuestionVo> questionListOfCategory = sqlSession.selectList(NAMESPACE + "getQuestionListOfCategory", questino_category);
		return questionListOfCategory;
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
