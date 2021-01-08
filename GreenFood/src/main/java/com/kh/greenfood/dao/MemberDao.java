package com.kh.greenfood.dao;

import java.util.List;

import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.TestVo;

public interface MemberDao {
	
	public TestVo login(String user_id, String user_pw);

	public int insertMember(TestVo testVo);
	
//	public TestVo profilePwCheck(String user_id, String user_pw);

	public TestVo selectMember(String user_id);
	
	public int changePw(String user_id, String user_pw);

	public int customerModify(TestVo testVo);

	public TestVo findPw(String user_id, String user_email);

	public TestVo findId(String user_name, String user_email, String user_phone);
	
	public List<OrderVo> getOrderedList(String user_id);

	public List<OrderVo> getLatestOrderedList(String user_id);
}
