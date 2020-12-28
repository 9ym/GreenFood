package com.kh.greenfood.service;

import com.kh.greenfood.domain.TestVo;

public interface MemberService {
	
	// 아이디 로그인
	public TestVo login(String user_id, String user_pw);
	
	// 회원가입
	public int insertMember(TestVo testVo);
	
	// 회원가입 -> 아이디 중복체크
	public TestVo selectMember(String user_id);
	
	public TestVo profilePwCheck(String user_id, String user_pw);
	
	public void test();
}
