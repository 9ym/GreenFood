package com.kh.greenfood.service;

import java.util.List;

import com.kh.greenfood.domain.TestVo;

public interface AdminService {
	
	// 회원정보 가져오기
	public List<TestVo> getCustomerList();
	
	// 회원 강제 탈퇴
	public int deleteCustomer(String user_id);
}
