package com.kh.greenfood.service;

import java.util.List;
import com.kh.greenfood.domain.QuestionCategoryDto;
import com.kh.greenfood.domain.QuestionVo;

public interface QuestionService {

	// 입력
	public void insertQuestion(QuestionVo questionVo) throws Exception;
	
	// 목록
	public List<QuestionVo> questionList() throws Exception;
	
	// 글 조회
	public QuestionVo selectQuestion(int question_no) throws Exception;
	
	// 카테고리 값 하나 받아오기
	public QuestionVo getQuestionCategory(int question_category) throws Exception;
		
	// 카테고리 받아오기
	/*public List<QuestionCategoryDto> getCategoryList();*/
	
	// 글 삭제
	public void deleteQuestion(int question_no) throws Exception;
}
