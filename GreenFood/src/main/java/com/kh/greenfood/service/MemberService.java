package com.kh.greenfood.service;

import com.kh.greenfood.domain.TestVo;

public interface MemberService {
	
	// 아이디 로그인
	public TestVo login(String user_id, String user_pw);
	
	// 회원가입
	public int insertMember(TestVo testVo);

	public TestVo selectMember(String user_id);
	
	public void test();
}
