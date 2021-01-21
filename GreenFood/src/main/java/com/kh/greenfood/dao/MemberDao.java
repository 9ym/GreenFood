package com.kh.greenfood.dao;

import java.util.List;

import com.kh.greenfood.domain.OrderListCountDto;
import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.PointVo;
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

	public List<PointVo> getUserPoint(String user_id);

	public int insertPoint(String user_id, int point_score, int point_category);

	public int getPointSum(String user_id);

	public int orderCount(String user_id);

	public List<OrderListCountDto> getCustomerOrderCountList(String user_id);
	
	/* 유저 포인트 변경 (포인트 추가, 감소, ..) */
	public int updateUserPoint(int user_point, String user_id);
	
	/* 주문 건수에 따라 5회면 gold로 10회면 vip로 */
	public int updateUserLevel(String user_id, int user_level);
}
