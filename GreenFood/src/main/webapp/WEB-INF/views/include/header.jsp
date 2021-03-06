<%@ page language="java" contentType="text/html; charset=UTF-8"										
	pageEncoding="UTF-8"%>									
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<c:set var="path" value="${pageContext.request.contextPath}" />										
<!DOCTYPE html>										
<html lang="en">										
<head>										
<meta charset="UTF-8">										
<meta name="viewport" content="width=device-width, initial-scale=1">										
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">										
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>										
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>										
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>										
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>										
<!-- icon -->										


<title>ܤܤ그린푸드ܤܤ</title>										
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap" rel="stylesheet">
								
<style>										
*:focus { outline:none; }										
* {										
	margin: 0;									
	padding: 0;									
/* 	font-family: 'Roboto', sans-serif;		 */
	font-family: 'Noto Sans', sans-serif;							
}										
										
header {										
	margin: 0;									
	padding: 0;									
}										
										
ul, li {										
	list-style: none;									
}										
										
ul li a {										
	text-decoration: none;									
}										
										
#header_id {										
	width: 1000px;									
	height: 50px;									
	z-index: 99999;									
	background-color: yellow;									
}										
										
#main_text {										
	position: absolute;									
	top: 500px;									
	left: 750px;									
	z-index: 1;									
	color: white;									
	font-size: 20px;									
}										
										
#main_text p:nth-child(1) {										
	position: relative;									
	left: 100px;									
}										
										
#main_text p:nth-child(2) {										
	position: relative;									
	left: 40px;									
	font-size: 40px;									
}										
										
#main_text p:nth-child(3) #main_text_span {										
	font-weight: bold;									
	font-size: 30px;									
}										
		
#header_menu_out {
	margin-top : 80px;
	position : fixed;
	z-index:10; 
	left: 0px; 
	top : 0px;
	background-color : white;
	height : 70px;
	width : 100%;
	box-shadow : 0px 3px 3px WhiteSmoke;
}		
										
#header_menu {		
	height : 70px;
	width : 1200px;
	border-radius: 0px;
	
	margin: 0;
	position: relative;
	top: 50%;
	left: 50%;
	ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);							
}										
										
#header_menu img {										
	float: left;									
	margin-left: 30px;									
	padding: 0;									
	height: 70px;									
}										
										
#header_menu ul {										
	background-color: white;									
	display: inline-block;									
	height: 70px;									
}										
										
#header_menu ul li {										
	background-color: white;									
	width: 70px;									
	float: left;									
	line-height: 70px;									
	margin: 0 20px;									
	padding: 0;									
	color: black;									
}										
										
#header_menu ul li a {										
	display:block;									
	background-color: white;									
	height: 70px;									
}										
										
#header_menu #first_li {										
	height: 70px;
	width:120px;									
	text-align: center;		
}										
#a-first_li {										
	display:inline;	
	border-top: #6ca435 1px solid;
	border-bottom: #6ca435 1px solid;
	padding : 20px 20px;	
}	
#first_li img{
	height : 20px;
	width : 20px;
	margin-left : 15px;
	margin-right : 5px;
	margin-top : 25px;
}									
#header_menu #first_li a{										
	display:inline;	
}										
#header_menu .hide {										
	width: 120px;									
}										
										
#header_menu a:hover {										
/* 	font-size: 110%;									 */
	text-decoration:none;	
	color : #6ca435;								
}										
										
.hide ul {										
	width: 120px;									
}										
										
#header_menu #first_li>a {										
	color: #6ca435;									
}										
										
#header_menu ul a {										
/* 	font-family: 'Nanum Gothic', sans-serif;	 */
	font-family: 'Noto Sans', sans-serif;								
	color: black;									
	font-weight: bold;									
}										
										
#header_menu_right {										
	float: right;									
	line-height: 70px;									
	padding: 0;									
	margin: 0;									
	margin-top: 20px;									
	margin-top: 20px;									
	margin-right: 45px;									
	height: 32px;									
	border: 1px solid #c7c7c7;									
}										
										
#header_menu_right input {										
	background-color: white;									
	float: left;									
	width: 200px;									
	height: 30px;									
	border: none;	
}										
#header_menu_right_input {										
	height: 29px;									
}										
#header_menu_right_img {										
	height: 29px;									
}										
										
#header_menu_right input:focus {										
	outline: none;									
}										
										
#header_menu_right a img {										
	height: 30px;									
	float: right;									
	margin: 0;									
	padding: 0;									
}										
										
#header_small_menu {										
										
	position: absolute;									
	z-index: 1;									
	top: 35px;									
	left: 1315px;									
