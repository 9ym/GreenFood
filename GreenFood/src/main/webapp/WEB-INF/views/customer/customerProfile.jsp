<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/css_customerMyPage.css"/>
<script>
$(function(){
	/* 헤더 배경화면, 게시판 이름 바꾸는 부분 */
	/* url 뒤에 사진 넣으면됩니다. */
	$("#page_background").css({"background-image":"url('${path}/resources/images/login_dog.jpg')"});
	$("#page_background").css({"background-size":"100% 100%"});
	$("#page_background").css({"background-repeat":"no-repeat"});
	$("#boardNames").text("마이페이지");/* 게시판 이름 */
	
	$("#btnPassCheckComplete").click(function(){
		var user_pw = $("#user_pw").val();
		
		var url = "/customer/customerProfileRun";
		var sendData = {
				"user_pw" : user_pw
		};
		console.log(sendData);
		$.post(url, sendData, function(data){
			console.log(data);
		});
	});
	
});
</script>
<content>
${testVo}
	<div id="content_left" style="width:300px;
height: 700px;
float:left;
border-top:2px solid #6ca435;
margin:0;
padding:0;">
		<div id="leftContent_top">
			<div id="profileImgBox" style="background: #BDBDBD;">
					<!--여기에 사진 파일주소 넣어줌-->
					<img class="profile" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCZq00uO6xhj9L20RgKIakgz8aYT3wfFqZKw&usqp=CAU">
					</div>
			<p>반갑습니다!</p>
			<p>구매자</p>
			<p><span id="spanUserName">${sessionScope.testVo.user_id}</span>님</p>
		</div>
		
		<div id="left_bottom">
			<div><a href="/customer/customerProfile">프로필</a>></div>
			<div>나의 쇼핑 활동</div>
			<div>Q&amp;A</div>
		</div>
	</div>
	<!--오른쪽 메뉴-->
	<div id="content_right" style="float:right;
width:1000px;border-top:2px solid #6ca435;box-shadow:3px 3px 3px #c7c7c7;margin-bottom:200px;">
		<div id="pageName" >My Profile</div>
		
		<!-- 프로필 폼 들어가기전 비밀번호 확인-->
		<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form" id="frmProfilePwChk" action="/customer/customerProfileRun" method="post">
				<div class="form-group">
					 
					<label for="user_id">
						아이디 : 
					</label>
					<input type="text" class="form-control" id="user_id" value="${sessionScope.testVo.user_id}" readonly/>
				</div>
				<div class="form-group">
					 
					<label for="user_pw">
						비밀번호 확인 : 
					</label>
					<input type="password" class="form-control" name="user_pw" id="user_pw" />
				</div>

				<button type="button" id="btnPassCheckComplete" class="btn btn-primary">
					완료
				</button>
			</form>
		</div>
	</div>
</div>
<!-- // 프로필 폼 들어가기전 비밀번호 확인 끝-->


	</div >
</content>
