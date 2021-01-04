<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	
});
</script>


<!-- <script>
	var data = $(this).attr("data");
	console.log("data:"+data);
	
	$("#boardNames").text(data);
</script> -->

</head>
<body>
<%-- noticeVo:${noticeVo} --%>

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


				<!-- ------------------------- 공지사항 메인 창 --------------------------- -->
							<div class="col-md-9">
								<div class="head_aticle">
									<h2 class="tit">
										공지사항 <span class="tit_sub"> 새로운 공지사항과 소식을 확인해주세요.</span>
										<button type="button" id="btnNoticeWrite">공지사항 작성</button>
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
																	<td><a class="notice_title" href="#" data-bno="${noticeVo.notice_no}">${noticeVo.notice_title}</a></td>
																	<td>관리자</td>
																	<td>${noticeVo.notice_date}</td>
																	<td>230010</td>
																</tr>
															</c:forEach>
															</tbody>

														</table>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
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