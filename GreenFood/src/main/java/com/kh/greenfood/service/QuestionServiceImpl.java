package com.kh.greenfood.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.greenfood.dao.QuestionDao;
import com.kh.greenfood.domain.QuestionCategoryDto;
import com.kh.greenfood.domain.QuestionVo;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Inject
	private QuestionDao questionDao;

	@Override
	public void insertQuestion(QuestionVo questionVo) throws Exception {
		questionDao.insertQuestion(questionVo);

	}

	@Override
	public List<QuestionVo> questionList() throws Exception {
		List<QuestionVo> questionList = questionDao.questionList();
//		System.out.println("QuestionServiceImpl, questionList :" + questionList);
		return questionList;
	}

	@Override
	public QuestionVo selectQuestion(int question_no) throws Exception {
		QuestionVo questionVo = questionDao.selectQuestion(question_no);
		return questionVo;
	}

	@Override
	public QuestionVo getQuestionCategory(int question_category) throws Exception {
		QuestionVo questionVo = questionDao.getQuestionCategory(question_category);
		return questionVo;
	}

	@Override
	public void deleteQuestion(int question_no) throws Exception {
		questionDao.deleteQuestion(question_no);
		
	}

	
	
	

	/*@Override
	public QuestionVo getQuestionCategory(int question_category) throws Exception {
		QuestionVo questionVo = questionDao.getQuestionCategory(question_category);
		return questionVo;
	}*/

	/*@Override
	public List<QuestionCategoryDto> getCategoryList() {
		List<QuestionCategoryDto> categoryList = questionDao.getCategoryList();
		return categoryList;
	}*/

	

}
