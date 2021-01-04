package com.kh.greenfood.service;

import java.util.List;
import com.kh.greenfood.domain.QuestionCategoryDto;
import com.kh.greenfood.domain.QuestionVo;

public interface QuestionService {

	// �Է�
	public void insertQuestion(QuestionVo questionVo) throws Exception;
	
	// ���
	public List<QuestionVo> questionList() throws Exception;
	
	// �� ��ȸ
	public QuestionVo selectQuestion(int question_no) throws Exception;
	
	// ī�װ� �� �ϳ� �޾ƿ���
	public QuestionVo getQuestionCategory(int question_category) throws Exception;
		
	// ī�װ� �޾ƿ���
	/*public List<QuestionCategoryDto> getCategoryList();*/
	
	// �� ����
	public void deleteQuestion(int question_no) throws Exception;
}
