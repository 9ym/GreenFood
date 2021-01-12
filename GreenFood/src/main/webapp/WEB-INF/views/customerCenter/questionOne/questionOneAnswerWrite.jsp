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
	
	/* $("#btnAnswerFinish").click(function(e){
		e.preventDefault();
		var q_no = $(this).attr("data-bno");
		
		location.href="/customerCenter/questionOne/questionOneAnswer/" + q_no;
	}); */
	
	// ---------------- 수정 버튼 누르면 수정할수 있게 -------------------------	
// 	 $("#btnUpdateQuestionOne").click(function() {
// 		$(".update").prop("readonly", false); // 제목, 내용 입력 읽기 전용 제거
// 		$(this).hide("slow"); // "fast", "normal", "slow"
// 		$("#btnUpdateFinish").show(1000); // millisecond
// 	});
	 
// --------------------- 수정 후 수정완료 누르면 입력한 값 넘겨주기 -----------------------
// 	$("#btnUpdateFinish").click(function() {
// 		var questino_title = $("#question_title").val(); // title 입력한 값 지정
// 		var question_content = $("#question_content").val(); // content 입력한 값 지정
// 		$("#frmUpdate > input[type=hidden]").eq(1).val(questino_title); // 붙여넣기
// 		$("#frmUpdate > input[type=hidden]").eq(2).val(question_content); // 붙여넣기
// 		$("#frmUpdate").submit(); // 서밋 해 줘야함..
// 	});
	
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
 
.btn {
	margin-left: 10px;
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
				<h2 class="question_tit">1:1 문의 답변하기</h2>
				<h2 class="question_sub">고객님의 문의에 대한 답변을 작성해주세요</h2>
			</div>
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<table class="tableView" width="100%">
							<tbody>
								<tr>
									<th>제목</th>
									<td colspan="5">
									<%-- <input type="text" style="background-color: white" style="border: none"
										class="form-control update" id="q_o_title" 
										placeholder="제목을 입력해주세요" value="${questionOneVo.q_o_title}" readonly
										required /> --%>
									${questionOneVo.q_o_title}
									</td>
									</tr>
								<tr>
									<th>카테고리</th>
									<td>${questionOneVo.question_category_dsc}</td>
									<th>작성자</th>
									<td>${questionOneVo.q_o_writer }</td>
									<th>작성일</th>
									<td>${questionOneVo.q_o_date }</td>
									
								</tr>
								</tbody>
						</table>
						<!-- <div class="noticeContent"> -->
						<div class="questionOneAnswer">
						<div class="contentArea" style="margin-top: 15px; border-style:solid; border-width: 1px; border-color: #39d070 ">
							<%-- <textarea style="background-color: white" style="border: none" class="form-control update" id="q_o_content"
							placeholder="내용을 입력해주세요." readonly>${questionOneVo.q_o_content}</textarea> --%>
							<p style="padding-top: 10px;">${questionOneVo.q_o_content}</p>
						</div>
						
						<form id="frmAnswerUpdate" action="/customerCenter/questionOne/updateQuestionOneAnswer" method="POST">
						<div>
							<textarea style="margin-top:10px; padding-top: 10px; background-color: white" style="border: none" class="form-control update" 
							id="q_o_answer" name="q_o_answer" placeholder="답변 내용을 입력해주세요." ></textarea>
						</div>
						<div class="btnList" >
						<input type="hidden" name="q_o_no" class="btn btn-warning" value="${questionOneVo.q_o_no }"/>
						<input type="hidden" name="q_o_title" class="btn btn-warning" value="${questionOneVo.q_o_title }"/>
						<input type="hidden" name="q_o_content" class="btn btn-warning" value="${questionOneVo.q_o_content }"/>
						<input type="hidden" name="q_o_category" class="btn btn-warning" value="${questionOneVo.q_o_category}"/>
						<input type="hidden" name="q_o_date" class="btn btn-warning" value="${questionOneVo.q_o_date }"/>
						<input type="hidden" name="question_category_dsc" class="btn btn-warning" value="${questionOneVo.question_category_dsc }"/>
						<button type="submit" id="btnAnswerFinish" class="btn btn-success" value="">답변완료</button>
						</div>
						</form>
						
						</div>
					</div>
					<div class="col-md-3"></div>
				</div>
			</div>
		</div>
	</div>
	
	<div>
	<div class="btnList" >
		<%-- <button type="submit" id="btnAnswerFinish" class="btn btn-success" data-bno="${questionOneVo.q_o_no}">답변완료</button> --%>
		
		<!-- <button type="button" id="btnUpdateQuestionOne" class="btn btn-warning" style="margin-left: 10px">수정</button> -->
		
		<%-- <form id="frmUpdate" action="/customerCenter/question/updateQuestion" method="POST">
			<input type="hidden" name="question_no" class="btn btn-warning" value="${questionVo.question_no }"/>
			<input type="hidden" name="question_title" class="btn btn-warning"/>
			<input type="hidden" name="question_content" class="btn btn-warning"/>
			<button type="button" id="btnUpdateFinish" class="btn btn-warning" style="margin-left: 10px; display: none;">수정완료</button>
		</form> --%>
		
		<%-- <form action="/customerCenter/question/deleteQuestion" method="get">
			<input type="hidden" name="question_no" class="btn btn-danger" value="${questionVo.question_no }"/>
			<button type="submit" id="btnDeleteQuestion" class="btn btn-danger" style="margin-left: 10px">삭제</button>
		</form> --%>
		
	</div>
	</div>

</body>
</html>