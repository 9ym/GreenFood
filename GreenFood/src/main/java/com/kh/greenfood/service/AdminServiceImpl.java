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

	@Override
	public List<CustomerVo> getCustomerList(PagingDto pagingDto) {
		List<CustomerVo> customerList = adminDao.getCustomerList(pagingDto);
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
	public List<CustomerVo> getDeletedCustomerList(PagingDto pagingDto) {
		List<CustomerVo> getDeletedCustomerList = adminDao.getDeletedCustomerList(pagingDto);
		return getDeletedCustomerList;
	}

	@Override
	public int deletedCustomerListCount(PagingDto pagingDto) {
		int count = adminDao.deletedCustomerListCount(pagingDto);
		return count;
	}

}

