package com.kh.greenfood.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.PointVo;
import com.kh.greenfood.domain.TestVo;

@Repository
public class AdminDaoImpl implements AdminDao {

	private final String NAMESPACE = "com.kh.greenfood.admin.";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<TestVo> getCustomerList() {
		List<TestVo> customerList = sqlSession.selectList(NAMESPACE + "getCustomerList");
		return customerList;
	}

	@Override
	public int deleteCustomer(String user_id) {
		int count = sqlSession.update(NAMESPACE + "deleteCustomer", user_id);
		return count;
	}

}
