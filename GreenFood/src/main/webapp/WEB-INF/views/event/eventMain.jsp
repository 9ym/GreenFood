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

.event_page_top {
    overflow: hidden;
    width: 1050px;
    margin: 0 auto;
    padding: 15px 0 5px;
} /* 이벤트 이름, 간단 설명 배치 관련 */

.event_tit{
    font-weight: 800;
    font-family: noto sans;
    font-size: 30px;
    color: #333;
    line-height: 30px;
    text-align: center;
    letter-spacing: -.5px;
} /* 이벤트 이름 관련 */

.event_sub {
    font-family: noto sans;
    font-size: 14px;
    color: #999;
    line-height: 10px;
    letter-spacing: -.3px;
    text-align: center;
}/* 이벤트 설명 관련  */

/* 이미지 중앙으로 배치시키기  */
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

.container-fluid {
	padding-top : 150px;
}
					
</style>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="event_page_top">
					<h2 class="event_tit">이벤트</h2>
					<h2 class="event_sub">할인행사 등의 다양한 혜택을 받아가세요.</h2>
				</div>
			</div>
		</div>

				<div class="page_aticle">
					<div id="mainEvent" class="page_section section_event">
						<ul class="list">
							<li id="first_li"><a href="/main/event/event1221_01"><img
									src="${path}/resources/images/event/event01.png" alt=""></a>
							</li>
							<li><a href="/main/event/event1221_02"><img
									src="${path}/resources/images/event/event02.png" alt=""></a>
							</li>
							<li><a href="/main/event/event1221_03"><img
									src="${path}/resources/images/event/event03.png" alt=""></a>
							</li>
						</ul>
					</div>
				</div>
	</div>
</body>
</html>
