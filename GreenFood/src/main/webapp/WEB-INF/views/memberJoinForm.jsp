<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/css_memberJoinForm.css"/>

<div id="JoinText">
회원가입
</div>
<div id="JoinFormContent">
	<div id="joinFormspan">
		<p><span>그린푸드</span>에 오신것을 환영합니다. </p>
		<p>해당하는 회원 유형을 선택해주세요.</p>
	</div>
	<div id="JoinChoice">
		<div id="Join_pic1"><a href="/customer/customerMemberJoinForm"><img src="${path}/resources/images/join_choice_1.png"></a></div>
		<div id="Join_pic2"><a href="/member/sellerMemberJoin"><img src="${path}/resources/images/join_choice_2.png"></a></div>
	</div>
	
</div>
