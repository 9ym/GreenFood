<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer List</title>

<style>
.notice .layout-pagination {
	margin: 0
}
										
.eng2 {
	color: #939393
}

.xans-board-listheader {
	font-size: 12px
}

.page_aticle.aticle_type2 {
    padding-top: 65px;
}
.page_aticle {
    width: 1050px;
    margin: 0 auto;
}

div {
    display: block;
}


#snb {
	padding: 0 10px 0 20px;
	float: left;
	width: 280px;

}

#snb .tit_snb {
    padding: 8px 0 33px 1px;
    font-weight: 700;
    font-size: 30px;
    line-height: 34px;
    color: #333;
    letter-spacing: -.5px;
}

.tit_sub {
    padding-left: 11px;
    font-size: 14px;
    color: #999;
    line-height: 20px;
    letter-spacing: -.3px;
    vertical-align: 3px;
}

#btnQuestionWrite {
	width:100px;
	height: 35px;
	font-size: 15px;
	font-style: bold;
	color:#6ca435;
	background-color: #FFFFFF;
	float: right;
    padding: 4px;
    padding-top: 4px;
    padding-right: 0;
    padding-bottom: 4px;
    padding-left: 4px;
    border-color: #5AB63F;
	border-width: 2px;
}

#dropdownMenuButton {
	width:135px;
	height: 35px;
	font-size: 15px;
	font-style: bold;
	color:#6ca435;
	background-color: #FFFFFF;
	float: right;
    padding: 4px;
    padding-top: 4px;
    padding-right: 0;
    padding-bottom: 4px;
    padding-left: 4px;
    border-color: #5AB63F;
	border-width: 2px;
}

.dropdown-menu {
    
    z-index: 1000;
    float: left;
    min-width: 160px;
    padding: 0;
    margin: 2px 0 0;
    font-size: 14px;
    text-align: left;
    list-style: none;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid rgba(0,0,0,.15);
    border-radius: 4px;
    box-shadow: 0 6px 12px rgba(0,0,0,.175);
}

.dropdown-item {
    display: block;
    width: 100%;
    padding: 10px 1.5rem;
    clear: both;
    font-weight: 400;
    color: #B9B5B9;
    text-align: inherit;
    white-space: nowrap;
    background-color: transparent;
    border: 0.5px;
    
}

.dropdown-item:hover {
    background: #fafafa  no-repeat 230px 52%;
    background-size: 6px 11px;
    font-weight: 700;
    color: #5AB63F;
    font-size: 16px;
}

#snb .inner_snb {
    border: 1px solid #f2f2f2;
    border-bottom: 0;
}

#snb .list_menu li {
    border-bottom: 1px solid #f2f2f2;
}
 

#snb .list_menu li.on a{
	background: #ffffff no-repeat 230px 52%;
	color: #B9B5B9;
}

#snb .list_menu li a{
	color: #B9B5B9;
}

#snb .list_menu li.on a:hover{
    background: #fafafa url(https://res.kurly.com/pc/ico/2008/ico_arrow_6x11_on.svg) no-repeat 230px 52%;
    background-size: 6px 11px;
    font-weight: 700;
    color: #5AB63F;
}

#snb .list_menu li a{
    background: #fafafa url(https://res.kurly.com/pc/ico/2008/ico_arrow_6x11_on.svg) no-repeat 230px 52%;
    background-size: 6px 11px;
    font-weight: 700;
    color: #5AB63F;
}


#snb .list_menu li a {
    display: block;
    overflow: hidden;
    padding: 15px 0 15px 20px;
    font-size: 15px;
    line-height: 20px;
    letter-spacing: -.3px;
}

.head_aticle {
    padding: 5px 0 34px;
}

thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: green;
}

tbody tr {
    border-top-style: groove;
	border-width: 1px;
	border-color: #6ca435;
}


.xans-board-listheader {
    border-top-style: solid;
	/* border-right-style: dotted; */
	border-bottom-style: solid;
	/* border-left-style: groove; */
	border-width: 1px;
	border-color: #6ca435;
    
}

.xans-board-listheader tbody tr td a {
	color: #333;
   
}

.xans-board-listheader tbody tr td:nth-child(3):hover {
	color: #5AB63F;
   
}


