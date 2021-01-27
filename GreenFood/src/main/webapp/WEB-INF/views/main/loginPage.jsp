<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/css_loginPage.css"/>

<!-- 토글 -->
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<!-- 토글 끝 -->
<style>
.container-fluid {
	padding-top : 150px;
}

.toggle.ios, .toggle-on.ios, .toggle-off.ios {
	border-radius: 10px; }
  
.toggle.ios .toggle-handle {
	border-radius: 10px;
}

</style>

<script>
$(function(){
	
	var msg = "${msg}";
	var user_id = "${findUser_id}";
	if(msg == "tempPasswordCreate"){
		alert("임시 비밀번호가 발송되었습니다. 이메일을 확인해 주세요.");
	} else if(user_id != ""){
		alert("회원님의 아이디는" + user_id + "입니다.")
	} else if(msg == "missing"){
		alert("잘못된 접근입니다.");
	} else if(msg == "loginFail"){
		alert("로그인 실패");
	} else if(msg == "memberJoinSuccess"){
		alert("회원가입 성공");
	} else if(msg == "deletedCustomer"){
		alert("삭제된 아이디입니다.");
	}
	
	/* 헤더 배경화면, 게시판 이름 바꾸는 부분 */
	/* url 뒤에 사진 넣으면됩니다. */
	$("#page_background").css({"background-image":"url('${path}/resources/images/login_dog.jpg')"});
	$("#page_background").css({"background-size":"100% 100%"});
	$("#page_background").css({"background-repeat":"no-repeat"});
	$("#boardNames").text("로그인");/* 게시판 이름 */
	
	// 로그인 버튼 클릭시 -> 회원 정보 폼 전송
	$("#btnLogin").click(function(){
		$("#frmlogin").submit();
	});
	
	// 회원가입 버튼 클릭시 -> 회원가입 페이지 이동
	$("#btnJoin").click(function(){
		location.href="/main/memberJoinForm";
	});

});
</script>
<content>
<div class="container-fluid">
	<form id="frmlogin" action="/loginRun" method="post">
		<div id="div_loginForm">
		<p>로그인</p>
		아이디
		<input type="text" id="user_id" name="user_id" class="input_login" placeholder="아이디를 입력해주세요" required value="${cookie.save_id.value}"></input>
		비밀번호

		<input type="password" id="user_pw" name="user_pw" class="input_login" placeholder="비밀번호를 입력해주세요" required></input>
		
		<!-- 토글 -->
  		<div>
    		<input type="checkbox" checked data-toggle="toggle" data-onstyle="success" data-style="ios" id="input_checkBox" name="checked_id"
    		<c:if test="${not empty cookie.save_id.value}">
				checked
			</c:if>
    		>
   			<label for="input_checkBox">아이디 저장</label>
  		</div>
		<!-- // 토글 -->
		
		<a href="/main/customerFindId" id="a_searchId" class="a_login">아이디 찾기</a>
		<img src="https://www.oasis.co.kr/images/common/bg_footer.png">
		<a href="/main/customerFindPw" id="a_searchPw" class="a_login">비밀번호 찾기</a>
		<button type="button" class="btnLoginPage" id="btnLogin" >로그인</button>
		<button type="button" class="btnLoginPage"id="btnJoin">회원가입하기</button>
		</div>		
	</form>
</div>
</content>
