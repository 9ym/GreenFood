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
	
});
</script>
<content>
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
			<p><span id="spanUserName">000</span>님</p>
		</div>
		
		
		<div id="left_bottom">
			<div>프로필</div>
			<div>나의 쇼핑 활동</div>
			<div>Q&amp;A</div>
		</div>
	</div>
	<!--오른쪽 메뉴-->
	<div id="content_right" style="float:right;
width:1000px;border-top:2px solid #6ca435;box-shadow:3px 3px 3px #c7c7c7;margin-bottom:200px;">
		<div id="pageName" >My Page</div>
		<div id="MyPageContent">
			<p class="bigText">구매자 등급</p>
			<div id="memberLevel">
				<p>회원등급</p>
				<p class="p_left" id="p_memberLevel">LV.3</p>
				<P style="clear:both">다음 등급까지 <span>000</span>점 남았습니다.</P>
			</div>
			<div   id="memberLevel_right">
			<P >등급 혜택 보기 <span class="showsign">></span> </P>
			<p >가입일:<span>2000-01-01</span></p>
			</div>
			<div id="points_review">
				<div id="chkpoints">
					<img src="${path }/resources/images/moneybook.png" style="width:70px;">
					<p>적립금 <span class="showsign">></span></p><img src="">
					<p><span>00000</span>원</p>
				</div>
				<div id="makeReview">
					<img src="${path }/resources/images/pencil_review.png" style="width:70px;">
					<p>후기작성 <span class="showsign">></span></p><img src="">
					<p><span>후기 갯수</span></p>
				</div>
			</div>
			<div id="chkorder">
			<p class="bigText">주문 배송 조회</p><p id="chkorder_secondP">전체 <span class="showsign">></span></p>
				<div id="chkorder_1">
					<span>0</span>
					<p>입금대기중</p>
				</div>
				<div id="chkorder_2">
					<span>0</span>
					<p>상품준비중</p>
				</div >
				<div id="chkorder_3">
					<span>0</span>
					<p>배송중</p>
				</div>
				<div id="chkorder_4">
					<span>0</span>
					<p>배송완료</p>
				</div>
			</div>
			
			<div id="chkList">
			<p class="bigText">취소/교환/반품 내역</p><p id="chkList_secondP">전체 <span class="showsign">></span></p>
				<div id="chkList_1">
					<span>0</span>
					<p>교환신청</p>
				</div>
				<div>
					<span>0</span>
					<p>교환완료</p>
				</div>
				<div>
					<span>0</span>
					<p>반품신청</p>
				</div>
				<div>
					<span>0</span>
					<p>반품완료</p>
				</div>
			</div>
			<div id="orderedList">
				<p class="bigText">주문중인 내역</p><p id="orderedList_secondP">전체 <span class="showsign">></span></p>
				<table>
					<thead>
						<th>주문번호</th>
						<th>상품명</th>
						<th>주문금액</th>
						<th>주문일자</th>
					</thead>
					<tbody>
						<td>123456-789456</td>
						<td>찰옥수수</td>
						<td>150000원</td>
						<td>2020-08-07</td>
					</tbody>
					<tbody>
						<td>123456-789456</td>
						<td>찰옥수수</td>
						<td>150000원</td>
						<td>2020-08-07</td>
					</tbody>
				</table>
			</div>
		</div>
	</div >
</content>
