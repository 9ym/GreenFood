package com.kh.greenfood.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.domain.TestVo;

@Repository
public class MemberDaoImpl implements MemberDao {

	private final String NAMESPACE = "com.kh.greenfood.member.";
	
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

//	@Override
//	public TestVo profilePwCheck(String user_id, String user_pw) {
//		
//		return null;
//	}
	
	

}
