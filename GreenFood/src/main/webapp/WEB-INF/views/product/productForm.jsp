<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <c:set var="path" value="${pageContext.request.contextPath}" /> --%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- <link rel="stylesheet" type="text/css" href="#"/>css 하다가 따로 파일 만들어서 저장 -->

<script src="/resources/js/myScript.js"></script>
<script type="text/javascript">
$(function() {
	/* 헤더 배경화면, 게시판 이름 바꾸는 부분 */
	/* url 뒤에 사진 넣으면됩니다. */
	$("#page_background").css({"background-image":"url('${path}/resources/images/display2.jpg')"});
	$("#page_background").css({"background-size":"100% 100%"});
	$("#page_background").css({"background-repeat":"no-repeat"});
	$("#boardNames").text("상품 상세");/* 게시판 이름 */
});

/* 최종 가격 표현 */
$(function() {
	var priceGeneral = "${productVo.product_price}";
	$("#priceGeneral").text(addComma(priceGeneral));
	var count = parseInt($("#productCount").val());
	var totalPrice = priceGeneral * count;
	$("#totalPrice").text(addComma(totalPrice));
});

function btnCountUp(obj) {
	var count = parseInt($("#productCount").val());
	$("#productCount").val(count + 1);
	count= parseInt($("#productCount").val());
	var priceStr = $("#priceGeneral").text();
	var productPrice = parseInt(subComma(priceStr));
	var totalPrice = productPrice * count;
	$("#totalPrice").text(addComma(totalPrice));
}

function btnCountDown(obj) {
	var count = parseInt($("#productCount").val());
	$("#productCount").val(count - 1);
	count= parseInt($("#productCount").val());
	var priceStr = $("#priceGeneral").text();
	var productPrice = parseInt(subComma(priceStr));
	var totalPrice = productPrice * count;
	$("#totalPrice").text(addComma(totalPrice));
	
	if (count == 0) {
		$("#productCount").val(1);
		alert("최소 갯수는 1개입니다.");
		$("#totalPrice").text(addComma(productPrice));
	}
}

function inputCount(obj) {
	var count = parseInt($("#productCount").val());
	console.log(count);
	var productPrice = parseInt(subComma($("#priceGeneral").text()));
	var totalPrice = productPrice * count;
	$("#totalPrice").text(addComma(totalPrice));
	
	if (count == 0 || isNaN(count) ) {
		$("#productCount").val(1);
		alert("최소 갯수는 1개입니다.");
		$("#totalPrice").text(addComma(productPrice));
	}
}

</script>

<style>
.menuInfo {
	margin-top : 20px;
	margin-left : 20px;
}
.viewInfo {
	margin : 20px;
	padding : 30px 10px;
	border-top : 5px solid #6ca435;
}
.infoImage{
	float : left;
}
.img-product {
	width : 400px;
	height : 400px;
}
.infoNamePrice {
  	float : left;  
}
.infoName {
	padding-left : 40px;
}
.infoPrice {
	padding : 10px 20px;
}
.infoPrice li {
	padding : 10px 20px;
}
.li-count {
	float : left;
}
.li-count strong{
	padding-top : 3px;
	float : left;
}
.li-count input {
 	border : solid 1px gray;
	text-align : center;
	float : left; 
	margin-left : 30px;
}
.li-count div {
	float : left; 
}
.infoPrice span {
	padding-left : 20px;
}
.infoPrice button {
	margin-left : 10px;
}
.li-delivery {
	margin-top : 25px;
	clear : left;
}
.li-delivery span{
	padding-left:40px;
}
.count {
	border : 1px solid Gainsboro;
	width : 30px;
	text-align: center;
}
.count-up {
	color : LightCoral;
}
.count-down {
	color : LightSkyBlue;
}
#totalPrice {
	font-weight : bold;
	color : red;
}
.infoDetail {
	margin : 20px;
	padding : 30px 10px;
	border-top : 5px solid #6ca435;
	border-bottom : 5px solid #6ca435;
}
.img-detail {
 	width : 700px;
 	height : 400px;
 	display: block;
  	margin-left: auto;
 	margin-right: auto;
}
.infoDetail h1 {
	margin : 0px;
	text-align: center;
	padding : 10px;
}
.infoDetail p {
	margin : 0px;
	text-align: center;
	padding-top : 10px;
}
.info-btn span{
	padding-left : 0px;
}
</style>

<div class="container-fluid">

	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<!-- 메뉴 안내? -->
			<div class="menuInfo">메뉴 메뉴</div>
			<!--// 메뉴 안내? -->
		</div>
		<div class="col-md-3"></div>
	</div>
	
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		<!-- 상품 개요 -->
		<div class="viewInfo">
			<div class="infoImage">
				<!-- 임시로... image_file_name 파일 이름만 DB에서 가져와서 사용 -->
				<img class="img-product" alt="상품 이미지" src="${path}/resources/images/${productImageDto.image_info_file_name}">
			</div>
			<div class="infoNamePrice">
				<div class="infoName">
					<h3>${productVo.product_title}</h3>
					<p>${productVo.product_sub_title}</p>
				</div>
				<div class="infoPrice">
					<ul class="priceList">
						<li>
							<strong>보관방법</strong>
							<span>상온</span>
						</li>
						<li>
							<strong>판매 가격</strong>
							<span id="priceGeneral">${productVo.product_price}</span>
						</li>
						<li class="li-count">
							<strong>구매수량</strong>
							<div>
								<input type="text" size="2" id="productCount" value="1" oninput="javascript:inputCount(this)"/>
								<div>
									<span class="glyphicon glyphicon glyphicon-plus count-up"
										onclick="javascript:btnCountUp(this);"></span>
									<span class="glyphicon glyphicon glyphicon-minus count-down"
										onclick="javascript:btnCountDown(this);"></span>
								</div>
							</div>
						</li>
						<li class="li-delivery">
							<strong>배송비</strong>
							<span>3,000원 (30,000원 이상 무료)</span>
						</li>
						<li>
							<strong>최종 가격</strong>
							<span id="totalPrice">0</span>
						</li>
						<li class="info-btn">
							<button type="button">
								<span class="glyphicon glyphicon-heart"></span> ${productVo.product_heart}
							</button>
							<button type="button" class="btn btn-success">
								<span class="glyphicon glyphicon-shopping-cart">장바구니</span>
							</button>
							<button type="button" class="btn btn-primary">
								<span class="glyphicon glyphicon-credit-card">바로구매</span>
							</button>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!--// 상품 개요 -->
		</div>
		<div class="col-md-3"></div>
	</div>
	
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<!-- 상세 정보 -->
			<div class="infoDetail">
				<div><img class="img-detail" alt="상세 사진" src="${path}/resources/images/${productImageDto.image_content_file_name}"/></div>
				<p>${productVo.product_sub_title}</p>
				<h1>${productVo.product_title}</h1>
<%-- 				<p>${productVo.product_content}</p> --%>
				<span>고구마는 맛과 영양을 고루 갖춘 팔방미인 식재료죠. 얼핏 보면 비슷하게 생긴 고구마도 종류에 따라 다양한 맛과 식감을 자랑하는데요. 
				컬리가 준비한 제품은 붉은색 껍질과 연노랑 속살의 밤고구마예요. 밤처럼 포근하고 고소하면서도, 씹을수록 달콤하고 담백하죠. 
				취향에 맞게 찌거나 구워서 간단한 식사처럼 즐기거나, 간식으로 활용하세요.</span>
			</div>
			<!--// 상세 정보 -->
		</div>
		<div class="col-md-3"></div>
	</div>
	
</div>

</body>
</html>