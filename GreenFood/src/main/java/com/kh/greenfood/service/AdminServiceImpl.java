package com.kh.greenfood.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.greenfood.dao.AdminDao;
import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.CustomerVo;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDao adminDao;

	// 회원정보 가져오기
	@Override
	public List<CustomerVo> getCustomerList(PagingDto pagingDto) {
		List<CustomerVo> customerList = adminDao.getCustomerList(pagingDto);
		return customerList;
	}

	// 회원 강제 탈퇴
	@Override
	public int deleteCustomer(String user_id) {
		int count = adminDao.deleteCustomer(user_id);
		return count;
	}

	// 회원 전체 몇명인지 카운트
	@Override
	public int customerListCount(PagingDto pagingDto) {
		int count = adminDao.customerListCount(pagingDto);
		return count;
	}

	// 회원 탈퇴상태 Y 리스트
	@Override
	public List<CustomerVo> getDeletedCustomerList(PagingDto pagingDto) {
		List<CustomerVo> getDeletedCustomerList = adminDao.getDeletedCustomerList(pagingDto);
		return getDeletedCustomerList;
	}

	// 탈퇴한 회원 전체 카운트
	@Override
	public int deletedCustomerListCount(PagingDto pagingDto) {
		int count = adminDao.deletedCustomerListCount(pagingDto);
		return count;
	}

}

