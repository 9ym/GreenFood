<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">													
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>													
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>													
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>													
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
<!-- 스크립트 -->
<script>
$(function(){
	var msg = "${msg}";
	if(msg == "loginSuccess"){
		alert("로그인 성공했습니다.");
	}
});	
</script>
<!-- 스크립트 끝 -->

  <title>ܤܤ그린푸드ܤܤ</title>
  <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0; font-family: 'Roboto', sans-serif;}
	header{margin:0;padding:0;}
	.slide{position:relative;}
 *:focus { outline:none; }
	
    ul,li{list-style:none;}
	ul li a{
		text-decoration:none;
	}
    .slide{height:900px;overflow:hidden;}
    .slide ul{position:relative;height:100%;}
    .slide li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;animation:fade 8s infinite;}
    .slide li:nth-child(1){background-image:url("https://file.mk.co.kr/meet/neds/2020/01/image_readtop_2020_83302_15800838754063133.jpg");animation-delay:0s;background-repeat:no-repeat;background-size:100%100%;}
    .slide li:nth-child(2){background-image:url("https://images.unsplash.com/photo-1591981093673-984cd7de9ca4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80");animation-delay:2s;background-repeat:no-repeat;background-size:100%100%;}
    .slide li:nth-child(3){background-image:url("https://images.unsplash.com/photo-1594069213067-8996d741badb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1352&q=80");animation-delay:4s;background-repeat:no-repeat;background-size:100%100%;}
    .slide li:nth-child(4){background-image:url("https://images.unsplash.com/photo-1580910365203-91ea9115a319?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=750&q=80");animation-delay:6s;background-repeat:no-repeat;background-size:100%100%;}
	
     /* 100 / 8 = 12.5 */
    @keyframes fade {
      0% {opacity:0;}
      5% {opacity:1;}
      25% {opacity:1;filter: brightness(50%); }
      30% {opacity:0filter: brightness(30%); }
      100% {opacity:0;filter: brightness(0%); }
    }
	<!--최상단 메뉴바-->
	#header_id{
		width:1000px;
		height:50px;
		z-index:99999;
		background-color:yellow;
	}
	
	#main_text{
		position:absolute;
		top:500px;
		left:750px;
		z-index:1;
		color:white;
		font-size:20px;
	}
	#main_text p:nth-child(1){
		position:relative;
		left:100px;
	}
	#main_text p:nth-child(2){
		position:relative;
		left:40px;
		font-size:40px;
	}
	#main_text p:nth-child(3) #main_text_span{
	font-weight:bold;
	font-size:30px;
	}
	
	#header_menu{
		
		left: 350px;
		position:absolute;
		z-index:1;
		top:70px;
		background-color:white;
		width:1200px;
		height:70px;
		border-radius: 30px;
	}
	
	
	#header_menu img{
		float:left;
		margin-left:30px;
		padding:0;
		height:70px;
	}
	#header_menu ul{
		display:inline-block;
	}
	#header_menu ul li{
		width:70px;
		float:left;
		line-height:70px;
		margin:0 20px;
		padding:0;
		color:black;
	}
	#header_menu #first_li{
		height:64px;
		border-top: #6ca435 3px solid;
		padding-bottom:-3px;
		border-bottom: #6ca435 3px solid;
		width:120px;
		text-align:center;
		
	}
	
#header_menu #first_li a{
	display:inline;
}
	#header_menu .hide {
	width:120px;
	}
	
	
	#header_menu a:hover {
		font-size:110%;
		
	}
	.hide ul{
		width:120px;
		
	}
	
	
	#header_menu #first_li>a{
		color:#6ca435;
	}
	#header_menu ul a{
	font-family: 'Nanum Gothic', sans-serif;
		color:black;
		font-weight:bold;
	}
	#header_menu_right{
		float:right;
		line-height:70px;
		padding:0;
		margin:0;
		margin-top:20px;
		margin-top:20px;
		margin-right:45px;
		height:30px;
		border:1px solid #c7c7c7;
	}
	#header_menu_right input{
	float:left;
		width:200px;
		height:30px;
		border:none;
		
	}
	#header_menu_right input:focus {outline:none;}
	#header_menu_right a img{
			height:30px;
			float:right;
			margin:0;
			padding:0;

	}
	
	#header_small_menu{
		min-width:270px;
		position:absolute;
		z-index:1;
		top:35px;
		left:1315px;
	}
	#header_small_menu a{
		margin-right:5px;
		text-decoration:none;
		color:white;
		font-size:14px;
		margin-right:5px;
		margin-left:5px;
	}
	content{
		position:absolute;
		display:block;
		width:1000px;
		left:450px;
		height:100%;
		margin:0;
		padding:0;
		
	}
	#best_text{
		margin-top:175px;
		text-align:center;
		
	}
	#make_line{
		width:150px;
		height:10px;
		border-bottom:1px solid #c7c7c7;
		margin:0 auto;
	}
	#best_products{
		width:100%;
		height:500px;
		background-color:yellow;
	}
	#best_products_left{
		line-height:500px;
		margin-left:50px;
		float:left;
	}
	
	#best_products_right{
		line-height:500px;
		margin-right:50px;
		float:right;
	}
	#header_menu .hide {
		 opacity: 0;
	visibility: hidden;
	}
	#header_menu .hide li{
		display:block;
		width:120px;
		background-color:white;
		color:black;
		height:40px;
		line-height:40px;
		font-size:12px;
		text-align:center;
		
	}
	#header_menu #first_li:hover .hide{
		opacity:1;
		visibility:visible;
	}
	
	content #best_products{
		background-color:#f7f7f7;
		margin-top:50px;
		float:left;
		height:800px;
	}
	
	#first_floor > div{
		float:left;
		margin:0 40px;
		
	}
	#first_floor{
		margin:0 auto;
		margin-left:30px;
		margin-top:30px;
	}
	#second_floor{
		clear:both;
		margin-left:30px;
		padding-top:100px;
	}
	#second_floor>div{
		float:left;
		margin:0 40px;
		
	}
	.dscImage{
		 
		 text-align:center;
		 
		
	}
	.dscImage p:nth-child(1){
	font-size:18px;
	
	}
	.dscImage p:nth-child(2){
	margin-top:5px;
		color:red;
	}
	.showPoints{
		position:relative;
		background-color:black;
		opacity:0.3;
		height: 35px;
		width:180px;
		top:-100px;
		left:20px;
		border-radius: 30px;
	}
	.showPoints img{
		position:relative;
		left:45px;
		top:7px;
	}
	.spanShowPoints{
		display:block;
		z-index:1;
		color:white;
		position:relative;
		top:-16px;
		left:80px;
	}
	#makeSpace{
		clear:both;
		width:100%;
		height: 100px;
	}
  </style>
  <!-- 스타일 끝 -->
