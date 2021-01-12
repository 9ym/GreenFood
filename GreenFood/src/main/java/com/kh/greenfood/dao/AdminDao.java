package com.kh.greenfood.dao;

import java.util.List;

import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.PointVo;
import com.kh.greenfood.domain.TestVo;

public interface AdminDao {

	public List<TestVo> getCustomerList();
	
	// 회원 강제 탈퇴
	public int deleteCustomer(String user_id);

}
