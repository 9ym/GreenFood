package com.kh.greenfood.service;

import java.util.List;
import com.kh.greenfood.domain.QuestionVo;

public interface QuestionService {

	// �Է�
	public void insertQuestion(QuestionVo questionVo) throws Exception;
	
	// ���
	public List<QuestionVo> getQuestionList() throws Exception;
	
	// �� ��ȸ
	public QuestionVo selectQuestion(int question_no) throws Exception;
	
	/*// ī�װ� �� �ϳ� �޾ƿ���
	public QuestionVo getQuestionCategory(int question_category) throws Exception;*/
		
	// �� ����
	public void updateQuestion(QuestionVo questionVo) throws Exception;
	
	// �� ����
	public void deleteQuestion(int question_no) throws Exception;
	
	// -- ī�װ��� ���� �����ϴ� ���� ����Ʈ �޾ƿ��� 
	public List<QuestionVo> getQuestionListOfCategory(int questino_category) throws Exception;
}
