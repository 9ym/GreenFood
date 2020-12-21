package com.kh.greenfood.dao;

import com.kh.greenfood.domain.TestVo;

public interface MemberDao {
	public TestVo login(String user_id, String user_pw);
}
