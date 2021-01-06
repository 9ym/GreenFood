<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>													
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>													
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>													
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>													
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 스크립트 -->
<script type="text/javascript" src="${path}/resources/js/myScript.js"></script>
<script>
$(function(){
	var msg = "${msg}";
	var user_id = "${findUser_id}";
	if(msg == "loginSuccess"){
		alert("로그인 성공했습니다.");
	} else if(msg == "tempPasswordCreate"){
		alert("임시 비밀번호가 발송되었습니다.");
	} else if(user_id != ""){
		alert("회원님의 아이디는" + user_id + "입니다.")
	}
	
	/* 베스트 상품 가격에 , 추가 */
	var len = "${mainProductCount}";
	for (i = 0; i < len; i++) {
		var price = parseInt($(".price-p").eq(i).text());
		$(".price-p").eq(i).text(addComma(price));
	}	
	
	/* 스크롤에 따라서 메뉴 상단에 고정 */
	var didScroll; 
	// 스크롤시에 사용자가 스크롤했다는 것을 알림 
	$(window).scroll(function(event){ 
		didScroll = true; 
	}); 
	// hasScrolled()를 실행하고 didScroll 상태를 재설정 
	setInterval(function() {
		if (didScroll) { 
			hasScrolled(); didScroll = false; 
		} 
	}, 250); 
	function hasScrolled() {
		// 동작을 구현 
		var st = $(this).scrollTop(); 
// 		console.log("GG-" + st);
		
		if (st > 55) {
			$("#header_menu_out").css("transition-property", "margin-top");
// 			$("#header_menu_out").css("transition-duration", "0.2s");
			$("#header_menu_out").css("margin-top", "0px");
			if (st > 390) {
				$("#header_menu_out").css("transition-property", "box-shadow");
				$("#header_menu_out").css("box-shadow", "0px 3px 3px WhiteSmoke");
			}
		} 
		if (st <= 400) {
			$("#header_menu_out").css("transition-property", "box-shadow");
			$("#header_menu_out").css("box-shadow", "0px 0px 0px WhiteSmoke");
			if (st <= 55) {
				$("#header_menu_out").css("transition-property", "margin-top");
// 				$("#header_menu_out").css("transition-duration", "0.1s");
				$("#header_menu_out").css("margin-top", "80px");
			}
		} 
	}
	
	/* amazon s3 이미지 불러오기 */
	$(".imgInfo").each(function() {
		var thisImg = $(this);
		var fileName = thisImg.attr("data-img");
		var category = thisImg.attr("data-category");
		var sendData = {
				"fileName" : fileName,
				"category" : category
		};
		var url = "upload/getImageUrl";
		$.post(url, sendData, function(data) {
// 			console.log(data);
			thisImg.attr("src", data);
		});
	});
	
});	
</script>
<!-- 스크립트 끝 -->

<title>ܤܤ그린푸드ܤܤ</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<!-- 스타일 -->
<style>
*{ margin:0;padding:0; font-family: 'Roboto', sans-serif; }
header{ margin:0;padding:0; }
.slide{ position:relative; }
*:focus { outline:none; }
ul,li{ list-style:none; }
ul li a{ text-decoration:none; }

.slide{height:300px;overflow:hidden;margin-top:170px;}
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
	/* 최상단 메뉴바 */
	#header_id{
		width:1000px;
		height:50px;
		z-index:99999;
		background-color:yellow;
	}
	
	/* #main_text{
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
	} */
	
	#header_menu_out {
		margin-top : 80px;
		position : fixed;
 		z-index:10; 
 		left: 0px; 
		top : 0px;
		background-color : white;
		height : 70px;
		width : 100%;
	}
	
	#header_menu{
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
	
	#header_menu img{
		float:left;
		margin-left:30px;
		padding:0;
		height:65px;
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
		height: 70px;
		width:120px;
/* 		text-align : center; */
/* 		float : left; */
	}
	#a-first_li {										
		display:inline;	
/* 		border-top: #6ca435 1px solid; */
/* 		border-bottom: #6ca435 1px solid; */
/* 		padding : 20px 20px;	 */
	}										
	#first_li a{
		display:inline;
	}
	#first_li img{
		height : 20px;
		width : 20px;
		margin-left : 15px;
		margin-right : 5px;
		margin-top : 28px;
		
		/* display: block;
		margin-left: auto;
		margin-right: auto;
		hight: 50%; */
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
		border:1px solid Gainsboro;
	}
	#header_menu_right input{
	float:left;
		width:200px;
		height:30px;
		border:none;
	}
	#header_menu_right input:focus { outline:none; }
	#header_menu_right a img{
			height:30px;
			float:right;
			margin:0;
			padding:0;
	}
	
	#header_small_menu{
		min-width:270px;
 		position:absolute; 
 		top:35px;
		
		margin: 0;
		left: 79%;
 		ms-transform: translate(-79%);
 		transform: translate(-79%);
	}
	#header_small_menu a{
		margin-right:5px;
		text-decoration:none;
		color : DimGray;
		font-weight : bold;
		font-size:14px;
		margin-right:5px;
		margin-left:5px;
	}
	
	#header_small_menu #a-join {
		color : MediumSeaGreen;
	}
	
	.products-list{
		display:block;
		width:1000px;
		left:450px;
		height:100%;
		margin:0;
		padding:0;
		
		position: relative;
		left: 50%;
		ms-transform: translate(-50%);
		transform: translate(-50%);
	}
	#best_text{
		margin-top:50px;
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
		height:800px;
		background-color:yellow;
		margin: auto;
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
		margin-left : 0px;
	}
	#header_menu #first_li:hover .hide{
		opacity:1;
		visibility:visible;
	}
	
	.products-list #best_text img{
		height : 110px;
		padding-left : 35px;
	}
	
	.products-list #best_products{
		background-color:#f7f7f7;
		margin-top:50px;
		float:left;
		height:770px;
	}
	
	#first_floor > div{
		float:left;
		margin:20px 40px;
	}
	#first_floor{
		margin:0 auto;
		margin-left:30px;
		margin-top:30px;
	}
	.dscImage{
		text-align:center;
		position:relative;
		top:10px;
		font-weight : bold;
	}
	.dscImage p:nth-child(1){
		font-size:18px;
		margin : 0px;
	}
	.dscImage p:nth-child(2){
		margin-top:0px;
		color:red;
	}
	.showPoints{
		position:relative;
		background-color:green;
		opacity:0.7;
		height: 35px;
		width:180px;
		top:-110px;
		left:25px;
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
		color : black;
	}
	.div-top a button {
/* 		font-size: 10px; */
		border: none;
		background-color: #6ca435;
		display: inline-block;
/* 		margin-left : 300px; */
	}
