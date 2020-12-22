package com.kh.greenfood.dao;

import com.kh.greenfood.domain.TestVo;

public interface MemberDao {
	
	public TestVo login(String user_id, String user_pw);

	public void insertMember(TestVo testVo);

	public TestVo selectMember(String user_id);
}
<<<<<<< HEAD
=======

>>>>>>> 8e08f6ae73c2ad79ebb0f69cba27bcc6c4c0103a
