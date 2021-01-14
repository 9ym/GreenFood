package com.kh.greenfood.service;

import java.util.List;

import com.kh.greenfood.domain.PagingDto;
import com.kh.greenfood.domain.TestVo;

public interface AdminService {
	
	// 회원정보 가져오기
	public List<TestVo> getCustomerList(PagingDto pagingDto);
	
	// 회원 강제 탈퇴
	public int deleteCustomer(String user_id);
	
	// 회원 전체 몇명인지 카운트
	public int customerListCount(PagingDto pagingDto);

	// 회원 탈퇴상태 Y 리스트
	public List<TestVo> getDeletedCustomerList(PagingDto pagingDto);
}
