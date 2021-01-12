package com.kh.greenfood.service;


import java.util.List;

import com.kh.greenfood.domain.QuestionOneVo;

public interface QuestionOneService {

	// 입력
	public void insertQuestionOne(QuestionOneVo questionOneVo) throws Exception;
	
	// 목록
	public List<QuestionOneVo> getQuestionOneList() throws Exception;
	
	// 글 조회
	public QuestionOneVo selectQuestionOne(int q_o_no) throws Exception; 
	
	// 글 수정
	public void updateQuestionOne(QuestionOneVo questionOneVo) throws Exception;
	
	// 답변 넣기(수정)
	public void updateQuestionOneAnswer(QuestionOneVo questionOneVo) throws Exception;
	
	// 글 삭제
	public void deleteQuestionOne(int q_o_no) throws Exception;
	
}
