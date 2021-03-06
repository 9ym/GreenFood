
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="../include/header.jsp"%>
<%@include file="../include/frmOrdered.jsp" %>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/css_customerMyPage.css"/>
<style>
.container-fluid {
	padding-top : 100px;
}
</style>
<script src="/resources/js/myScript.js"></script>
<script>
$(function(){
	var msg = "${msg}";
	if(msg == "levelUp"){
		alert("levelUp");
	}
	
	/* 마이페이지 최근 주문 내역 addComma */
	$(".addComma").each(function(){
		var text = $(this).text();
		var total_price = addComma(text);
		$(this).text(total_price);
	});
	
	/* 헤더 배경화면, 게시판 이름 바꾸는 부분 */
	/* url 뒤에 사진 넣으면됩니다. */
	$("#page_background").css({"background-image":"url('${path}/resources/images/login_dog.jpg')"});
	$("#page_background").css({"background-size":"100% 100%"});
	$("#page_background").css({"background-repeat":"no-repeat"});
	$("#boardNames").text("마이페이지");/* 게시판 이름 */
	
	var msg = "${msg}";
	if(msg == "modifySuccess"){
		alert("회원정보가 수정되었습니다.");
	}
	
	// 주문내역 상세보기
	$("#btn_allOrderShow").click(function(){
		location.href="/customer/customerOrderdList";
	});
	
});
</script>

<content>
<div class="container-fluid">
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
			<p><span id="spanUserName">${sessionScope.customerVo.user_name}</span>님</p>
		</div>
		
		
		<div id="left_bottom">
			<div><a href="/customer/customerProfile" class="btn">프로필</a></div>
			<div><a href="/customerCenter/question/questionContent" class="btn">Q&amp;A</a></div>
		</div>
	</div>
	<!--오른쪽 메뉴-->
	<div id="content_right" style="float:right;
width:1000px;border-top:2px solid #6ca435;box-shadow:3px 3px 3px #c7c7c7;margin-bottom:200px;">
		<div id="pageName" >My Page</div>
		<div id="MyPageContent">
			<p class="bigText">구매자 등급</p>
			<div id="memberLevel">
				<p class="p_left" id="p_memberLevel">LV.
					<c:if test="${sessionScope.customerVo.user_level == '0'}">
						SILVER
					</c:if>
					<c:if test="${sessionScope.customerVo.user_level == '1'}">
						GOLD
					</c:if>
					<c:if test="${sessionScope.customerVo.user_level == '2'}">
						VIP
					</c:if>
				</p>
				<c:choose>
					<c:when test="${sessionScope.customerVo.user_level == '2' }">
						최고 등급 이십니다.
					</c:when>
					<c:otherwise>
						다음 등급까지 주문
						<span>
							<c:choose>
								<c:when test="${sessionScope.customerVo.user_level eq '0'}">
								
									${5 - orderCount}
									
								</c:when>
								<c:when test="${sessionScope.customerVo.user_level eq '1'}">
								
									${10 - orderCount}
									
								</c:when>
							</c:choose>
						</span>
						번 남았습니다.
					</c:otherwise>
					
				</c:choose>
			</div>
			<div id="memberLevel_right">
				<a href="/customer/customerMembership" class="btn btn-success">등급 혜택 보기 <span class="showsign">></span></a>
				<p >가입일:<span>${sessionScope.customerVo.user_date}</span></p>
			</div>
			<div id="points_review">
				<div id="chkpoints">
					<img src="${path}/resources/images/moneybook.png" style="width:70px;">
					<p><a href="/customer/customerPoint" class="btn">적립금</a><span class="showsign">></span></p><img src="">
					<p><span>${sessionScope.customerVo.user_point}</span>원</p>
				</div>
				<div id="makeReview">
					<img src="${path}/resources/images/pencil_review.png" style="width:70px;">
					<p><a href="/customer/customerReview" class="btn">후기내역</a><span class="showsign">></span></p><img src="">
					<p><span>후기 갯수 : ${reviewCount}개</span></p>
				</div>
			</div>
			<div id="chkorder">
			<p class="bigText">주문 배송 조회</p>
				<c:forEach var="customerOrderCountList" items="${customerOrderCountList}">
					<div>
						<span>
							<a href="/customer/customerOrdStateList/${customerOrderCountList.order_state}">${customerOrderCountList.order_count}</a>
						</span>
						<p>${customerOrderCountList.order_state_dsc}</p>
					</div>
				</c:forEach>
			</div>

			<div id="orderedList">
				<p class="bigText">최근 주문 내역</p><p id="orderedList_secondP">
				<button type="button" id="btn_allOrderShow" class="btn">더보기</button>
				<span class="showsign"></span></p>
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<table class="table table-bordered table-sm">
								<thead>
									<tr>
										<th>주문일</th>
										<th>주문번호</th>
										<th>결제금액</th>
										<th>주문상태</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="latestOrderedList" items="${latestOrderedList}">
									<tr>
										<td>${latestOrderedList.order_date}</td>
										<td><a href="/customer/customerDetailOrder/${latestOrderedList.order_code}">${latestOrderedList.order_code}</a></td>
										<td class="addComma">${latestOrderedList.order_total_price}</td>
										<td>${latestOrderedList.order_state_dsc}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div >
</content>
