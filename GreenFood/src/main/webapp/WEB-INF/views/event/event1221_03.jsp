<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event1221_03</title>

<script>
$(function(){
	
	$("#btnEventMain").click(function(){
		location.href="/main/event/eventMain";
	});
	
});
</script>	
</head>
<body>

<style>
.list img {
  display: block;
  margin-left: auto;
  margin-right: auto;
}

.btnEventMain {
  display: flex;
  align-items: center;
  justify-content: center;
}
	
.container-fluid {
	padding-top: 150px;
}	
		
</style>
<div class="container-fluid">
	<div class="event_event1221_03">
		<div id="event1221_03" class="section_event">
			<ul class="list">
				<li>
				<img src="${path}/resources/images/event/event1221_03_1.png" alt="">
				</li>
				<li>
				<img src="${path}/resources/images/event/event1221_03_2.png" alt="">
				</li>
			</ul>
		</div>
	</div>
	
	<div>
	<div class="btnEventMain" >
		<button type="submit" id="btnEventMain" class="btn btn-success">목록</button>
	</div>
	</div>
</div>	
</body>
</html>