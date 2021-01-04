package com.kh.greenfood.dao;

import com.kh.greenfood.domain.TestVo;

public interface MemberDao {
	
	public TestVo login(String user_id, String user_pw);

	public int insertMember(TestVo testVo);
	
//	public TestVo profilePwCheck(String user_id, String user_pw);

	public TestVo selectMember(String user_id);
	
	public int changePw(String user_id, String user_pw);

	public int customerModify(TestVo testVo);
}
