<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Center</title>
<style> 
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

#btnReviewWrite {
	width:120px;
	height: 30px;
	font-size: 14px;
	font-style: bold;
	color:#6ca435;
	background-color: #FFFFFF;
	float: right;
    padding: 4px;
    padding-top: 4px;
    padding-right: 4px;
    padding-bottom: 4px;
    padding-left: 4px;
    border-color: #5AB63F;
	border-width: 2px;
}

#btnReviewWrite:hover {
	width:120px;
	height: 30px;
	font-size: 14px;
	font-style: bold;
	color:#ffffff;
	background-color: #5AB63F;
	float: right;
    padding: 4px;
    padding-top: 4px;
    padding-right: 4px;
    padding-bottom: 4px;
    padding-left: 4px;
    border-color: #5AB63F;
	border-width: 2px;
}




.head_aticle {
    padding: 5px 0 1px;
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

.xans-board-listheader tbody tr td a:hover {
	color: #5AB63F;
   
}


.xans-board-listheader th{
    padding: 20px 0;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

.xans-board-listheader td:nth-child(1) {
    padding: 15px 0;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

.xans-board-listheader td:nth-child(2) {
    padding: 15px 0 15px 30px;
    vertical-align: middle;
    font-size: 13px;
}

.xans-board-listheader td:nth-child(3) {
    padding: 15px 0;
    vertical-align: middle;
    font-size: 13px;
}

.xans-board-listheader td:nth-child(4) {
    padding: 15px 0;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

.xans-board-listheader td:nth-child(5) {
    padding: 15px 0;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

.xans-board-listheader td:nth-child(6) {
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

</style>

<script>
$(function(){
	
	$("#btnReviewWrite").click(function(){
		location.href="/review/reviewWrite";
	});
	
		
	$(".review_title").click(function(e){
		e.preventDefault();
		var n_no = $(this).attr("data-bno");
		
		location.href="/review/reviewContent/" + n_no;
	});
	
	// 페이지네이션 - 페이지 번호 클릭했을때
	$("a.page-link").click(function(e){
		e.preventDefault();
		var page = $(this).attr("data-page");
		console.log(page);
		$("#frmReviewPaging").find("input[name=page]").val(page);
		$("#frmReviewPaging").submit();
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
						
				<!-- --------------------------- 고객센터 왼쪽 작은창 ---------------------- -->
							<div class="col-md-1">
							</div>


				<!-- ------------------------- 공지사항 메인 창 --------------------------- -->
							<div class="col-md-10">
							
								<!-- ----------------- 메인창의 윗부분 ---------------------- -->
							
								<div class="head_aticle">
									<h2 class="tit">
										후기모음 <span class="tit_sub"> 고객 여러분의 소중한 후기를 모아 봤습니다.</span>
										
									</h2>
									<div class="div-button" style="padding-bottom: 10px; height: 40px;">
									<button type="button" id="btnReviewWrite">후기 작성하기</button>
									</div>

								</div><!-- // 메인창의 윗부분 -->


								
								<!-- ---------------- 리스트 보여주는 부분 -------------------- -->
								<table width="100%" align="center" cellpadding="0"
								
									cellspacing="0">
									<tbody>
										<tr>
											<td>
												<div
													class="xans-element- xans-myshop xans-myshop-couponserial ">
													<table width="100%" class="xans-board-listheader jh"
														cellpadding="0" cellspacing="0">

														<thead>
															<tr>
																<th style="width : 60px;">번호</th>
																<th style="width : 250px;">상품명</th>
																<th>제목</th>
																<th style="width : 120px;">작성자</th>
																<th style="width : 120px;">작성일</th>
																<th style="width : 80px;">조회수</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="reviewVo" items="${reviewList}">
																<tr>
																	<td>${reviewVo.review_no }</td>
																	<td>작업중</td>
																	<td><a class="review_title" href="#"
																			data-bno="${reviewVo.review_no}">${reviewVo.review_title}</a>
																	</td>
																	<td>작업중</td>
																	<td><fmt:formatDate pattern="yyyy-MM-DD" value="${reviewVo.review_date}"/></td>
																	<td><span class="badge badge-success">${reviewVo.review_readcount}</span>
																	</td>
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
								</div><!-- // pagination -->

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
							<!-- // 리뷰 메인창  -->
							<div class="col-md-1">
							</div>


						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>