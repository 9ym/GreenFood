package com.kh.greenfood.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.greenfood.dao.PointDao;

@Service
public class PointServiceImpl implements PointService {
	
	@Inject
	private PointDao pointDao;

	/* 배송완료 클릭시 user_level에 따라 포인트 % 지급*/
	@Override
	public int insertPoint(String user_id, int point_category, int discount) {
		int count = pointDao.insertPoint(user_id, point_category, discount);
		return count;
	}

}
