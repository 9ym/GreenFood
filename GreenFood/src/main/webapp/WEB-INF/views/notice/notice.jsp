<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>

<script>
$(function(){
	
	$("#btnList").click(function(){
		location.href="/main/customer/customerCenter";
	});
	
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
</style>

<%-- ${noticeVo} --%>

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
									<td colspan="5" value="">${noticeVo.notice_title}</td>
									</tr>
								<tr>
									<th>작성자</th>
									<td>빈칸</td>
									<th>작성일</th>
									<td>빈칸</td>
									<th>조회수</th>
									<td>빈칸</td>
								</tr>
								</tbody>
						</table>
						<div class="noticeContent">
						<div class="contentArea">
							<p value="">${noticeVo.notice_content}</p>
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
	</div>
	</div>

</body>
</html>