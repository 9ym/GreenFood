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

<style>

.question_page_top {
    overflow: hidden;
    width: 1050px;
    margin: 0 auto;
    padding: 30px 0 20px;
}

.question_tit{
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
 
#question-title-label-category {
	padding: 30px 0 10px 0;
}

#question-title-label {
	padding: 10px 0 10px 0;
}

#question-content-label {
	padding: 10px 0;
}

#question-title-input {
	width:100%;
 	height:40px;
 	font-size:15px;
}

.radio-button{
	padding: 0 0 0 30px;
	font-size: 15px;
	align-items: center;
}

.container-fluid {
	padding-top: 150px;
}

</style>

<script>
/* $(function(){
	
	$("#btnQuestionOk").click(function(){
		var radioVal = $('input[name="question_category"]:checked').val();
//		alert(radioVal);

	});
	
}); */
</script>


</head>
<body>



	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
			<div class="question_page_top">
				<h2 class="question_tit">자주하는 질문을 작성해 주세요</h2>
			</div>
			
				<div class="row">
					<div class="col-md-4"></div>
					<div  class="col-md-4">
						<form role="form" action="/customerCenter/question/insertQuestion" method="get">
							<div id="tit-sub" class="form-group">
								<div>
								<label id="question-title-label-category" for="exampleInputEmail1">카테고리 </label> 
								</div>
								<div class="radio-button">
								<input type="radio" class="question" name="question_category" id="member" value="201" checked/>
								<label for="member">회원문의  </label>	
								<input type="radio" class="question" name="question_category" id="order" value="202"/>
								<label for="order">주문/결제  </label>
								<input type="radio" class="question" name="question_category" id="cancel" value="203"/>
								<label for="cancel">취소/교환/반품  </label>
								<input type="radio" class="question" name="question_category" id="point" value="205"/>
								<label for="point">쿠폰/적립금  </label>
								<input type="radio" class="question" name="question_category" id="use" value="206"/>
								<label for="use">이용 및 기타  </label>
								</div>
							</div>
						
							<div id="tit-sub-tit" class="form-group">

								<label id="question-title-label" for="exampleInputText1">제목 </label> 
								<input type="text" class="form-control" id="question-title-input" name="question_title" size="100"
									placeholder="자주하는 질문을 입력하세요" required="required"/>
							</div>
							<div class="form-group">

								<label id="question-content-label" for="exampleInputText2"> 내용 </label> 
								<textarea rows="20" cols="" class="form-control" id="question-content-input"
									placeholder="답변을 입력해주세요" required="required" name="question_content"></textarea>
								<!-- <input type="text" class="form-control" id="notice-content-input" /> -->
							</div>
							
							<div class="btnQuestionOk" >
								<button type="submit" id="btnQuestionOk" class="btn btn-success">작성완료</button>
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