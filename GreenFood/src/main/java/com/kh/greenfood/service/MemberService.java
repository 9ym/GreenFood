package com.kh.greenfood.service;

import java.util.List;

import com.kh.greenfood.domain.OrderListCountDto;
import com.kh.greenfood.domain.OrderVo;
import com.kh.greenfood.domain.PointVo;
import com.kh.greenfood.domain.TestVo;

public interface MemberService {
	
	public TestVo login(String user_id, String user_pw);
	
	// 회원가입
	public int insertMember(TestVo testVo);
	
	// 회원조회 아이디 값으로 DB 정보불러오기
	public TestVo selectMember(String user_id);
	
//	public TestVo profilePwCheck(String user_id, String user_pw);
	
	// 프로필상 비밀번호 변경, 로그인페이지 비밀번호 찾기 -> 임시비밀번호 발급
	public int changePw(String user_id, String user_pw);
	
	// 비밀번호 찾기 -> 아이디, 이메일 정보 확인
	public TestVo findPw(String user_id, String user_email);
	
	// 아이디 찾기 -> 이름, 이메일, 핸드폰번호 확인
	public TestVo findId(String user_name, String user_email, String user_phone);
	
	// 프로필 회원정보 수정
	public int customerModify(TestVo testVo);

	// 전체 주문정보 불러오기
	public List<OrderVo> getOrderedList(String user_id);

	// 최근 주문 리스트 3개만 불러오기
	public List<OrderVo> getLatestOrderedList(String user_id);
	
	// 유저 포인트 정보 불러오기
	public List<PointVo> getUserPoint(String user_id);

	// 포인트 부여
	public void insertPoint(String user_id);

	// 포인트 합계(마이페이지)
	public int getPointSum(String user_id);
	
	// 주문갯수(배송완료)
	public int orderCount(String user_id);

	// 주문 총 갯수(입금전, 상품준비, 배송중, 배송완료)
	public List<OrderListCountDto> getCustomerOrderCountList(String user_id);
	
	/* 포인트 사용 (tbl_member, tbl_point) ->> 오더 서비스에서 함 */ 
//	public int subUserPoint(String user_id, int point_score, int point_category, int point_now);
	
	/* 포인트 추가 (tbl_member, tbl_point) */
	public int addUserPoint(String user_id, int point_score, int point_category, int point_now);

	/* 주문 건수에 따라 5회면 gold로 10회면 vip로 */
	public int updateUserLevel(String user_id, int user_level);

	public void updateUserPoint(String user_id, int discount);

}
