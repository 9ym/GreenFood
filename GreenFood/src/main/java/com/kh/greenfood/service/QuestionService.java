package com.kh.greenfood.service;

import java.util.List;

import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.QuestionVo;

public interface QuestionService {

	// �Է�
	public void insertQuestion(QuestionVo questionVo) throws Exception;
	
	// ���
	public List<QuestionVo> getQuestionList(PagingDto pagingDto) throws Exception;
	
	// ī�װ��� �ش��ϴ� ����Ʈ �޾ƿ���
	public List<QuestionVo> getQuestionListCategory(int question_category);
	
	// ��ü ���ñ� �� ��������
	public int questionListCount(PagingDto pagingDto) throws Exception;
	
	// �� ��ȸ
	public QuestionVo selectQuestion(int question_no) throws Exception;
		
	// �� ����
	public void updateQuestion(QuestionVo questionVo) throws Exception;
	
	// �� ����
	public void deleteQuestion(int question_no) throws Exception;
	
	
}
