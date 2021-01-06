<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../../include/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Question</title>


<!-- <script>
	var data = $(this).attr("data");
	console.log("data:"+data);
	
	$("#boardNames").text(data);
</script> -->

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
	width: 600px;
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
	
	// 자주하는 질문 작성 버튼 누르면 작성창으로 이동
	$("#btnQuestionWrite").click(function(){
		location.href="/customerCenter/question/questionWriteForm";

	});
	
	$(".question_title").click(function(e){
		e.preventDefault();
		var q_no = $(this).attr("data-bno");
		
		location.href="/customerCenter/question/questionAnswer/" + q_no;
	});
	
	// 페이지네이션 - 페이지 번호 클릭했을때
	$("a.page-link").click(function(e){
		e.preventDefault();
		var page = $(this).attr("data-page");
		console.log(page);
		$("#frmQuestionPaging").find("input[name=page]").val(page);
		$("#frmQuestionPaging").submit();
	});
	
	// 카테고리별 리스트 넘겨주기
	 /* $("#questinoMember").click(function(){
		 var category_no = $(this).attr("data-category");
		location.href="/customerCenter/question/questionContent/" + category_no;
		
		var url = "/customerCenter/question/questionListOfCategory";
		var sendData = {
				"question_category" 		: parseInt("${questionVo.question_category}"),
				"question_category_dsc"		: $("#question_category_dsc").val()
		};
		console.log(sendData);
//			$.post(url, sendData, function(data) {
//				console.log(data); // success
//			});
		// $.get, $.post 원형
		// header에 json형식임을 설정
		// JSON.stringify(json) -> json형식을 문자열 형식
		// dataType -> text
		
		$.ajax({
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json"
			},
			"method" : "post",
			"dataType" : "text",
			"data" : JSON.stringify(sendData),
			"success" : function(data) {
				console.log(data);
				if (data == "success") {
					$("#btnCommentList").trigger("click");
					$("#c_content").val("");
					$("#c_user_id").val("");
				}
			}
		});
	}); */
	
	/* $("#questionMember").click(function(e){
		e.preventDefault();
		var m_no = $(this).attr("data-mno");
		
		location.href="/customerCenter/question/questionContent/" + m_no;
	}); */
	
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
										<li><a href="#">자주하는 질문</a></li>
										<!-- <li><a href="#">1:1 문의</a></li>
										<li><a href="#">상품 제안</a></li>
										<li><a href="#">에코포장 피드백</a></li> -->
									</ul>
								</div>
								<!-- <a href="#"
									class="link_inquire"><span class="emph">도움이 필요하신가요 ?</span>
									1:1 문의하기</a> -->
								</div>
							</div>


				<!-- ------------------------- 자주하는 질문 메인 창 --------------------------- -->
							<div class="col-md-9">
								<div class="head_aticle">
									<h2 class="tit">
										자주하는 질문 <span class="tit_sub"> 자주하시는 질문을 모두 모았습니다.</span>
										<!-- <button type="button" id="btnNoticeWrite">공지사항 작성</button> -->
										
										<!-- 자주하는 질문 드롭다운 -->
										
											<div class="col-md-12">
												<button type="button" id="btnQuestionWrite">Q&A 작성</button>
												<div class="dropdown">
													<button class="btn btn-primary dropdown-toggle"
														type="button" id="dropdownMenuButton"
														data-toggle="dropdown">카테고리 선택</button>
													<!-- <form action="/customerCenter/question/questionContentOfCategory" method="get"> -->
													<div class="dropdown-menu"	aria-labelledby="dropdownMenuButton">
														
														<%-- <c:forEach var="questionVo" items="${getQuestionListOfCategory}"> --%>
														<%-- <a class="dropdown-item" href="/customerCenter/question/questionContent/${questionVo.question_category}">회원문의</a>  --%>
														<a class="dropdown-item" id="questinoMember" href="#">회원문의</a> 
														<%-- </c:forEach> --%>
														<a class="dropdown-item" href="#">주문/결제</a> 
														<a class="dropdown-item" href="#">취소/교환/반품</a>
														<a class="dropdown-item" href="#">쿠폰/적립금</a>
														<a class="dropdown-item" href="#">이용 및 기타</a>
													</div>
													<!-- </form> -->
												</div>
											</div>
										
										<!-- // 자주하는 질문 드롭다운  -->

									</h2>
									
								</div>

								<!-- <form name=frmList action="" onsubmit="return chkFormList(this)"> -->

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
									</style>


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
																	<th>번호</th>
																	<th>카테고리</th>
																	<th>제목</th>
																</tr>
															</thead>
															<tbody>
															<c:forEach var="questionVo" items="${questionList}">
																<tr>
																	<td>${questionVo.question_no}</td>
																	<td>${questionVo.question_category_dsc}</td>
																	<td><a class="question_title" href="#" data-bno="${questionVo.question_no}">
																		${questionVo.question_title}</a></td>
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
								</div><!-- pagination -->
									
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