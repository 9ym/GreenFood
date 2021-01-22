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
	
	// ---------------- 수정 버튼 누르면 수정할수 있게 -------------------------	
	$("#btnUpdateQuestion").click(function() {
		$(".update").prop("readonly", false); // 제목, 내용 입력 읽기 전용 제거
		$(this).hide("slow"); // "fast", "normal", "slow"
		$("#btnUpdateFinish").show(1000); // millisecond
	});
	 
// --------------------- 수정 후 수정완료 누르면 입력한 값 넘겨주기 -----------------------
	$("#btnUpdateFinish").click(function() {
		var questino_title = $("#question_title").val(); // title 입력한 값 지정
		var question_content = $("#question_content").val(); // content 입력한 값 지정
		$("#frmUpdate > input[type=hidden]").eq(1).val(questino_title); // 붙여넣기
		$("#frmUpdate > input[type=hidden]").eq(2).val(question_content); // 붙여넣기
		$("#frmUpdate").submit(); // 서밋 해 줘야함..
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
    padding-top: 10px;
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
    display: table-row;
    display: table-cell;
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
    background-color: #81c80f;
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
									<td colspan="5" style="padding-top: 8px; padding-bottom: 8px;">
									<input type="text" style="background-color: white" style="border: none"
										class="form-control update" id="question_title" 
										placeholder="제목을 입력해주세요" value="${questionVo.question_title}" readonly
										required />
									</td>
									</tr>
								<tr>
									<th>카테고리</th>
									<td style="width:160px;">${questionVo.question_category_dsc}</td>
									<th style="width:130px;">작성자</th>
									<td style="width:160px;">관리자</td>
									<th style="width:130px;">작성일</th>
									<td style="width:260px;">${questionVo.question_date}</td>
									
								</tr>
								</tbody>
						</table>
						<!-- <div class="noticeContent"> -->
						<div class="questionAnswer">
						<div class="contentArea">
							<textarea style="background-color: white" style="border: none" class="form-control update" id="question_content"
							placeholder="내용을 입력해주세요." readonly>${questionVo.question_content}</textarea>
							<%-- <p>${questionVo.question_content}</p> --%>
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
		<c:if test="${sessionScope.testVo.user_id == 'admin'}">
		<button type="button" id="btnUpdateQuestion" class="btn btn-warning" style="margin-left: 10px">수정</button>
		</c:if>
		<form id="frmUpdate" action="/customerCenter/question/updateQuestion" method="POST">
			<input type="hidden" name="question_no" class="btn btn-warning" value="${questionVo.question_no }"/>
			<input type="hidden" name="question_title" class="btn btn-warning"/>
			<input type="hidden" name="question_content" class="btn btn-warning"/>
			<button type="button" id="btnUpdateFinish" class="btn btn-warning" style="margin-left: 10px; display: none;">수정완료</button>
		</form>
		
		<c:if test="${sessionScope.testVo.user_id == 'admin'}">
		<form action="/customerCenter/question/deleteQuestion" method="get">
			<input type="hidden" name="question_no" class="btn btn-danger" value="${questionVo.question_no }"/>
			<button type="submit" id="btnDeleteQuestion" class="btn btn-danger" style="margin-left: 10px">삭제</button>
		</form>
		</c:if>
	</div>
	</div>

</body>
</html>