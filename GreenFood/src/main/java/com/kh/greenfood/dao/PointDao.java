package com.kh.greenfood.dao;

public interface PointDao {

	/* 배송완료 클릭시 user_level에 따라 포인트 % 지급*/
	public int insertPoint(String user_id, int point_category, int discount);
	
}