</style>
<!-- 스타일 끝 -->
</head>
<body>
${testVo}
${testVo.user_id}
<header>
	<!-- 제일 상단 버튼 : 회원가입 혜택 안내?? -->
	<div class="div-top">	
		<a href="#">
			<span>dngkgkgkgkgkgkgk</span>
			<button type="button">X</button>
		</a>
	</div>
	<!--// 제일 상단 버튼 -->
	
	<!-- 이미지 슬라이드 -->
	<div class="slide">
	  <ul>
	    <li></li>
	    <li></li>
	    <li></li>
	    <li></li>
	  </ul>
	</div>
	<!--// 이미지 슬라이드 -->
	
	<!-- <div id="main_text">
		<p>바른 먹거리 신뢰와 상생</p>
		<p id=>농산물 직거래 플랫폼</p>
		<p>우리 지역 농산물의 <span id="main_text_span">신선함</span>을 그대로 전달해 드립니다</p>
	</div> -->
	
	<div id="header_small_menu">
		<c:choose>
			<c:when test="${not empty sessionScope.testVo }">
		 	<a href="/logout">로그아웃</a><img src="https://www.oasis.co.kr/images/common/bg_footer.png">
			<a href="/customer/customerMyPage">마이페이지</a><img src="https://www.oasis.co.kr/images/common/bg_footer.png">
		 	</c:when>
			<c:otherwise>
			<a href="/main/loginPage">로그인</a><img src="https://www.oasis.co.kr/images/common/bg_footer.png">
			<a id="a-join" href="/main/memberJoinForm">회원가입</a><img src="https://www.oasis.co.kr/images/common/bg_footer.png">
		 	</c:otherwise>
		</c:choose>	
		<a href="#">주문배송</a><img src="https://www.oasis.co.kr/images/common/bg_footer.png">
		<a href="/customerCenter/customerCenterMain">고객센터</a>
	</div>
	<div id="header_menu_out">
		<div id="header_menu">
			<a href="/"><img src="${path}/resources/images/greenfood_logo.png"></a>
			<ul>
				<li id="first_li"><img src="${path}/resources/images/stripe3.png"><a id="a-first_li" href="#">전체 보기</a>	
					<ul class="hide">
						<c:forEach var="productCategoryDto" items="${categoryList}">
							<li><a href="/product/category/${productCategoryDto.product_category}">${productCategoryDto.product_category_dsc}</a></li>
						</c:forEach>
					</ul>		
				</li>
				<li><a href="#">신상품</a></li>
				<li><a href="#">추천상품</a></li>
				<li><a href="#">세일상품</a></li>
				<li><a href="#">후기모음</a></li>
				<li><a href="/main/event/eventMain">이벤트</a></li>
			</ul>
			<div id="header_menu_right">
				<a href="#"><img src="https://www.oasis.co.kr/images/common/gnbSearch.png"></a>
				<input type="text" placeholder="무엇이 궁금하세요?"></input>
			</div>
		</div>
	</div>
 </header>
 
<div class="products-list">

	<div id="best_text">
		<img src="${path}/resources/images/best_text.png">
		<a type="button" href="/upload/fileInputTest">파일 인풋 테스트</a>
	</div>
	<div id="make_line">
	</div>
	
	<!-- 베스트 6 상품 -->
	<div id="best_products">
		<div id="first_floor">
			<c:forEach var="productVo" items="${productBestList}">
			<c:forEach var="productImageDto" items="${productImageList}">
			<c:if test="${productVo.product_code == productImageDto.product_code}">
				<div>
					<a href="/product/detail/${productVo.product_code}">
						<img class="imgInfo" src="${path}/resources/images/right.PNG" style="width:240px; height:240px;"
							data-img="${productImageDto.image_info_file_name}" data-category="${productVo.product_category}">
					</a>
					<div class="dscImage">
						<p>${productVo.product_title}</p>
						<p class="price-p">${productVo.product_price}</p>
					</div>
					<div class="showPoints">
						<img src="https://www.oasis.co.kr/images/shop/pd_like.png">
						<span class="spanShowPoints">97.7%</span>
					</div>
				</div>
			</c:if>
			</c:forEach>
			</c:forEach>
		</div>
	</div>
	<!--// 베스트 6 상품 -->
	
	<div id="makeSpace">
	</div>
	
</div>	
