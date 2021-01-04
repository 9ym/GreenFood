package com.kh.greenfood.service;

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
	
	public void test();
	
	// 프로필 회원정보 수정
	public int customerModify(TestVo testVo);

}
