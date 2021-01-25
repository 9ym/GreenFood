<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/css_customerMyPage.css"/>
<style>
.container-fluid {
	padding-top : 150px;
}

.grade{
	
	background: #f7f7f7;
    padding: 123px 0 25px;
    background-repeat: no-repeat;
    background-position: center;
}

th {
    font-family: 'Noto Sans KR';
    font-weight: 400;
    font-size: 18px;
    color: #777;
    line-height: 1.5;
    vertical-align: middle;
    padding: 16px 30px;
    background: #eee;
    border-right: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
}

td {
	font-family: 'Noto Sans KR';
    font-weight: 400;
    font-size: 18px;
    color: #777;
    line-height: 1.5;
    vertical-align: middle;
    padding: 16px 30px;
    border-right: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
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
		<div><a href="/customer/customerProfile" class="btn">프로필</a></div>
		<div><a href="/customerCenter/question/questionContent" class="btn">Q&amp;A</a></div>
	</div>
	</div>
<!--오른쪽 메뉴-->
	<div id="content_right" style="float:right; width:1000px;border-top:2px solid #6ca435;box-shadow:3px 3px 3px #c7c7c7;margin-bottom:200px;">
		<div id="pageName" >등급별 혜택</div>	
		<table>
			<thead>
				<tr>
					<th>등급</th>
					<th class="grade GOLD">
						<p><img src="https://greenfood.s3.ap-northeast-2.amazonaws.com/customer_membership/membership_vip.jpg"></p>
						<p>VIP</p>
					</th>
					<th class="grade SILVER">
						<p><img src="https://greenfood.s3.ap-northeast-2.amazonaws.com/customer_membership/membership_gold.jpg"></p>
						<p>GOLD</p>
					</th>
					<th class="grade NORMAL">
						<p><img src="https://greenfood.s3.ap-northeast-2.amazonaws.com/customer_membership/membership_silver.jpg"></p>
						<p>SILVER</p>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>등급기준</th>
					<td>10회 이상 구매</td>
					<td>5회 이상 구매</td>
					<td>회원 가입 시</td>
				</tr>
				<tr>
					<th>등급혜택</th>
					<td>
						<ul>
							<li>
								<p>포인트 5% 적립</p>
							</li>
							<li>
								<p>깜짝 딜 쿠폰</p>
								<p>(매월 1일 자동발급)</p>
							</li>
							<li>
								<p>무료배송</p>
							</li>
						</ul>
					</td>
					<td>
						<ul>
							<li>
								<p>포인트 3%적립</p>
							</li>
							<li>
								<p>깜짝 딜 쿠폰</p>
								<p>(매월 1일 자동발급)</p>
							</li>
							<li>
								<p>무료배송</p>
							</li>
						</ul>
					</td>
					<td>
						<ul>
							<li>무료배송</li>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</content>
