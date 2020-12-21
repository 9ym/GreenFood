package com.kh.greenfood.service;

import com.kh.greenfood.domain.TestVo;

public interface MemberService {
	public TestVo login(String user_id, String user_pw);
}
