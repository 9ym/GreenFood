<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>

<script>
$(function(){
	
	$("#btnQuestionOk").click(function(){
		location.href="/main/question/customerQuestion";
	});
	
});
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

.btnQuestionOk {
	padding: 10px;
	display: flex;
  	align-items: center;
  	justify-content: center;
  	
 }
 
#notice-title-label-category {
	padding: 30px 0 10px 0;
}

#notice-title-label {
	padding: 10px 0 10px 0;
}

#notice-content-label {
	padding: 10px 0;
}

#notice-title-input {
	width:100%;
 	height:40px;
 	font-size:15px;
}

.radio-button{
	padding: 0 0 0 30px;
	font-size: 15px;
	align-items: center;
}
</style>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
			<div class="notice_page_top">
				<h2 class="notice_tit">자주하는 질문을 작성해 주세요</h2>
			</div>
			
				<div class="row">
					<div class="col-md-4"></div>
					<div  class="col-md-4">
						<form role="form">
							<div id="tit-sub" class="form-group">
								<div>
								<label id="notice-title-label-category" for="exampleInputEmail1">카테고리 </label> 
								</div>
								<div class="radio-button">
								<input type="radio" class="question" name="question" id="member" value="member" checked/>
								<label for="member">회원문의  </label>	
								<input type="radio" class="question" name="question" id="order" value="order"/>
								<label for="order">주문/결제  </label>
								<input type="radio" class="question" name="question" id="cancle" value="cancle"/>
								<label for="cancle">취소/교환/반품  </label>
								<input type="radio" class="question" name="question" id="point" value="point"/>
								<label for="point">쿠폰/적립금  </label>
								<input type="radio" class="question" name="question" id="use" value="use"/>
								<label for="use">이용 및 기타  </label>
								</div>
							</div>
						
							<div id="tit-sub-tit" class="form-group">

								<label id="notice-title-label" for="exampleInputEmail1">제목 </label> 
								<input type="text" class="form-control" id="notice-title-input" size="100"
									placeholder="자주하는 질문을 입력하세요" />
							</div>
							<div class="form-group">

								<label id="notice-content-label" for="exampleInputPassword1"> 내용 </label> 
								<textarea rows="20" cols="" class="form-control" id="notice-content-input"
									placeholder="답변을 입력해주세요" ></textarea>
								<!-- <input type="text" class="form-control" id="notice-content-input" /> -->
							</div>
							
						</form>
					</div>
					<div class="col-md-4"></div>
				</div>
			</div>
		</div>
		
		<div class="btnQuestionOk" >
		<button type="submit" id="btnQuestionOk" class="btn btn-success">작성완료</button>
		</div>
		
	</div>


</body>
</html>