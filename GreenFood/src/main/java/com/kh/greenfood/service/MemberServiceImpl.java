package com.kh.greenfood.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.greenfood.dao.MemberDao;
import com.kh.greenfood.domain.TestVo;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDao memberDao;
	
	@Override
	public TestVo login(String user_id, String user_pw) {
		TestVo testVo = memberDao.login(user_id, user_pw);
		return testVo;
	}

	@Override
	public int insertMember(TestVo testVo) {
		int count = memberDao.insertMember(testVo);
		return count;
	}

	@Override
	public TestVo selectMember(String user_id) {
		TestVo testVo = memberDao.selectMember(user_id);
		return testVo;
	}

	@Override
	public void test() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public TestVo profilePwCheck(String user_id, String user_pw) {
		
		return null;
	}
}

