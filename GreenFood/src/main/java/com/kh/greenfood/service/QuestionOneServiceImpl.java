package com.kh.greenfood.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.kh.greenfood.dao.QuestionOneDao;
import com.kh.greenfood.domain.QuestionOneVo;

@Service
public class QuestionOneServiceImpl implements QuestionOneService {
	
	@Inject
	private QuestionOneDao questionOneDao;

	@Override
	public void insertQuestionOne(QuestionOneVo questionOneVo) throws Exception {
		questionOneDao.insertQuestionOne(questionOneVo);
	}


}
