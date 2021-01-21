package com.kh.greenfood.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.greenfood.dao.MemberDao;
import com.kh.greenfood.domain.OrderListCountDto;
import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.PointVo;
import com.kh.greenfood.domain.TestVo;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDao memberDao;
	
	@Override
	public TestVo login(String user_id, String user_pw) {
		TestVo testVo = memberDao.login(user_id, user_pw);
		return testVo;
	}
	
	@Transactional
	@Override
	public int insertMember(TestVo testVo) {
		int count = memberDao.insertMember(testVo);
		// 회원가입시 포인트부여(아이디, 포인트점수, 포인트 카테고리)
		memberDao.insertPoint(testVo.getUser_id(), testVo.getUser_point(), 103);
		return count;
	}

	@Override
	public TestVo selectMember(String user_id) {
		TestVo testVo = memberDao.selectMember(user_id);
		return testVo;
	}

	@Override
	public int changePw(String user_id, String user_pw) {
		int count = memberDao.changePw(user_id, user_pw);
		return count;
	}

	@Override
	public int customerModify(TestVo testVo) {
		int count = memberDao.customerModify(testVo);
		return count;
	}

	// 비밀번호 찾기
	@Override
	public TestVo findPw(String user_id, String user_email) {
		TestVo testVo = memberDao.findPw(user_id, user_email);
		return testVo;
	}

	// 아이디 찾기
	@Override
	public TestVo findId(String user_name, String user_email, String user_phone) {
		TestVo testVo = memberDao.findId(user_name, user_email, user_phone);
		return testVo;
	}
	
	// 주문 전체내역 불러오기
	@Override
	public List<OrderVo> getOrderedList(String user_id) {
		List<OrderVo> orderedList = memberDao.getOrderedList(user_id);
		return orderedList;
	}
	
	// 최근 주문내역 3개만 불러오기
	@Override
	public List<OrderVo> getLatestOrderedList(String user_id) {
		List<OrderVo> latestOrderedList = memberDao.getLatestOrderedList(user_id);
		// 포인트 합계
		return latestOrderedList;
	}

	// 유저 포인트 불러오기
	@Override
	public List<PointVo> getUserPoint(String user_id) {
		List<PointVo> pointVo = memberDao.getUserPoint(user_id);
		return pointVo;
	}

	@Override
	public void insertPoint(String user_id) {
//		memberDao.insertPoint(user_id);
	}

	// 포인트 합계
	@Override
	public int getPointSum(String user_id) {
		int pointSum = memberDao.getPointSum(user_id);
		return pointSum;
	}

	@Override
	public int orderCount(String user_id) {
		int count = memberDao.orderCount(user_id);
		return count;
	}

	@Override
	public List<OrderListCountDto> getCustomerOrderCountList(String user_id) {
		List<OrderListCountDto> customerOrderCountList = memberDao.getCustomerOrderCountList(user_id);
		return customerOrderCountList;
	}

//	@Override
//	public TestVo profilePwCheck(String user_id, String user_pw) {
//		TestVo testVo = memberDao.profilePwCheck(user_id, user_pw);
//		return testVo;
//	}
	
	/* 포인트 사용 (tbl_member) */
//	@Override
//	public int subUserPoint(String user_id, int point_score, int point_category, int point_now) {
//		int count = memberDao.insertPoint(user_id, point_score, point_category);
//		int countUpdate = 0;
//		if (count > 0) { // 원래 포인트 - 추가 포인트
//			countUpdate = memberDao.updateUserPoint(point_now - point_score, user_id); 
//		}
//		return countUpdate;
//	}
	
	/* 포인트 추가 (tbl_member, tbl_point) */
	@Override
	@Transactional
	public int addUserPoint(String user_id, int point_score, int point_category, int point_now) {
		int count = memberDao.insertPoint(user_id, point_score, point_category);
		int countUpdate = 0;
		if (count > 0) { // 원래 포인트 + 추가 포인트
			countUpdate = memberDao.updateUserPoint(point_now + point_score, user_id); 
		}
		return countUpdate;
	}
	
	/* 주문 건수에 따라 5회면 gold로 10회면 vip로 */
	@Override
	public int updateUserLevel(String user_id, int user_level) {
		int count = memberDao.updateUserLevel(user_id, user_level);
		return count;
	}
	
}

