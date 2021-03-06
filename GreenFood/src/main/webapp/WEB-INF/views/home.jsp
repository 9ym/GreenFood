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
	if(msg == "missing"){
		alert("잘못된 접근입니다.");
	}
	/* 상품 검색 */
	$("#header_menu_right_img").click(function(){
		var product_title = $("#header_menu_right_input").val();
		
		if (product_title == null || product_title.length == 0 || product_title == "") {
			alert("공백은 검색 할 수 없습니다. 다시 검색해 주세요.");
		} else {
			location.href = "/product/searchTitle/" + product_title;
		}
	});
	
	/* 회원가입 유도 x 눌렀을 시 쿠키 */
	$("#btnX").click(function(e){
		e.preventDefault();
		setCookie("expend", "true", 60*30);
		topClose();
	});
	
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
// 			$("#header_menu_out").css("transition-duration", "5s");
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
// 				$("#header_menu_out").css("timing-function", "step-start");
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
	
});
</script>
<!-- 스크립트 끝 -->

<title>ܤܤ그린푸드ܤܤ</title>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap" rel="stylesheet">

<!-- 스타일 -->
<style>
*{ margin:0;padding:0; font-family: 'Roboto', sans-serif; }
header{ margin:0;padding:0; }
.slide{ position:relative; }
*:focus { outline:none; }
ul,li{ list-style:none; }
ul li a{ text-decoration:none; }

.slide{height:270px;overflow:hidden; margin-left : 150px; margin-right : 150px; margin-top:170px;}
.slide ul{position:relative;height:100%;  }
.slide li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;animation:fade 8s infinite; display:block;}
.slide li:nth-child(1){background-image:url("https://images.unsplash.com/photo-1591981093673-984cd7de9ca4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80");animation-delay:0s;background-repeat:no-repeat;background-size: 100% 100%;}
.slide li:nth-child(2){background-image:url("https://images.unsplash.com/photo-1587482990911-773a2aef47dc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80");animation-delay:2s;background-repeat:no-repeat;background-size:100%100%;}
.slide li:nth-child(3){background-image:url("https://images.unsplash.com/photo-1510442393143-041057d09394?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2089&q=80");animation-delay:4s;background-repeat:no-repeat;background-size:100%100%;}
.slide li:nth-child(4){background-image:url("https://images.unsplash.com/photo-1541683746238-470486ba4a00?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2089&q=80");animation-delay:6s;background-repeat:no-repeat;background-size:100%100%;}
	
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
	
	* {
		font-family: 'Noto Sans', sans-serif;
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
	}
	#a-first_li {										
		display:inline;	
	}										
	#first_li a{
		display:inline;
	}
	#first_li img{
		height : 20px;
		width : 20px;
		margin-left : 15px;
		margin-right : 5px;
		margin-top : 25px;
	}
	
	#header_menu .hide {
		width:120px;
	}
	#header_menu a:hover {
/* 		font-size:110%; */
		color : #6ca435;
		text-decoration : none;
	}
	.hide ul{
		width:120px;
	}
	
	#header_menu #first_li>a{
		color:#6ca435;
	}
	#header_menu ul a{
		font-family: 'Noto Sans', sans-serif;
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
		border:1px solid Gainsboro;
	}
	#header_menu_right input{
		float:left;
		width:200px;
		height:29px;
		border:none;
	}
	#header_menu_right input:focus { outline:none; }
	#header_menu_right a img{
			height:29px;
			float:right;
			margin:0;
			padding:0;
	}
	
	#header_small_menu{
		width:500px;
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
	#best_text img {
		padding-left: 0px;
     	padding-right: 10px;
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
		color: Tomato;
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
		top:5px;
		width : 20px;
		height : 20px;
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
<!-- 스타일 끝 -->
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
				<a href="#">주문배송</a><img src="https://www.oasis.co.kr/images/common/bg_footer.png">
			</c:if>
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
				<li><a href="/product/menu/new">신상품</a></li>
				<li><a href="/product/menu/best">추천상품</a></li>
				<li><a href="/product/menu/sale">세일상품</a></li>
				<li><a href="/review/reviewMain">후기모음</a></li>
				<li><a href="/main/event/eventMain">이벤트</a></li>
			</ul>
			<div id="header_menu_right">
				<a href="#" id="header_menu_right_img"><img src="https://www.oasis.co.kr/images/common/gnbSearch.png"></a>
				<input type="text" id="header_menu_right_input" placeholder="어떤 상품을 찾으세요?"></input>
			</div>
		</div>
	</div>
 </header>
 
<div class="products-list">

	<div id="best_text">
		<img src="${path}/resources/images/best_text.png" 
			style="padding-left: 0px; padding-right: 10px;">
	</div>
	<div id="make_line">
	</div>
	
	<!-- 베스트 6 상품 -->
	<div id="best_products">
		<div id="first_floor">
			<c:forEach var="productVo" items="${productPopularList}">
			<c:forEach var="productImageDto" items="${productImageList}">
			<c:if test="${productVo.product_code == productImageDto.product_code}">
				<div>
					<a href="/product/detail/${productVo.product_code}">
						<img class="imgInfo" src="${path}/resources/images/item.png" style="width:240px; height:240px;"
							data-img="${productImageDto.image_info_file_name}" data-category="${productVo.product_category}">
					</a>
					<div class="dscImage">
						<p>${productVo.product_title}</p>
						<p class="price-p">${productVo.product_price}</p>
					</div>
					<div class="showPoints">
						<img src="https://www.oasis.co.kr/images/shop/pd_like.png">
						<span class="spanShowPoints">
						<c:forEach begin="1" end="${productVo.product_star}">
							★
						</c:forEach>
						</span>
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

<%@include file="include/footer.jsp" %>
