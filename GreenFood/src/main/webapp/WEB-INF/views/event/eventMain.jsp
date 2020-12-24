<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EventMain Page</title>
</head>
<body>
<style>
img {
  display: block;
  margin-left: auto;
  margin-right: auto;
 
}

/* .list a{
	display:block;
	width:328px;
	height:248px;
	border-radius: 30px;
} */


/* #mainEvent{
		position:absolute;
		top:250px;
		left:150px;
		z-index:1;
		color:white;
		
	} */
	
#mainEvent #first_li{padding-top: 20px}
	
#mainEvent li{padding-bottom:20px}



/* #mainEvent a{display:block;overflow:hidden;position:relative}
#mainEvent .cover{position:absolute;left:0;top:0;width:100%;height:100%;background-color:#5f0080;background-position:50% 50%;background-repeat:no-repeat;opacity:0;
    -webkit-transition:opacity 0.5s;transition:opacity 0.5s
}
#mainEvent a:hover .cover{opacity:1;
    -webkit-transition:opacity 0.5s;transition:opacity 0.5s
} */

						
</style>
	<div class="page_aticle">
		<div id="mainEvent" class="page_section section_event" >
			<ul class="list" >
				<li id="first_li">
				<a href="/main/event/event1221_01"><img src="${path}/resources/images/event/event01.png"
				alt=""></a>
				</li>
				<li>
				<a href="/main/event/event1221_02"><img src="${path}/resources/images/event/event02.png"
				alt=""></a>
				</li>
				<li>
				<a href="/main/event/event1221_03"><img src="${path}/resources/images/event/event03.png"
				alt=""></a>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
