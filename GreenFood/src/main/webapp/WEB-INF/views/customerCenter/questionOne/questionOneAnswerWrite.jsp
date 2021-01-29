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
						<input type="hidden" name="q_o_phone" class="btn btn-warning" value="${questionOneVo.q_o_phone }"/>
						<input type="hidden" name="q_o_writer" class="btn btn-warning" value="${questionOneVo.q_o_writer }"/>
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
		
	</div>
	</div>

</body>
</html>