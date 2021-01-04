<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../../include/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>

<script>
/* $(function(){
	
	$("#btnNoticeOk").click(function(){
		location.href="/notice/insertNotice";
	});
	
}); */
</script>


</head>
<body>

<style>

.notice_page_top {
    overflow: hidden;
    width: 1050px;
    margin: 0 auto;
    padding: 30px 0 20px;
}

.notice_tit{
    font-weight: 800;
    font-family: noto sans;
    font-size: 20px;
    color: #333;
    line-height: 30px;
    text-align: center;
    letter-spacing: -.5px;
}

#tit-sub {
	border-top-style: groove;
	border-width: 2px;
	border-top-color: #6ca435;
}

.form-group label{
	padding: 10px 0 5px 0;
	font-size: 15px;
}

.btnNoticeOk {
	padding: 10px;
	display: flex;
  	align-items: center;
  	justify-content: center;
  	
 }

#notice-title-label {
	padding: 20px 0 10px 0;
}

#notice-content-label {
	padding: 10px 0;
}

#notice-title-input {
	width:100%;
 	height:40px;
 	font-size:15px;
}

.container-fluid {
	padding-top: 150px;
}
</style>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
			<div class="notice_page_top">
				<h2 class="notice_tit">공지사항을 작성해 주세요</h2>
			</div>
			
				<div class="row">
					<div class="col-md-4"></div>
					<div  class="col-md-4">
						<form role="form" action="/customerCenter/notice/insertNotice" method="get">
							<div id="tit-sub" class="form-group">

								<label id="notice-title-label" for="exampleInputText1">제목 </label> 
								<input type="text" class="form-control" id="notice-title-input" name="notice_title" size="100"
									placeholder="제목을 입력하세요" required="required"/>
							</div>
							<div class="form-group">

								<label id="notice-content-label" for="exampleInputText2"> 내용 </label> 
								<textarea rows="20" cols="" class="form-control" id="notice-content-input"
									placeholder="공지할 내용을 입력해주세요" required="required" name="notice_content"></textarea>
								<!-- <input type="text" class="form-control" id="notice-content-input" /> -->
							</div>
							
							<div class="btnNoticeOk" >
								<button type="submit" id="btnNoticeOk" class="btn btn-success">작성완료</button>
							</div>
						</form>
					</div>
					<div class="col-md-4"></div>
				</div>
			</div>
		</div>
		
		
		
	</div>






</body>
</html>