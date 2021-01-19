package com.kh.greenfood.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.greenfood.dao.AdminDao;
import com.kh.greenfood.dao.MemberDao;
import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.PointVo;
import com.kh.greenfood.domain.TestVo;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDao adminDao;

	@Override
	public List<TestVo> getCustomerList(PagingDto pagingDto) {
		List<TestVo> customerList = adminDao.getCustomerList(pagingDto);
		return customerList;
	}

	@Override
	public int deleteCustomer(String user_id) {
		int count = adminDao.deleteCustomer(user_id);
		return count;
	}

	@Override
	public int customerListCount(PagingDto pagingDto) {
		int count = adminDao.customerListCount(pagingDto);
		return count;
	}

	@Override
	public List<TestVo> getDeletedCustomerList(PagingDto pagingDto) {
		List<TestVo> getDeletedCustomerList = adminDao.getDeletedCustomerList(pagingDto);
		return getDeletedCustomerList;
	}

	@Override
	public int deletedCustomerListCount(PagingDto pagingDto) {
		int count = adminDao.deletedCustomerListCount(pagingDto);
		return count;
	}

}