</head>
<body>
${testVo}
${testVo.user_id}
<header>
  <div class="slide">
    <ul>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
    </ul>
  </div>
  <div id="main_text">
  
  <p >
  바른 먹거리 신뢰와 상생</p>
  <p id=>농산물 직거래 플랫폼</p>
  <p>우리 지역 농산물의 <span id="main_text_span">신선함</span>을 그대로 전달해 드립니다
  </p>
  </div>
  <div id="header_small_menu">
  <c:choose>
  	<c:when test="${not empty sessionScope.testVo }">
  	<a href="/logout">로그아웃</a><img src="https://www.oasis.co.kr/images/common/bg_footer.png">
	<a href="/customer/customerMyPage">마이페이지</a><img src="https://www.oasis.co.kr/images/common/bg_footer.png">
  	</c:when>
  	<c:otherwise>
	<a href="/main/loginPage">로그인</a><img src="https://www.oasis.co.kr/images/common/bg_footer.png">
	<a href="/main/memberJoinForm">회원가입</a><img src="https://www.oasis.co.kr/images/common/bg_footer.png">
  	</c:otherwise>
		
 </c:choose>	
	<a href="#">주문배송</a><img src="https://www.oasis.co.kr/images/common/bg_footer.png">
	<a href="#">고객센터</a>
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
			</ul>		
				
		</li>
		<li><a href="#">신상품</a></li>
		<li><a href="#">추천상품</a></li>
		<li><a href="#">세일상품</a></li>
		<li><a href="#">후기모음</a></li>
		<li><a href="#">이벤트</a></li>
	 </ul>
	 <div id="header_menu_right">
	 <a href="#"><img src="https://www.oasis.co.kr/images/common/gnbSearch.png"></a>
		<input type="text" placeholder="무엇이 궁금하세요?"></input>
	 </div>
  </div>
  
 </header>
<content>
	<div id="best_text">
		<img src="${path}/resources/images/best_text.png">
	</div>
	<div id="make_line">
	</div>
	<div id="best_products">
	
	
	<!--코딩 들어갈 부분!!-->
		
		<div id="first_floor">
			<div>
			<a href="/product/detail/10001"><img src="${path}/resources/images/prac1.png"></a>
			<div class="dscImage">
				<p>고구마</p>
				<p>1500</p>
				
			</div>
			<div class="showPoints">
			<a href="#">	<img src="https://www.oasis.co.kr/images/shop/pd_like.png"></a>
				<span class="spanShowPoints">97.7%</span>
				</div>
			</div>
			<div>
			<a href="#"><img src="${path}/resources/images/prac2.png"></a>
			<div class="dscImage">
				<p>감자감자감자</p>
				<p>가격</p>
			</div>
			<div class="showPoints">
				<img src="https://www.oasis.co.kr/images/shop/pd_like.png">
				<span class="spanShowPoints">97.7%</span>
			</div>
			</div>
			<div>
			<a href="#"><img src="${path}/resources/images/prac3.png"></a>
			<div class="dscImage">
				<p>옥수수옥수수</p>
				<p>가격</p>
			</div>
			<div class="showPoints">
				<img src="https://www.oasis.co.kr/images/shop/pd_like.png">
				<span class="spanShowPoints">97.7%</span>
			</div>
			</div>
		</div>
		
		<div id="second_floor">
		<div>
			<a href="product/detail/10002"><img src="${path}/resources/images/prac4.png"></a>
			<div class="dscImage">
				<p>시금치시금치</p>
				<p>가격</p>
			</div>
			<div class="showPoints">
				<img src="https://www.oasis.co.kr/images/shop/pd_like.png">
				<span class="spanShowPoints">97.7%</span>
			</div>
			</div>
			<div>
			<a href="#"><img src="${path}/resources/images/prac5.png"></a>
			<div class="dscImage">
				<p>상추</p>
				<p>가격</p>
			</div>
			<div class="showPoints">
				<img src="https://www.oasis.co.kr/images/shop/pd_like.png">
				<span class="spanShowPoints">97.7%</span>
			</div>
			</div>
			<div>
			<a href="#"><img src="${path}/resources/images/prac6.png"></a>
			<div class="dscImage">
				<p>모르겠음</p>
				<p>가격</p>
			</div>
			<div class="showPoints">
				<img src="https://www.oasis.co.kr/images/shop/pd_like.png">
				<span class="spanShowPoints">97.7%</span>
			</div>
			</div>
		</div>
	</div>
	<!--//코딩 들어갈 부분!!-->
	
	
	
	
		
	<div id="makeSpace">
	</div>
</content>	
