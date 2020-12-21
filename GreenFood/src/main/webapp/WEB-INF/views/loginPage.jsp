<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/css_loginPage.css"/>
<script>
$(function(){
	/* 헤더 배경화면, 게시판 이름 바꾸는 부분 */
	/* url 뒤에 사진 넣으면됩니다. */
	$("#page_background").css({"background-image":"url('${path}/resources/images/login_dog.jpg')"});
	$("#page_background").css({"background-size":"100% 100%"});
	$("#page_background").css({"background-repeat":"no-repeat"});
	$("#boardNames").text("로그인");/* 게시판 이름 */
	
	var msg = "${msg}";
	if(msg == "loginFail"){
		alert("로그인 실패");
	}

	$("#btnLogin").click(function(){
		console.log("클릭");
		$("#frmlogin").submit();
	});

});
</script>

<content>
	<form id="frmlogin" action="/login" method="post">
		<div id="div_loginForm">
		<p>로그인</p>
		아이디
		<input type="text" id="user_id" name="user_id" class="input_login" placeholder="아이디를 입력해주세요" required></input>
		비밀번호
		<input type="password" id="user_pw" name="user_pw" class="input_login" placeholder="비밀번호를 입력해주세요" required></input>
		<input type="checkbox" id="input_checkBox"><span>로그인유지</span></input><a href="#" id="a_searchId" class="a_login">아이디 찾기</a><img src="https://www.oasis.co.kr/images/common/bg_footer.png"><a href="#" class="a_login">비밀번호 찾기</a>
		<button type="button" id="btnLogin" >로그인</button>
		<button type="button" id="btnJoin">회원가입하기</button>
		</div>
		
</form>
</content>
	