/* 	min-width:270px;	 */
	width:500px;	
		
	margin: 0;
	left: 79%;
	ms-transform: translate(-79%);
	transform: translate(-79%);								
}										
										
#header_small_menu a {										
	margin-right: 5px;									
	text-decoration: none;									
	color: DimGray;									
	font-size: 14px;									
	margin-right: 5px;									
	margin-left: 5px;									
}										
										
#header_menu .hide {										
	opacity: 0;
	visibility: hidden;								
}										
										
#header_menu .hide li {										
	padding: 0;									
	margin: 0;									
 	display: block;									 
	width: 120px;									
	background-color: white;									
	color: black;									
	height: 40px;									
	line-height: 40px;									
	font-size: 12px;									
	text-align: center;									
}										
										
#header_menu .hide li a {										
 	display: block;									 
	width: 120px;									
	background-color: white;									
}										
										
#header_menu #first_li:hover .hide {										
	opacity: 1;									
	visibility: visible;									
}										
										
#page_background{										
height: 200px;										
background-image:url("https://www.sosinarnold.com/images/prac-contract.jpg");										
background-repeat: no-repeat;										
background-size: 100% 100%;										
animation:fade 8s infinite;										
}										
										
@keyframes fade {										
0% {brightness(70%); }										
5% {brightness(60%);}										
25% {filter:brightness(50%);  }										
30% {filter: brightness(40%); }										
100% {filter: brightness(60%); }										
}										
#boardName{										
	position:absolute;									
	z-index:1;									
	top:150px;									
	width:100%;									
	background-color:#6ca435;									
	height:50px;									
	opacity:0.5;									
										
}										
	#boardNames{									
	display:block;									
	z-index:2;									
	position:absolute;									
	top:150px;									
	left:800px;									
	color:white;									
	line-height: 50px;									
	letter-spacing:20px;									
/* 	font-family: 'Nanum Gothic', sans-serif;	 */
	font-family: 'Noto Sans', sans-serif;								
	font-size:15px;									
	font-weight:bold;									
}	

.div-top {
	position : absolute;
	width : 100%;
	height : 30px;
	background-color : #6ca435;
	display:block;
	left : 0px;
	top : 0px;
	text-align : center;
}
.div-top a {
	color : white;
	display : block;
	height : 100%;
	font-size : 15px;
}
.div-top a span {
	height : 100%;
	display : inline-block;
	padding-top : 4px;
}
.div-top a div {
	position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
}
.div-top a div div {
	color : black;
	position: relative;
	display : inline-block;
	height : 100%;
	width : 800px;
	margin: 0 auto;
}
.div-top a button {
	color : white;
		float : right;
		height : 100%;
	border: none;
	background-color: #6ca435;
	display: inline-block;
		margin-left : 300px; 
}							
</style>	

<script>
$(function(){
	
	/* 회원가입 유도 X버튼 눌렀을 시 쿠키생성*/
	$("#btnX").click(function(e){
		e.preventDefault();
		setCookie("expend", "true", 60*30);
		topClose();
	});
	
	/* 상품 검색 */
	$("#header_menu_right_img").click(function(){
		var product_title = $("#header_menu_right_input").val();
		
		if (product_title == null || product_title.length == 0 || product_title == "") {
			alert("공백은 검색 할 수 없습니다. 다시 검색해 주세요.");
		} else {
			location.href = "/product/searchTitle/" + product_title;
		}
	});
	
	$("#eventWrite").click(function(e){
		e.preventDefault();
		var data = $(this).attr("data");
		console.log("data:"+ data);
		$("#boardNames").text(data);
		location.href = "/main/event/eventMain";
	});

	$("#customerCenter").click(function(e){
		e.preventDefault();
		var data = $(this).attr("data");
		console.log("data:"+ data);
		$("#boardNames").text(data);
		location.href = "/customerCenter/customerCenterMain";
	});
	
	/* 스크롤에 따라서 메뉴 상단에 고정 */
	var didScroll; 
	// 스크롤시에 사용자가 스크롤했다는 것을 알림 
	$(window).scroll(function(event){ 
		didScroll = true; 
	}); 
	// hasScrolled()를 실행하고 didScroll 상태를 재설정 
	setInterval(function() {
		if (didScroll) { 
			hasScrolled(); 
			didScroll = false; 
		} 
	}, 250); 
	function hasScrolled() {
		// 동작을 구현 
		var st = $(this).scrollTop(); 
// 		console.log("GG-" + st);
		
		if (st > 55) {
			$("#header_menu_out").css("transition-property", "margin-top");
// 			$("#header_menu_out").css("transition-duration", "1s");
			$("#header_menu_out").css("margin-top", "0px");
		} else if (st <= 55) {
			$("#header_menu_out").css("transition-property", "margin-top");
			$("#header_menu_out").css("margin-top", "80px");
		} 
	}
	
});

