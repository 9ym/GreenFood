package com.kh.greenfood.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.CustomerVo;

@Repository
public class AdminDaoImpl implements AdminDao {

	private final String NAMESPACE = "com.kh.greenfood.admin.";
	
	@Inject
	private SqlSession sqlSession;

	// 회원정보 가져오기
	@Override
	public List<CustomerVo> getCustomerList(PagingDto pagingDto) {
		List<CustomerVo> customerList = sqlSession.selectList(NAMESPACE + "getCustomerList", pagingDto);
		return customerList;
	}

	// 회원 강제 탈퇴
	@Override
	public int deleteCustomer(String user_id) {
		int count = sqlSession.update(NAMESPACE + "deleteCustomer", user_id);
		return count;
	}

	// 회원 전체 몇명인지 카운트
	@Override
	public int customerListCount(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "customerListCount", pagingDto);
		return count;
	}

	// 회원 탈퇴상태 Y 리스트
	@Override
	public List<CustomerVo> getDeletedCustomerList(PagingDto pagingDto) {
		List<CustomerVo> getDeletedCustomerList = sqlSession.selectList(NAMESPACE + "getDeletedCustomerList", pagingDto);
		return getDeletedCustomerList;
	}

	// 탈퇴한 회원 토탈 카운트
	@Override
	public int deletedCustomerListCount(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "deletedCustomerListCount", pagingDto);
		return count;
	}

}
