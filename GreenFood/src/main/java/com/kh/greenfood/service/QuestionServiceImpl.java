package com.kh.greenfood.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.greenfood.dao.QuestionDao;
import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.QuestionVo;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Inject
	private QuestionDao questionDao;

	// 입력
	@Override
	public void insertQuestion(QuestionVo questionVo) throws Exception {
		questionDao.insertQuestion(questionVo);
	}

	// 자주하는 질문 리스트
	@Override
	public List<QuestionVo> getQuestionList(PagingDto pagingDto) throws Exception {
		List<QuestionVo> questionList = questionDao.getQuestionList(pagingDto);
		return questionList;
	}
	
	// 자주하는 질문 카테고리
	@Override
	public List<QuestionVo> getQuestionListCategory(int question_category) {
		List<QuestionVo> questionListCategory = questionDao.getQuestionListCategory(question_category);
		System.out.println("QuestionServiceImpl, questionListCategory :" + questionListCategory);
		return questionListCategory;
	}

	// 자주하는 질문 조회수
	@Override
	public int questionListCount(PagingDto pagingDto) throws Exception {
		int count = questionDao.questionListCount(pagingDto);
		return count;
	}
	
	// 자주하는 질문 상세보기
	@Override
	public QuestionVo selectQuestion(int question_no) throws Exception {
		QuestionVo questionVo = questionDao.selectQuestion(question_no);
		return questionVo;
	}

	// 자주하는 질문 수정
	@Override
	public void updateQuestion(QuestionVo questionVo) throws Exception {
		questionDao.updateQuestion(questionVo);
		
	}

	// 자주하는 질문 삭제
	@Override
	public void deleteQuestion(int question_no) throws Exception {
		questionDao.deleteQuestion(question_no);
		
	}
	
}
