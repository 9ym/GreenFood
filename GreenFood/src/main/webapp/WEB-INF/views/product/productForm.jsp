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

/* 갯수에 따라서 최종 가격 변경 (일단은, [회원가]로 계산) */

/* 최종 가격 표현 */
$(function() {
	var priceGeneral = "${productVo.product_price}";
	$("#priceGeneral").text(addComma(${productVo.product_price}));
	
// 	var priceMember = parseInt($("#priceMember").text());
	var priceDiscount = (100 - $("#priceDiscount").attr("data-discount")) / 100;
	
	var priceMember = priceGeneral * priceDiscount;
	$("#priceMember").text(addComma(priceMember));
	console.log("hh-" + priceMember);
	
	var count = parseInt($("#productCount").text());
	var totalPrice = priceMember * count;
	$("#totalPrice").text(addComma(totalPrice));
});

function btnCountUp(obj) {
	var count = parseInt($("#productCount").text());
	$("#productCount").text(count + 1);
	count= parseInt($("#productCount").text());
	var priceStr = $("#priceMember").text();
	var productPrice = parseInt(subComma(priceStr));
	var totalPrice = productPrice * count;
	$("#totalPrice").text(addComma(totalPrice));
	
	/* 가격 숫자로 */
	/* var nums = $("#priceMember").text().split(",");
	var totalNum = "";
	var productPrice = 0;
	for (i = 0; i < nums.length; i++) {
		totalNum += nums[i];
		productPrice = parseInt(totalNum);
	}
	var totalPrice = productPrice * countNew;
	totalPrice = addComma(totalPrice); */
}

function btnCountDown(obj) {
	var count = parseInt($("#productCount").text());
	$("#productCount").text(count - 1);
	count= parseInt($("#productCount").text());
	var priceStr = $("#priceMember").text();
	var productPrice = parseInt(subComma(priceStr));
	var totalPrice = productPrice * count;
	$("#totalPrice").text(addComma(totalPrice));
	
	if (count == 0) {
		$("#productCount").text(1);
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
#priceDiscount {
	padding-left : 10px;
}
.infoPrice span {
	padding-left : 20px;
}
.infoPrice button {
	margin-left : 10px;
}
.li-delivery {
	margin-top : 20px;
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
 	width : 600px;
 	height : 600px;
 	display: block;
  	margin-left: auto;
 	margin-right: auto;
}
.infoDetail h1 {
	text-align: center;
	padding-top : 20px;
}
.infoDetail p {
	text-align: center;
	padding : 10px;
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
				<img class="img-product" alt="상품 이미지" src="${path}/resources/images/${productImageDto.image_file_name}">
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
							<strong>일반 가격</strong>
							<span id="priceGeneral">${productVo.product_price}</span>
						</li>
						<li>
							<strong>회원 가격</strong>
							<span id="priceMember">0</span>
							<span id="priceDiscount" data-discount="30">(30%)</span>
						</li>
						<li>
							<strong style="float:left;">구매수량</strong>
							<div style="float:left;">
								<div class="productCount count" id="productCount" 
									style="float:left; margin-left:30px;">1</div>
								<div style="float:left;">
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
						<li>
							<button type="button">찜(임시)</button>
							<button type="button" class="btn btn-success">
								<span class="glyphicon glyphicon-shopping-cart" style="padding-left:0px;">장바구니</span>
							</button>
							<button type="button" class="btn btn-primary">
								<span class="glyphicon glyphicon-credit-card" style="padding-left:0px;">바로구매</span>
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
				<div><img class="img-detail" alt="상세 사진" src="${path}/resources/images/${productImageDto.image_file_name}"/></div>
				<h1>${productVo.product_title}</h1>
				<p>${productVo.product_sub_title}</p>
				<p>${productVo.product_content}</p>
			</div>
			<!--// 상세 정보 -->
		</div>
		<div class="col-md-3"></div>
	</div>
	
</div>

</body>
</html>