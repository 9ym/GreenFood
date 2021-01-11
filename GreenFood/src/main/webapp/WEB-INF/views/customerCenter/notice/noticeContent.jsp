<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../../include/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>

<script>
$(function(){
	
	$("#btnList").click(function(){
		location.href="/customerCenter/customerCenterMain";
	});
	
	//목록 버튼 클릭 했을때 페이징 폼으로..
	/* $("#btnList").click(function(e){
		e.preventDefault();
		$("#frmNoticePaging").submit(); // 페이징 폼으로 보낸다..
	});
	 */
// ---------------- 수정 버튼 누르면 수정할수 있게 -------------------------	
	$("#btnUpdateNotice").click(function() {
		$(".update").prop("readonly", false); // 제목, 내용 입력 읽기 전용 제거
		$(this).hide("slow"); // "fast", "normal", "slow"
		$("#btnUpdateFinish").show(1000); // millisecond
	});
	 
// --------------------- 수정 후 수정완료 누르면 입력한 값 넘겨주기 -----------------------
	$("#btnUpdateFinish").click(function() {
		var notice_title = $("#notice_title").val(); // title 입력한 값 지정
		var notice_content = $("#notice_content").val(); // content 입력한 값 지정
		$("#frmUpdate > input[type=hidden]").eq(1).val(notice_title); // 붙여넣기
		$("#frmUpdate > input[type=hidden]").eq(2).val(notice_content); // 붙여넣기
		$("#frmUpdate").submit(); // 서밋 해 줘야함..
	});
	
	
	// 삭제 버튼 ---> 필요없음...
	/* $("#btnDeleteNotice").click(function(e) {
		e.preventDefault();
		$("#btnDeleteNotice").attr("action", "/customerCenter/notice/deleteNotice")
		$("#btnDeleteNotice").submit();
	}); */
	
});
</script>

</head>
<body>
<style>
.notice_tit{
    font-weight: 800;
    font-family: noto sans;
    font-size: 30px;
    color: #333;
    line-height: 30px;
    text-align: center;
    letter-spacing: -.5px;
}

.notice_sub {
    font-family: noto sans;
    font-size: 14px;
    color: #999;
    line-height: 10px;
    letter-spacing: -.3px;
    text-align: center;
    padding-top: 10px;
}

.notice_page_top {
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

.noticeContent {
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

<!-- ----------------  페이징 폼 넣어주기 -----------------------------------  -->

<%@ include file="../../include/frmPaging.jsp" %>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
			<div class="notice_page_top">
				<h2 class="notice_tit">공지사항</h2>
				<h2 class="notice_sub">새로운 공지사항과 소식을 확인해 주세요</h2>
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
										class="form-control update" id="notice_title" 
										placeholder="제목을 입력해주세요" value="${noticeVo.notice_title}" readonly
										required />
										</td>
									</tr>
								<tr>
									<th>작성자</th>
									<td>관리자</td>
									<th>작성일</th>
									<td>${noticeVo.notice_date}</td>
									<th>조회수</th>
									<td>${noticeVo.notice_readcount}</td>
								</tr>
								</tbody>
						</table>
						<div class="noticeContent">
						<div class="contentArea">
							<textarea style="background-color: white" style="border: none" class="form-control update" id="notice_content"
							placeholder="내용을 입력해주세요." readonly>${noticeVo.notice_content}</textarea>
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
			<button type="button" id="btnList" class="btn btn-success">목록</button>
			<button type="button" id="btnUpdateNotice" class="btn btn-warning" style="margin-left: 10px">수정</button>
		
		<form id="frmUpdate" action="/customerCenter/notice/updateNotice" method="get">
			<input type="hidden" name="notice_no" class="btn btn-warning" value="${noticeVo.notice_no }"/>
			<input type="hidden" name="notice_title" class="btn btn-warning"/>
			<input type="hidden" name="notice_content" class="btn btn-warning"/>
			<button type="button" id="btnUpdateFinish" class="btn btn-warning" style="margin-left: 10px; display: none;">수정완료</button>
		</form>
		
		<form action="/customerCenter/notice/deleteNotice" method="get">
			<input type="hidden" name="notice_no" class="btn btn-danger" value="${noticeVo.notice_no }"/>
			<button type="submit" id="btnDeleteNotice" class="btn btn-danger" style="margin-left: 10px">삭제</button>
		</form>
		
		
	</div>
	</div>

</body>
</html>