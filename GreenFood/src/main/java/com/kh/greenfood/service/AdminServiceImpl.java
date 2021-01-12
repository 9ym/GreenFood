package com.kh.greenfood.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.greenfood.dao.AdminDao;
import com.kh.greenfood.dao.MemberDao;
import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.PointVo;
import com.kh.greenfood.domain.TestVo;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDao adminDao;

	@Override
	public List<TestVo> getCustomerList() {
		List<TestVo> customerList = adminDao.getCustomerList();
		return customerList;
	}

	@Override
	public int deleteCustomer(String user_id) {
		int count = adminDao.deleteCustomer(user_id);
		return count;
	}
}

