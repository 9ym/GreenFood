<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../../include/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QuestionOneContent</title>



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
    /* border-bottom-style: groove; */
	border-width: 1px;
	border-color: #6ca435;
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
	/* border-bottom-style: solid; */
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
    padding: 15px 0 15px 0px;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

.xans-board-listheader td:nth-child(3) {
    padding: 15px 0 15px 20px;
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

/* input {
	width: 150px;
	padding: 6px 5px;
    border: 1px solid #d9d9d9;
    color: #202020;
} */

.bhs_button.yb {
	width: 150px;
	padding: 6px 5px;
    border: 1px solid #d9d9d9;
    color: #202020;
    background-color: #62b748;
    color: #fff;
}

.bhs_button.yb:hover {
    background-color: #5AB63F;
    color: #fff;
    border-style:  solid;
    border-color: #38b612;
}

.container-fluid {
	padding-top: 150px;
}

.badge {
    display: inline-block;
    padding: .25em .4em;
    font-size: 85%;
    font-weight: 700;
    line-height: 1;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: .25rem;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}


.col-md-12 {
	padding-top: 30px;
}

.main-col {
	padding-top: 30px;
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
	$("#btnQuestionOneWrite").click(function(){
		location.href="/customerCenter/questionOne/questionOneWrite";

	});
	
	$(".questionOne_title").click(function(e){
		e.preventDefault();
		var q_o_no = $(this).attr("data-bno");
		
		location.href="/customerCenter/questionOne/questionOneAnswer/" + q_o_no;
	});
	
}); 
</script>

<!-- ----------------  페이징 폼 넣어주기 -----------------------------------  -->

<%@ include file="../../include/frmPaging.jsp" %>

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
							<div class="col-md-3">
							<div id="snb" class="snb_cc">
								<h2 class="tit_snb">고객센터</h2>
								<div class="inner_snb">
									<ul class="list_menu">
										<li class="on"><a href="/customerCenter/customerCenterMain">공지사항</a></li>
										<li class="on"><a href="/customerCenter/question/questionContent">자주하는 질문</a></li>
										<li><a href="#">1:1 문의</a></li>
									</ul>
								</div>
								</div>
							</div>


				<!-- ------------------------- 자주하는 질문 메인 창 --------------------------- -->
						
							<div class="col-md-9">
							
							<!-- ----------------- 메인창의 윗부분 ---------------------- -->
							
								<div class="head_aticle">
									<h2 class="tit">
										1 : 1  문의 <span class="tit_sub"> 궁금하신 내용을 문의해 주세요.</span>
										<!-- <button type="button" id="btnNoticeWrite">공지사항 작성</button> -->
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
																<th style="width : 60px;">번호</th>
																<th style="width : 150px;">카테고리</th>
																<th>제목</th>
																<th style="width : 150px;">작성자</th>
																<th style="width : 150px;">작성일</th>
																<th style="width : 100px;">답변여부</th>
																
															</tr>
														</thead>
														<tbody>
															
															
													<!-- ------------------ user 일때 해당하는 리스트 보여주기 --------------------- -->
													
													
												<c:choose>
													<c:when test="${sessionScope.customerVo.user_id != 'admin' && count == 0}"> 
														<tr>
																<td colspan=6> 문의하신 내역이 없습니다.</td>
														</tr>
													</c:when>
													<c:otherwise>
														<c:forEach var="questionOneVo" items="${questionOneList}">
															<c:choose>
															
															<c:when test="${sessionScope.customerVo.user_id == 'admin' && count == 0}">
																	<tr>
																	<td>${questionOneVo.q_o_no }</td>
																	<td>${questionOneVo.question_category_dsc }</td>
																	<td><a class="questionOne_title" href="#"
																		data-bno="${questionOneVo.q_o_no}">${questionOneVo.q_o_title}</a>
																	</td>
																	<td>${questionOneVo.q_o_writer }</td>
																	<td><fmt:formatDate pattern="yyyy-MM-DD" value="${questionOneVo.q_o_date}"/></td>
																	
																	<td>
																		<c:choose>
																			<c:when test="${questionOneVo.q_o_answer == null}">
																				<span style="color: white" class="badge badge-success">답변중</span>
																			</c:when>
																			<c:otherwise>
																				<span style="color: white" class="badge badge-primary">답변완료</span>
																			</c:otherwise> 
																		</c:choose>
																	</td>
																</tr>
																
																</c:when>
															
															<c:when test="${sessionScope.customerVo.user_id == questionOneVo.q_o_writer}">
																
																<tr>
																	<td>${questionOneVo.q_o_no }</td>
																	<td>${questionOneVo.question_category_dsc }</td>
																	<td><a class="questionOne_title" href="#"
																		data-bno="${questionOneVo.q_o_no}">${questionOneVo.q_o_title}</a>
																	</td>
																	<td>${questionOneVo.q_o_writer }</td>
																	<td><fmt:formatDate pattern="yyyy-MM-DD" value="${questionOneVo.q_o_date}"/></td>
																	
																	<td>
																		<c:choose>
																			<c:when test="${questionOneVo.q_o_answer == null}">
																				<span style="color: white" class="badge badge-success">답변중</span>
																			</c:when>
																			<c:otherwise>
																				<span style="color: white" class="badge badge-primary">답변완료</span>
																			</c:otherwise> 
																		</c:choose>
																	</td>
																</tr>
															
																</c:when>
 																</c:choose>
															
															</c:forEach><!-- // user 일때 모든 리스트 보여주기 끝-->
														</c:otherwise>
													</c:choose>
															
															
															
														</tbody>

													</table>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								
								<table width=100%>
									<tr>
										<td align=center style="padding-top: 20px; padding-bottom:20px; border: none;" id="avoidDbl">
										<input type="submit" id="btnQuestionOneWrite" class="bhs_button yb" value="문의사항 작성하기" style="float: none; width: 170px;">
										</td>
									</tr>
								</table>
								
								
								<!-- ----------------------------------- pagination -------------------------------- -->
								
								<!-- 검색 -->
								<div class="row text-center" id="select">
									<select id="selectType">
										<option selected>선택</option>
										<option>제목</option>
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