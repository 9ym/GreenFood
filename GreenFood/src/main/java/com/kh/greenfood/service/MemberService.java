package com.kh.greenfood.service;

import com.kh.greenfood.domain.TestVo;

public interface MemberService {
	
	// ���̵� �α���
	public TestVo login(String user_id, String user_pw);
	
	// ȸ������
	public int insertMember(TestVo testVo);
	
	// ȸ������ -> ���̵� �ߺ�üũ
	public TestVo selectMember(String user_id);
	
	public TestVo profilePwCheck(String user_id, String user_pw);
	
	public void test();
}