.xans-board-listheader th:nth-child(1){
	width: 70px;
    padding: 20px 0;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

.xans-board-listheader th:nth-child(2){
	width: 135px;
    padding: 20px 0;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

.xans-board-listheader th:nth-child(3){
	width: 300px;
    padding: 20px 0;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

.xans-board-listheader th:nth-child(4){
	width: 135px;
    padding: 20px 0;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

.xans-board-listheader th:nth-child(5){
	width: 135px;
    padding: 20px 0;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

.xans-board-listheader th:nth-child(6){
	width: 70px;
    padding: 20px 0;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

.xans-board-listheader td:nth-child(1) {
	width: 70px;
    padding: 15px 0;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

.xans-board-listheader td:nth-child(2) {
	width: 135px;
    padding: 15px 0;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

.xans-board-listheader td:nth-child(3) {
    padding: 15px 0 15px 40px;
    vertical-align: middle;
    font-size: 13px;
}

.xans-board-listheader td:nth-child(4) {
	width: 135px;
    padding: 15px 0;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

.xans-board-listheader td:nth-child(5) {
	width: 135px;
    padding: 15px 0;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

.xans-board-listheader td:nth-child(6) {
	width: 70px;
    padding: 15px 0;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

.container-fluid {
	padding-top: 150px;
}

.col-md-12 {
	padding-top: 30px;
}

.page-link {
    position: relative;
    display: block;
    padding: .5rem .75rem;
    margin-left: -1px;
    line-height: 1.25;
    color: #7f8284;
    font-size: 13px;
    background-color: #fff;
    border: 1px solid #dee2e6;
}

.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: #5AB63F;
    border-color: #5AB63F;
}

.page-link:hover {
    z-index: 2;
    color: #fff;
    text-decoration: none;
    background-color: #92e978;
    border-color: #92e978;
}

#select {
	width: auto;
	padding: 6px 5px;
    margin-bottom: 30px;
    color: #202020;
    font-size: 14px;
    font-weight: 400px;
    font-family: noto sans;
    justify-content: center!important;
    
}

#selectType {
	border-right-width: 1px;
    padding-right: 20px;
    margin-right: 5px;
    
}

#keyword {
	border-width: 1px;
    padding-right: 20px;
    margin-right: 5px;
    
}

#btnSearch {
	padding-top: 3px;
    padding-bottom: 3px;
    border-width: 1px;
    float: none;
    line-height: 18px;
    width: 70px;
    background-color: #5AB63F;
    color: #fff;
    
}

#deleteCustomer {
	border-width: 1px;
    float: none;
    line-height: 18px;
    width: 60px;
    background-color: #dc3545;
    color: #fff;
}
</style>

<script>
$(function(){
	
	var msg = "${msg}";
	if(msg == "deleteFail"){
		alert("삭제실패");
	}
	
	// 회원 강제 탈퇴
	$(".deleteCustomer").click(function(){
		var vl = $(this).parent().parent();
		var user_id = vl.find("td").eq(0).text();
		$("#frmDeleteCustomer > input[type=hidden]").val(user_id);
 		$("#frmDeleteCustomer").submit();
	});
	
	// 탈퇴한 회원 클릭
// 	$("#selectY").click(function(e){
// 		e.preventDefault();
// 		// N인 것들만 제거
// 		$(".xans-board-listheader > tbody > tr").each(function() {
// 			var td = $(this).find("td").eq(4);
// 			var yn = td.text();
// 			console.log(yn);
// 			if (yn == "N") {
// 				$(this).remove();
// 			}
// 		});
// 	});
	
	// 카테고리 중에서 탈퇴한 회원 클릭
	$("#selectY").click(function(e){
		e.preventDefault();
		$("#frmPaging").attr("action", "/admin/deletedCustomerList");
		$("#frmPaging").attr("method", "post");
		$("#frmPaging > input[name=page]").val(1);
		$("#frmPaging").submit();
	});

	// 회원 이름, 아이디로 검색
	$("#btnSearch").click(function(){
		var selectType = $("#selectType").val();
		var keyword = $("#keyword").val();
		if(keyword == "" || selectType == "선택"){
			alert("타입선택 및 키워드를 입력해주세요.");
			return;
		}
		$("#frmPaging > input[name=selectType]").val(selectType);
		$("#frmPaging > input[name=keyword]").val(keyword);
		$("#frmPaging > input[name=page]").val(1);
		$("#frmPaging").submit();
	});
	
	// 페이지네이션 - 페이지 번호 클릭했을때
	$("a.page-link").click(function(e){
		e.preventDefault();
		var page = $(this).attr("data-page");
		$("#frmPaging").find("input[name=page]").val(page);
		$("#frmPaging").submit();
	});
	
}); 
</script>

<!-- ----------------  페이징 폼 넣어주기 -----------------------------------  -->

<%@ include file="../include/frmPaging.jsp" %>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="row">
						
				<!-- --------------------------- 회원관리 왼쪽 작은창 ---------------------- -->
							<div class="col-md-3">
							<div id="snb" class="snb_cc">
								<h2 class="tit_snb">회원관리</h2>
								<div class="inner_snb">
									<ul class="list_menu">
<!-- 										<li class="on"><a href="/customerCenter/customerCenterMain">공지사항</a></li> -->
										<li><a href="#">회원리스트</a></li>
<!-- 										<li class="on"><a href="/customerCenter/questionOne/questionOneContent" >1:1 문의</a></li> -->
									</ul>
								</div>
								</div>
							</div>


				<!-- ------------------------- 자주하는 질문 메인 창 --------------------------- -->
							<div class="col-md-9">
								<div class="head_aticle">
									<h2 class="tit">
										회원리스트 <span class="tit_sub"> 회원정보리스트</span>
										
										<!-- 자주하는 질문 드롭다운 -->
											<div class="col-md-12">
												<div class="dropdown">
													<button class="btn btn-primary dropdown-toggle"
														type="button" id="dropdownMenuButton"
														data-toggle="dropdown">카테고리 선택</button>
													<div class="dropdown-menu"	aria-labelledby="dropdownMenuButton" id="divCate">
														<a class="dropdown-item" href="/admin/customerList">전체 보기</a>
														<a class="dropdown-item" id="selectY" href="#">탈퇴한 회원</a>
													</div>
												</div>
											</div>
										<!-- // 자주하는 질문 드롭다운  -->

									</h2>
									
								</div>

							<!-- ----------------- 자주하는 질문 리스트 테이블 -------------------- -->
							
									<table width="100%" align="center" cellpadding="0" cellspacing="0">
										<tbody>
											<tr>
												<td>
													<div class="xans-element- xans-myshop xans-myshop-couponserial ">
														<table width="100%" class="xans-board-listheader jh"
															cellpadding="0" cellspacing="0">

															<thead>
																<tr>
																	<th>아이디</th>
																	<th>이름</th>
																	<th>가입날짜</th>
																	<th>코드</th>
																	<th>삭제정보</th>
																	<th>탈퇴</th>
																</tr>
															</thead>
															<tbody>
															<c:forEach var="customerList" items="${customerList}">
																<tr>
																	<td>${customerList.user_id}</td>
																	<td>${customerList.user_name}</td>
																	<td>${customerList.user_date}</td>
																	<td>${customerList.user_code}</td>
																	<td>${customerList.user_deleted}</td>
																	<c:if test="${customerList.user_deleted == 'N'}">
																	<td><button type="button" id="deleteCustomer" class="deleteCustomer">탈퇴</button></td>
																	</c:if>
																</tr>
															</c:forEach>
															</tbody>

														</table>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
									
								<!-- ----------------------------------- pagination -------------------------------- -->

								<div class="row">
									<div class="col-md-12 text-center">
										<nav>
											<ul class="pagination justify-content-center">
												<!-- 이전 -->
												<c:if test="${pagingDto.startPage != 1}">
													<li class="page-item"><a class="page-link" href="#"
														data-page="${pagingDto.startPage - 1}">이전</a></li>
												</c:if>
												<!-- 1 ~ 10 -->
												<c:forEach var="i" begin="${pagingDto.startPage}"
													end="${pagingDto.endPage}">
													<li
														<c:choose>
															<c:when test="${i == pagingDto.page}">
																class="page-item active"
															</c:when>
															<c:otherwise>
																class="page-item"
															</c:otherwise>
														</c:choose>>
														<a class="page-link" href="#" data-page="${i}">${i}</a></li>
												</c:forEach>
												<!-- 다음 -->
												<c:if test="${pagingDto.endPage < pagingDto.totalPage}">
													<li class="page-item"><a class="page-link" href="#"
														data-page="${pagingDto.endPage + 1}">다음</a></li>
												</c:if>
											</ul>
										</nav>
									</div>
								</div>
								<!-- // pagination -->
								
								<!-- 검색 -->
								<div class="row text-center" id="select">
									<select id="selectType">
										<option selected>선택</option>
										<option>이름</option>
										<option>아이디</option>
									</select>
									<input type="text" id="keyword">
									<button type="button" class="" id="btnSearch">검색</button>
									
								</div>
								<!-- //검색 -->

							</div>
							<!-- // 자주하는 질문 메인창  -->

						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>