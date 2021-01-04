package com.kh.greenfood.dao;

import java.util.List;

import com.kh.greenfood.domain.QuestionVo;

public interface QuestionDao {

	// �Է�
	public void insertQuestion(QuestionVo questionVo) throws Exception;
	
	// ���
	public List<QuestionVo> getQuestionList() throws Exception;
	
	// �� ��ȸ
	public QuestionVo selectQuestion(int question_no) throws Exception;
	
	/*// ī�װ� �� �ϳ� �޾ƿ���
	public QuestionVo getQuestionCategory(int question_category) throws Exception;*/
	
	// selectOne �ؼ� �ݺ�.... 
	
	// �� ����
	public void updateQuestion(QuestionVo questionVo) throws Exception;
	
	// �� ����
	public void deleteQuestion(int question_no) throws Exception;
	
	// -- ī�װ��� ���� �����ϴ� ���� ����Ʈ �޾ƿ��� 
	public List<QuestionVo> getQuestionListOfCategory(int questino_category) throws Exception;
}
