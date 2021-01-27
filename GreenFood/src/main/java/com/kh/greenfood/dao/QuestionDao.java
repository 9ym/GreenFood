package com.kh.greenfood.dao;

import java.util.List;

import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.QuestionVo;

public interface QuestionDao {

	// 자주하는 질문
	public void insertQuestion(QuestionVo questionVo) throws Exception;
	
	// 자주하는 질문 리스트
	public List<QuestionVo> getQuestionList(PagingDto pagingDto) throws Exception;
	
	// 자주하는 질문 리스트 카테고리
	public List<QuestionVo> getQuestionListCategory(int question_category);
	
	// 자주하는 질문 카운트
	public int questionListCount(PagingDto pagingDto) throws Exception;
	
	// 자주하는 질문 상세보기
	public QuestionVo selectQuestion(int question_no) throws Exception;
	
	// 자주하는 질문 수정
	public void updateQuestion(QuestionVo questionVo) throws Exception;
	
	// 자주하는 질문 삭제
	public void deleteQuestion(int question_no) throws Exception;
	
}
