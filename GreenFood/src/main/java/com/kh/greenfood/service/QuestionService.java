package com.kh.greenfood.service;

import java.util.List;
import com.kh.greenfood.domain.QuestionVo;

public interface QuestionService {

	// 입력
	public void insertQuestion(QuestionVo questionVo) throws Exception;
	
	// 목록
	public List<QuestionVo> getQuestionList() throws Exception;
	
	// 글 조회
	public QuestionVo selectQuestion(int question_no) throws Exception;
	
	/*// 카테고리 값 하나 받아오기
	public QuestionVo getQuestionCategory(int question_category) throws Exception;*/
		
	// 글 수정
	public void updateQuestion(QuestionVo questionVo) throws Exception;
	
	// 글 삭제
	public void deleteQuestion(int question_no) throws Exception;
	
	// -- 카테고리에 따른 자주하는 질문 리스트 받아오기 
	public List<QuestionVo> getQuestionListOfCategory(int questino_category) throws Exception;
}
