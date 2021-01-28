<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/css_customerMyPage.css"/>
<style>
.container-fluid {
	padding-top : 150px;
}

</style>
<script src="/resources/js/myScript.js"></script>
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
		<p><span id="spanUserName">${sessionScope.customerVo.user_name}</span>님</p>
	</div>
	<div id="left_bottom">
		<div><a href="/customer/customerProfile" class="btn">프로필</a></div>
		<div><a href="/customerCenter/question/questionContent" class="btn">Q&amp;A</a></div>
	</div>
	</div>
	<!--오른쪽 메뉴-->
	<div id="content_right" style="float:right; width:1000px;border-top:2px solid #6ca435;box-shadow:3px 3px 3px #c7c7c7;margin-bottom:200px;">
	<div id="pageName" >후기 내역</div>
	
	<!-- 전체 주문 내역 -->
		<div class="container">
			<h2>${sessionScope.customerVo.user_name}님 전체 후기내역입니다.</h2>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>번호</th>
						<th>상품명</th>
						<th>별점</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="reviewVo" items="${reviewVoList}">
						<tr>
							<td><a href="/review/reviewContent/${reviewVo.review_no}">${reviewVo.review_no}</a></td>
							<td>${reviewVo.product_title}</td>
							<td>${reviewVo.star_point}</td>
							<td>${reviewVo.review_title}</td>
							<td>${reviewVo.user_id}</td>
							<td>${reviewVo.review_date}</td>
						</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	<!-- // 전체 주문 내역끝 -->
	</div>
</div>
</content>
