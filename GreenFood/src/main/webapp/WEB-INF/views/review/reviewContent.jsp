<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Question Answer</title>

<script>
$(function(){
	
	$("#btnList").click(function(){
		location.href="/review/reviewMain";
	});
	
	// ---------------- 수정 버튼 누르면 수정할수 있게 -------------------------	
	 $("#btnUpdateReview").click(function() {
		$(".update").prop("readonly", false); // 제목, 내용 입력 읽기 전용 제거
		$(this).hide("slow"); // "fast", "normal", "slow"
		$("#btnUpdateFinish").show(1000); // millisecond
	});
	 
// --------------------- 수정 후 수정완료 누르면 입력한 값 넘겨주기 -----------------------
	$("#btnUpdateFinish").click(function() {
		var review_title = $("#review_title").val(); // title 입력한 값 지정
		var review_content = $("#review_content").val(); // content 입력한 값 지정
		$("#frmReviewUpdate > input[type=hidden]").eq(1).val(review_title); // 붙여넣기
		$("#frmReviewUpdate > input[type=hidden]").eq(2).val(review_content); // 붙여넣기
		$("#frmReviewUpdate").submit(); // 서밋 해 줘야함..
	});
	
});
</script>

</head>
<body>
<style>
.review_tit{
    font-weight: 800;
    font-family: noto sans;
    font-size: 30px;
    color: #333;
    line-height: 30px;
    text-align: center;
    letter-spacing: -.5px;
}

.review_sub {
    font-family: noto sans;
    font-size: 14px;
    color: #999;
    line-height: 10px;
    letter-spacing: -.3px;
    text-align: center;
    padding-top: 10px;
}

.review_page_top {
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

.reviewContent {
	
	height: auto;
	valign: top;
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
			<div class="review_page_top">
				<h2 class="review_tit">후기</h2>
				<h2 class="review_sub">${reviewVo.user_id } 님께서 작성하신 소중한 후기입니다.</h2>
			</div>
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<table class="tableView" width="100%">
							<tbody>
								<tr>
									<th>제목</th>
									<td colspan="5">
									<input type="text" style="background-color: white" style="border: none"
										class="form-control update" id="review_title"  name="review_title"
										placeholder="제목을 입력해주세요" value="${reviewVo.review_title}" readonly
										required />
									</td>
									</tr>
								<tr>
									<th>상품명</th>
									<td style="width:250px;">${reviewVo.product_title }</td>
									<th style="width:130px;">작성일</th>
									<td style="width:260px;">${reviewVo.review_date }</td>
									<th style="width:130px;">조회수</th>
									<td style="width:70px;">${reviewVo.review_readcount }</td>
									
								</tr>
								</tbody>
						</table>
						<!-- <div class="noticeContent"> -->
						<div class="reviewContent">
						<div class="contentArea" style="margin-top: 15px;">
							<textarea style="padding-top: 10px; background-color: white" style="border: none" class="form-control update" 
							id="review_content" name="review_content" placeholder="내용을 입력해주세요." readonly>${reviewVo.review_content}</textarea>
							
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
		<button type="submit" id="btnList" style="" class="btn btn-success">목록</button>
		<button type="button" id="btnUpdateReview" class="btn btn-warning" style="margin-left: 10px">수정</button>
		
		<form id="frmReviewUpdate" action="/review/updateReview" method="POST">
			<input type="hidden" name="review_no" class="btn btn-warning" value="${reviewVo.review_no }"/>
			<input type="hidden" name="review_title" class="btn btn-warning"/>
			<input type="hidden" name="review_content" class="btn btn-warning"/>
			<button type="button" id="btnUpdateFinish" class="btn btn-warning" style="margin-left: 10px; display: none;">수정완료</button>
		</form>
		
		<form action="/review/deleteReview" method="get">
			<input type="hidden" name="review_no" class="btn btn-danger" value="${reviewVo.review_no }"/>
			<button type="submit" id="btnDeleteReview" class="btn btn-danger" style="margin-left: 10px">삭제</button>
		</form>
		
	</div>
	</div>

</body>
</html>