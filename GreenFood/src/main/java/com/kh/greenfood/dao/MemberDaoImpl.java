package com.kh.greenfood.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.domain.OrderListCountDto;
import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.PointVo;
import com.kh.greenfood.domain.TestVo;

@Repository
public class MemberDaoImpl implements MemberDao {

	private final static String NAMESPACE = "com.kh.greenfood.member.";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public TestVo login(String user_id, String user_pw) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		TestVo testVo = sqlSession.selectOne(NAMESPACE + "login", map);
		return testVo;
	}

	@Override
	public int insertMember(TestVo testVo) {
		int count = sqlSession.insert(NAMESPACE + "insertMember", testVo);
		return count;
	}

	@Override
	public TestVo selectMember(String user_id) {
		TestVo testVo = sqlSession.selectOne(NAMESPACE + "selectMember", user_id);
		return testVo;
	}

	@Override
	public int changePw(String user_id, String user_pw) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		int count = sqlSession.update(NAMESPACE + "changePw", map);
		return count;
	}

	@Override
	public int customerModify(TestVo testVo) {
		int count = sqlSession.update(NAMESPACE + "customerModify", testVo);
		return count;
	}

	@Override
	public TestVo findPw(String user_id, String user_email) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_email", user_email);
		TestVo testVo = sqlSession.selectOne(NAMESPACE + "findPw", map);
		return testVo;
	}

	@Override
	public TestVo findId(String user_name, String user_email, String user_phone) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_name", user_name);
		map.put("user_email", user_email);
		map.put("user_phone", user_phone);
		System.out.println(map);
		TestVo testVo = sqlSession.selectOne(NAMESPACE + "findId", map);
		return testVo;
	}

	@Override
	public List<OrderVo> getOrderedList(String user_id) {
		List<OrderVo> orderedList = sqlSession.selectList(NAMESPACE + "getOrderedList", user_id);
		return orderedList;
	}

	@Override
	public List<OrderVo> getLatestOrderedList(String user_id) {
		List<OrderVo> latestOrderedList = sqlSession.selectList(NAMESPACE + "getLatestOrderedList", user_id);
		return latestOrderedList;
	}

	@Override
	public List<PointVo> getUserPoint(String user_id) {
		List<PointVo> pointVo = sqlSession.selectList(NAMESPACE + "getUserPoint", user_id);
		return pointVo;
	}

	@Override
	public int insertPoint(String user_id, int point_score, int point_category) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("point_score", point_score);
		map.put("point_category", point_category);
		int count = sqlSession.insert(NAMESPACE + "insertPoint", map);
		return count;
	}

	@Override
	public int getPointSum(String user_id) {
		int pointSum = sqlSession.selectOne(NAMESPACE + "getPointSum", user_id);
		System.out.println("getPointSum : " + pointSum);
		return pointSum;
	}

	@Override
	public int orderCount(String user_id) {
		int count = sqlSession.selectOne(NAMESPACE + "orderCount", user_id);
		return count;
	}

	@Override
	public List<OrderListCountDto> getCustomerOrderCountList(String user_id) {
		List<OrderListCountDto> customerOrderCountList = sqlSession.selectList(NAMESPACE + "getCustomerOrderCountList", user_id);
		return customerOrderCountList;
	}
	
	/* 유저 포인트 변경 (포인트 추가, 감소, ..) */
	@Override
	public int updateUserPoint(int user_point, String user_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_point", user_point);
		map.put("user_id", user_id);
		int count = sqlSession.update(NAMESPACE + "updateUserPoint", map);
		return count;
	}

}