/* 쿠키 삭제 */
var deleteCookie = function(name) {
	document.cookie = name + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT;';
};

/* 쿠키 생성 */
var setCookie = function(name, value, exp) {
	var date = new Date();
	var tt = date.setTime(date.getTime() + exp * 1000);
	document.cookie = name + '=' + value + ';expires=' + date.toGMTString() + ';path=/';
};

function topClose() {
	$(".div-top").css("display", "none");
};

</script>	

<!-- ----------------  페이징 폼 넣어주기 -----------------------------------  -->

<%@ include file="../include/frmPaging.jsp" %>
							
</head>										
<body>								
		<header>	
		
		<!-- 제일 상단 버튼 : 회원가입 혜택 안내?? -->
	<c:choose>
		<c:when test="${empty sessionScope.customerVo && empty cookie.expend}">
		<div class="div-top">
			<a href="/main/memberJoinForm">
				<span>지금 가입하고 포인트 받으세요!</span>
				<div>
					<div>
						<button type="button" id="btnX">X</button>
					</div>	
				</div>
			</a>
		</div>
		</c:when>
	</c:choose>
		<!--// 제일 상단 버튼 -->
									
<!-- 		<div id="page_background">								 -->
<!-- 		</div>								 -->
			<div id="header_small_menu">		
			<c:choose>
			<c:when test="${not empty sessionScope.customerVo }">
				<a href="/logout">로그아웃</a><img src="https://www.oasis.co.kr/images/common/bg_footer.png">
				<c:choose>
		 		<c:when test="${sessionScope.customerVo.user_code == '1001'}">
		 			<a href="/admin/customerList">회원관리</a>
		 			<a href="/admin/productSearchList?searchAnd=date&searchWhere=all&searchBy=desc&searchWhat=&page=1">상품관리</a>
		 			<a href="/admin/orderManager">주문관리</a>
		 		</c:when>
		 		<c:otherwise>		 		
					<a href="/customer/customerMyPage">마이페이지</a><img src="https://www.oasis.co.kr/images/common/bg_footer.png">
		 		</c:otherwise>
			</c:choose>
			</c:when>
			<c:otherwise>
				<a href="/main/loginPage">로그인 |</a><!-- <img						
					src="https://www.oasis.co.kr/images/common/bg_footer.png">  -->
					<a href="/main/memberJoinForm">회원가입 |</a><!-- <img					
					src="https://www.oasis.co.kr/images/common/bg_footer.png"> --> 
			</c:otherwise>
			</c:choose>
				<c:if test="${sessionScope.customerVo.user_code != '1001'}">
					<a href="/order/cart" id="anchorCart">장바구니</a><img src="https://www.oasis.co.kr/images/common/bg_footer.png">
				</c:if>
				<a href="/main/customer/customerCenter" id="customerCenter" data="고객센터">고객센터</a>					
			</div>	
			<div id="header_menu_out">						
				<div id="header_menu">							
					<a href="/"><img src="${path}/resources/images/greenfood_logo.png"></a>						
					<ul>						
						<li id="first_li"><img src="${path}/resources/images/stripe3.png"><a id="a-_li" href="#">전체 보기</a>					
							<ul class="hide">				
								<c:forEach var="productCategoryDto" items="${categoryList}">
									<li><a href="/product/category/${productCategoryDto.product_category}">${productCategoryDto.product_category_dsc}</a></li>
								</c:forEach>		
							</ul>
						</li>				
						<li><a href="/product/menu/new">신상품</a></li>					
						<li><a href="/product/menu/best">추천상품</a></li>								
						<li><a href="/product/menu/sale">세일상품</a></li>								
						<li><a href="/review/reviewMain">후기모음</a></li>								
						<li><a href="/main/event/eventMain" id="eventWrite" data="이벤트">이벤트</a></li>								
					</ul>						
					<div id="header_menu_right">						
						<a href="#"  id="header_menu_right_img"><img class="searchImg" name="searchImg" src="https://www.oasis.co.kr/images/common/gnbSearch.png"></a> 
						<input id="header_menu_right_input" type="text" placeholder="무엇이 궁금하세요?"></input>				
					</div>						
											
				</div>	
			</div>						
			<!-- 게시판 이름을 입력해주세요 -->							
			<!-- //게시판 이름을 입력해주세요 -->							
		</header>								