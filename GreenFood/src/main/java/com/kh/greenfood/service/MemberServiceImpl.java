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
	public int changePw(String user_id, String user_pw) {
		int count = memberDao.changePw(user_id, user_pw);
		return count;
	}

	@Override
	public int customerModify(TestVo testVo) {
		int count = memberDao.customerModify(testVo);
		return count;
	}

	// 비밀번호 찾기
	@Override
	public TestVo findPw(String user_id, String user_email) {
		TestVo testVo = memberDao.findPw(user_id, user_email);
		return testVo;
	}

	// 아이디 찾기
	@Override
	public TestVo findId(String user_name, String user_email, String user_phone) {
		TestVo testVo = memberDao.findId(user_name, user_email, user_phone);
		return testVo;
	}

//	@Override
//	public TestVo profilePwCheck(String user_id, String user_pw) {
//		TestVo testVo = memberDao.profilePwCheck(user_id, user_pw);
//		return testVo;
//	}
}

