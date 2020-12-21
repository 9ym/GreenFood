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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<<<<<<< Updated upstream

=======
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
    
<meta charset="UTF-8">
>>>>>>> Stashed changes
<title>ܤܤ그린푸드ܤܤ</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Roboto&display=swap" rel="stylesheet">
<style>
*:focus { outline:none; }
* {
	margin: 0;
	padding: 0;
	font-family: 'Roboto', sans-serif;
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

#header_menu {
	left: 400px;
	position: absolute;
	z-index: 1;
	top: 70px;
	background-color: white;
	width: 1200px;
	height: 70px;
	border-radius: 30px;
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
	border-top: #6ca435 3px solid;
	padding-bottom: -3px;
	border-bottom: #6ca435 3px solid;
	width: 120px;
	text-align: center;
}
#header_menu #first_li a{
	display:inline;
}
#header_menu .hide {
	width: 120px;
}

#header_menu a:hover {
	font-size: 110%;
	text-decoration:none;
}

.hide ul {
	width: 120px;
}

#header_menu #first_li>a {
	color: #6ca435;
}

#header_menu ul a {
	font-family: 'Nanum Gothic', sans-serif;
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
	min-width:270px;
}

#header_small_menu a {
	margin-right: 5px;
	text-decoration: none;
	color: white;
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
height: 500px;
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
   	top:450px;
   	width:100%;
   	background-color:#6ca435;
   	height:50px;
   	opacity:0.5;
   
   } 
   	#boardNames{
   	display:block;
   	z-index:2;
   	position:absolute;
   	top:450px;
   	left:900px;
   	color:white;
   	line-height: 50px;
   	letter-spacing:20px;
   	font-family: 'Nanum Gothic', sans-serif;
   	font-size:15px;
   	font-weight:bold;
   }
</style>
</head>
<body>
	
		<header>
		<div id="page_background">
		</div>
			<div id="header_small_menu">
				<a href="/main/loginPage">로그인</a><img
					src="https://www.oasis.co.kr/images/common/bg_footer.png"> <a
					href="/main/memberJoinForm">회원가입</a><img
					src="https://www.oasis.co.kr/images/common/bg_footer.png"> <a
					href="#">주문배송</a><img
					src="https://www.oasis.co.kr/images/common/bg_footer.png"> <a
					href="#">고객센터</a>
			</div>
			<div id="header_menu">
				<a href="/"><img src="${path}/resources/images/greenfood_logo.png"></a>
				<ul>
					<li id="first_li"><a href="#">전체 보기</a>
						<ul class="hide">
							<li><a href="#">하위메뉴</a></li>
							<li><a href="#">하위메뉴</a></li>
							<li><a href="#">하위메뉴</a></li>
							<li><a href="#">하위메뉴</a></li>
							<li><a href="#">하위메뉴</a></li>
							<li><a href="#">하위메뉴</a></li>
						</ul></li>
					<li><a href="#">신상품</a></li>
		<li><a href="#">추천상품</a></li>
		<li><a href="#">세일상품</a></li>
		<li><a href="#">후기모음</a></li>
		<li><a href="#">이벤트</a></li>
				</ul>
				<div id="header_menu_right">
					<a href="#"><img
						src="https://www.oasis.co.kr/images/common/gnbSearch.png"></a> <input
						type="text" placeholder="무엇이 궁금하세요?"></input>
				</div>

			</div>
			<div id="boardName">
			</div>
			<!-- 게시판 이름을 입력해주세요 -->
			<span id="boardNames">회원가입</span>
			<!-- //게시판 이름을 입력해주세요 -->
		</header>
	
