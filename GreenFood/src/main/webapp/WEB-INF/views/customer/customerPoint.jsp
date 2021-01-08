<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/css_customerMyPage.css"/>
<style>
.container-fluid {
	padding-top : 150px;
}

</style>
<script>
$(function(){
	/* 헤더 배경화면, 게시판 이름 바꾸는 부분 */
	/* url 뒤에 사진 넣으면됩니다. */
	$("#page_background").css({"background-image":"url('${path}/resources/images/login_dog.jpg')"});
	$("#page_background").css({"background-size":"100% 100%"});
	$("#page_background").css({"background-repeat":"no-repeat"});
	$("#boardNames").text("마이페이지");/* 게시판 이름 */
	
});
</script>
<content>
<div class="container-fluid">
	<div id="content_left" style="width:300px; height: 700px; float:left; border-top:2px solid #6ca435; margin:0; padding:0;">
	<div id="leftContent_top">
		<div id="profileImgBox" style="background: #BDBDBD;">
			<!--여기에 사진 파일주소 넣어줌-->
			<img class="profile" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCZq00uO6xhj9L20RgKIakgz8aYT3wfFqZKw&usqp=CAU">
		</div>
		<p>반갑습니다!</p>
		<p>구매자</p>
		<p><span id="spanUserName">${sessionScope.testVo.user_name}</span>님</p>
	</div>
	<div id="left_bottom">
		<div><a href="/customer/customerProfile" class="btn">프로필</a>></div>
		<div>나의 쇼핑 활동</div>
		<div>Q&amp;A</div>
	</div>
	</div>
	<!--오른쪽 메뉴-->
	<div id="content_right" style="float:right; width:1000px;border-top:2px solid #6ca435;box-shadow:3px 3px 3px #c7c7c7;margin-bottom:200px;">
		<div id="pageName" >적립금 내역</div>	
		<div class="row">
		<div class="col-md-12">
			<table class="table table-bordered table-hover table-sm">
				<thead>
					<tr>
						<th>
							#
						</th>
						<th>
							order_code
						</th>
						<th>
							Point_score
						</th>
						<th>
							Point_date
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							1
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							dd
						</td>
						<td>
							01/04/2012
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	</div>
	
</div>
</content>
