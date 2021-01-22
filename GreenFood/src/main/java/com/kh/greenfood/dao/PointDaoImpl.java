package com.kh.greenfood.dao;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PointDaoImpl implements PointDao {
	
	private final String NAMESPACE = "com.kh.greenfood.point.";
	
	@Inject
	private SqlSession sqlSession;

	/* 배송완료 클릭시 user_level에 따라 포인트 % 지급*/
	@Override
	public int insertPoint(String user_id, int point_category, int discount) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("point_category", point_category);
		map.put("point_score", discount);
		int count = sqlSession.insert(NAMESPACE + "insertPoint", map);
		return count;
	}
	
}
