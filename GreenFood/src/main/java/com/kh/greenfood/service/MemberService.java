package com.kh.greenfood.service;

import com.kh.greenfood.domain.TestVo;

public interface MemberService {
	
	// ���̵� �α���
	public TestVo login(String user_id, String user_pw);
	
	// ȸ������
	public int insertMember(TestVo testVo);

	public TestVo selectMember(String user_id);
	
	public void test();
}
