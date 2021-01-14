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

#btnNoticeWrite {
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


#snb .inner_snb {
    border: 1px solid #f2f2f2;
    border-bottom: 0;
}

#snb .list_menu li {
    border-bottom: 1px solid #f2f2f2;
}

#snb .list_menu li.on a, #snb .list_menu li a{
	/* background: #fafafa url(https://res.kurly.com/pc/ico/2008/ico_arrow_6x11_on.svg) no-repeat 230px 52%; */
	color: #B9B5B9;
}

#snb .list_menu li.on a, #snb .list_menu li a:hover {
    background: #fafafa url(https://res.kurly.com/pc/ico/2008/ico_arrow_6x11_on.svg)  no-repeat 230px 52%;
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
    text-align: center;
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
</style>

<script>
$(function(){
	
	$("#btnNoticeWrite").click(function(){
		location.href="/customerCenter/notice/noticeWriteForm";
	});
	
		
	$(".notice_title").click(function(e){
		e.preventDefault();
		var n_no = $(this).attr("data-bno");
		
		location.href="/customerCenter/notice/noticeContent/" + n_no;
	});
	
	// 페이지네이션 - 페이지 번호 클릭했을때
	$("a.page-link").click(function(e){
		e.preventDefault();
		var page = $(this).attr("data-page");
		console.log(page);
		$("#frmNoticePaging").find("input[name=page]").val(page);
		$("#frmNoticePaging").submit();
	});
	
	
});
</script>


<!-- ----------------  페이징 폼 넣어주기 -----------------------------------  -->

<%@ include file="../include/frmPaging.jsp" %>

</head>
<body>
${testVo}


	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="row">
						
				<!-- --------------------------- 고객센터 왼쪽 작은창 ---------------------- -->
							<div class="col-md-3">
							<div id="snb" class="snb_cc">
								<h2 class="tit_snb">고객센터</h2>
								<div class="inner_snb">
									<ul class="list_menu">
										<li class="on"><a href="#">공지사항</a></li>
										<li><a href="/customerCenter/question/questionContent">자주하는 질문</a></li>
										<li><a href="/customerCenter/questionOne/questionOneContent" >1:1 문의</a></li>
										<!-- <li><a href="#">상품 제안</a></li>
										<li><a href="#">에코포장 피드백</a></li> -->
									</ul>
								</div>
								<!-- <a href="#"
									class="link_inquire"><span class="emph">도움이 필요하신가요 ?</span>
									1:1 문의하기</a> -->
								</div>
							</div>


				<!-- ------------------------- 공지사항 메인 창 --------------------------- -->
							<div class="col-md-9">
							
								<!-- ----------------- 메인창의 윗부분 ---------------------- -->
							
								<div class="head_aticle">
									<h2 class="tit">
										공지사항 <span class="tit_sub"> 새로운 공지사항과 소식을 확인해주세요.</span>
										<c:if test="${sessionScope.testVo.user_id == 'admin'}">
											<button type="button" id="btnNoticeWrite">공지사항 작성</button>
										</c:if>
									</h2>

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
																<th>번호</th>
																<th>제목</th>
																<th>작성자</th>
																<th>작성일</th>
																<th>조회수</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="noticeVo" items="${noticeList}">
																<tr>
																	<td>${noticeVo.notice_no}</td>
																	<td><a class="notice_title" href="#"
																		data-bno="${noticeVo.notice_no}">${noticeVo.notice_title}</a></td>
																	<td>관리자</td>
																	<td><fmt:formatDate pattern="yyyy-MM-DD" value="${noticeVo.notice_date}"/></td>
																	<td><span class="badge badge-success">${noticeVo.notice_readcount}</span></td>
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
							</div>
							<!-- // 공지사항메인창  -->



						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>