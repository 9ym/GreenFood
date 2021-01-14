package com.kh.greenfood.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.TestVo;

@Repository
public class AdminDaoImpl implements AdminDao {

	private final String NAMESPACE = "com.kh.greenfood.admin.";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<TestVo> getCustomerList(PagingDto pagingDto) {
		List<TestVo> customerList = sqlSession.selectList(NAMESPACE + "getCustomerList", pagingDto);
		return customerList;
	}

	@Override
	public int deleteCustomer(String user_id) {
		int count = sqlSession.update(NAMESPACE + "deleteCustomer", user_id);
		return count;
	}

	@Override
	public int customerListCount(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "customerListCount", pagingDto);
		return count;
	}

	@Override
	public List<TestVo> getDeletedCustomerList(PagingDto pagingDto) {
		List<TestVo> getDeletedCustomerList = sqlSession.selectList(NAMESPACE + "getDeletedCustomerList", pagingDto);
		return getDeletedCustomerList;
	}

}
