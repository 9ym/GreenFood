<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../../include/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Question Answer</title>

<script>
$(function(){
	
	$("#btnList").click(function(){
		location.href="/customerCenter/question/questionContent";
	});
	
});
</script>

</head>
<body>
<style>
.question_tit{
    font-weight: 800;
    font-family: noto sans;
    font-size: 30px;
    color: #333;
    line-height: 30px;
    text-align: center;
    letter-spacing: -.5px;
}

.question_sub {
    font-family: noto sans;
    font-size: 14px;
    color: #999;
    line-height: 10px;
    letter-spacing: -.3px;
    text-align: center;
}

.question_page_top {
    overflow: hidden;
    width: 1050px;
    margin: 0 auto;
    padding: 45px 0 20px;
}

.tableView {
    table-layout: fixed;
    border-top: 2px solid #6ca435;
    border-bottom: 1px solid #f4f4f4;
    color: #333;
    line-height: 180%;
    margin-top: 20px;
}

tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

table {
    border-collapse: collapse;
    border-spacing: 0;
}

.tableView td {
    width: auto;
    padding: 13px 0 13px 23px;
    border-top: 1px solid #f4f4f4;
    
}

.tableView th {
    width: 130px;
    padding: 13px 0 13px 0;
    background-color: #39D070;
    border-top: 1px solid #f4f4f4;
    text-align: center;
}

.questionAnswer {
	padding: 10px;
	height: auto;
	valign: top;
	border-bottom-style: groove;
	border-width: 1px;
	border-color: #6ca435;
	
}

.btnList {
	padding: 20px;
	display: flex;
  	align-items: center;
  	justify-content: center;
  	
 }

.contentArea {
	background-color: #FFFFFF;
	padding-right: 10px;
    padding-left: 10px;
}

.container-fluid {
	padding-top: 150px;
}
</style>



	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
			<div class="question_page_top">
				<h2 class="question_tit">자주하는 질문 답변</h2>
				<h2 class="question_sub">자주하는 질문의 답변을 확인하세요</h2>
			</div>
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<table class="tableView" width="100%">
							<tbody>
								<tr>
									<th>제목</th>
									<td colspan="5">${questionVo.question_title}</td>
									</tr>
								<tr>
									<th>카테고리</th>
									<td>${questionVo.question_category}</td>
									<th>작성자</th>
									<td>관리자</td>
									<th>작성일</th>
									<td>${questionVo.question_date}</td>
									
								</tr>
								</tbody>
						</table>
						<!-- <div class="noticeContent"> -->
						<div class="questionAnswer">
						<div class="contentArea">
							<%-- <p value="">${noticeVo.notice_content}</p> --%>
							<p value="">${questionVo.question_content}</p>
						</div>
						</div>
					</div>
					<div class="col-md-3"></div>
				</div>
			</div>
		</div>
	</div>
	
	<div>
	<div class="btnList" >
		<button type="submit" id="btnList" class="btn btn-success">목록</button>
		
		<!-- <form action="/customerCenter/question/updateQuestion" method="get">
			<input type="submit" id="btnUpdateQuestion"" class="btn btn-warning" style="margin-left: 10px"
				value="수정"/>
		</form> -->
		<form action="/customerCenter/question/deleteQuestion" method="get">
			<input type="hidden" name="question_no" class="btn btn-danger" value="${questionVo.question_no }"/>
			<button type="submit" id="btnDeleteQuestion" class="btn btn-danger" style="margin-left: 10px">삭제</button>
		</form>
		
	</div>
	</div>

</body>
</html>