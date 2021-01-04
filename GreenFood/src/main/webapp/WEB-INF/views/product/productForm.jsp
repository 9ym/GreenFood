<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- <link rel="stylesheet" type="text/css" href="#"/>css 하다가 따로 파일 만들어서 저장 -->

<script src="/resources/js/myScript.js"></script>
<script type="text/javascript">
// $(function() {
// 	/* 헤더 배경화면, 게시판 이름 바꾸는 부분 */
// 	/* url 뒤에 사진 넣으면됩니다. */
// 	$("#page_background").css({"background-image":"url('${path}/resources/images/display2.jpg')"});
// 	$("#page_background").css({"background-size":"100% 100%"});
// 	$("#page_background").css({"background-repeat":"no-repeat"});
// 	$("#boardNames").text("상품 상세");/* 게시판 이름 */
// }); 

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
	var productPrice = parseInt(subComma($("#priceGeneral").text()));
	var totalPrice = productPrice * count;
	$("#totalPrice").text(addComma(totalPrice));
	
	if (count == 0 || isNaN(count) ) {
		$("#productCount").val(1);
		alert("최소 갯수는 1개입니다.");
		$("#totalPrice").text(addComma(productPrice));
	}
}

/* 관련 상품 가격에 , 추가 */
$(function() {
	var len = $(".li-related").each(function() {
		var p = $(this).find("p").eq(1);
		var price = p.text();
		p.text(addComma(price) + "원");
	});
});

</script>

<style>
.row {
	font-family: 'Black Han Sans', sans-serif;
	font-family: 'Noto Serif KR', serif;
}
.menuInfo {
	margin-top : 20px;
	margin-left : 20px;
}
.viewInfo {
	margin : 30px 20px;
	padding : 30px 20px;
 	padding-right : 0px;
	padding-top : 40px;
	border-top : 1px solid #6ca435;
 	border-bottom : 1px solid #6ca435; 
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
	padding-left : 45px;
}
.infoName h3 {
	margin-top : 10px;
}
.infoName p {
	color : gray;
}
.productInfo {
	padding : 0px 20px;
}
.productInfo li {
	padding : 10px 30px;
}
.li-price #priceWon {
	font-weight : bold;
	font-size : 15px;
	padding-left : 3px;
}
.li-price #priceGeneral {
	fonf-weight : bold;
	font-size : 20px;
	padding-left : 0px;
}
.li-totalPrice {
	float : right;
	padding-right : 10px;
}
.li-totalPrice #totalPrice {
	font-weight : bold;
	font-size : 25px;
	padding-left : 3px;
}
.li-count {
	float : left;
}
.li-count strong {
	padding-top : 3px;
	float : left;
}
.li-count button {
	border : 0px;
/* 	padding : 10px; */
	width : 20px;
	height : 26px;
	text-align : center;
	color : #6ca435;
	font-weight : bold;
	font-size : 17px;
	float : left;
	border : solid 1.5px LightGray;
}
.li-count input {
 	border-top : solid 1.5px LightGray;
 	border-bottom : solid 1.5px LightGray;
 	border-right : 0px;
 	border-left : 0px;
	text-align : center;
	height : 26px;
	width : 40px;
/* 	margin : 0px 5px; */
	float : left;
	font-size : 15px;
}
.li-count div {
	float : left; 
 	padding-left : 6px;
}
.info-btn {
	clear : both;
	padding-left : 25px;
}
.info-btn button {
/* 	margin-left : 0px; */
/* 	margin : 0px 5px; */
	padding : 5px 20px;
}
.info-btn #btnBuyNow {
	border : 1px solid MediumSeaGreen;
}
.productInfo span {
	padding-left : 20px;
}
.productInfo li #span-shelf {
	padding-left : 87px;
}
.productInfo .info-btn{
	margin-left : 10px;
	padding : 10px 10px;
}
.productInfo button {
	margin-left : 20px;
}
.productInfo button span span{
	font-weight : bold;
	margin-left : 5px;
}
 .li-delivery {
	margin-top : 25px;
	clear : left;
} 
.li-delivery span{
	padding-left : 38px;
} 
.count-up {
	color : MediumSeaGreen;
	padding-left : 0px;
}
.count-down {
	color : MediumSeaGreen;
}
.infoDetail {
	margin : 20px;
	padding : 40px 20px;
 	border-top : 1px solid #6ca435;
 	border-bottom : 1px solid #6ca435;  
/*  	border-bottom : 1px solid red; */
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
.tbl-review {
	margin : 10px 20px;
	padding : 10px 20px;
}
.related-list {
	margin : 5px;
	padding-left : 30px;
	padding-right : 0px;
/*  border-bottom : 1px solid #6ca435;  */
}
.ul-related {
	width : 820px;
}
.info-related {
	border-bottom : solid 1px LightGray;
	border-left : solid 1px LightGray;
	border-right : solid 1px LightGray;
	width : 140px;
	padding : 10px;
}
.li-related img {
	width : 140px;
	height : 140px;
}
.li-related {
	margin : 0px 5px;
	margin-bottom : 10px;
}
.li-related p {
	margin-bottom : 5px;
}
.related-name {
	font-weight : bold;
}
.related-list button {
	margin : 0px 5px; 
	padding : 105px 5px;
	border : 0px;
	float : left;
}
.related-list button img{
	height : 20px;
	width : 20px;
/* 	margin-right : 5px; */
}
.container-fluid {
	padding-top : 150px;
}
/* .div-content {
	display:block;
	width:900px;
 	left:450px; 
 	height: 100%;
	
	position: relative;
	left: 50%;
	ms-transform: translate(-50%);
	transform: translate(-50%);
} */

</style>

<div class="container-fluid">

	<!-- <div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			메뉴 안내?
			<div class="menuInfo">메뉴 메뉴</div>
			// 메뉴 안내?
		</div>
		<div class="col-md-3"></div>
	</div> -->
	
	<div class="row div-content">
		<div class="col-md-3"></div>
		<div class="col-md-6 viewInfo">
		<!-- 상품 개요 -->
		<div>
			<div class="infoImage">
				<!-- 임시로... image_file_name 파일 이름만 DB에서 가져와서 사용 -->
<%-- 				<img class="img-product" alt="상품 이미지" src="${path}/resources/images/product/${productImageDto.image_info_file_name}"> --%>
				<img class="img-product" alt="상품 이미지" src="https://greenfood.s3.ap-northeast-2.amazonaws.com/category_2003/${productImageDto.image_info_file_name}">
			</div>
			<div class="infoNamePrice">
				<div class="infoName">
					<h3>${productVo.product_title}</h3>
					<span>${productVo.product_sub_title}</span>
				</div>
				<div class="productInfo">
					<ul class="priceList">
						<li class="li-price">
							<span id="priceGeneral">${productVo.product_price}</span>
							<span id="priceWon">원</span>
						</li>
						<c:if test="${productVo.product_sales_unit != null}">
							<li>
								<strong>판매단위</strong>
								<span>${productVo.product_sales_unit}</span>
							</li>
						</c:if>		
						<c:if test="${productVo.product_weight != null}">				
							<li>
								<strong>중량/용량</strong>
								<span style="padding-left:15px;">${productVo.product_weight}</span>
							</li>
						</c:if>
						<li>
							<strong>원산지</strong>
							<span style="padding-left:36px;">${productVo.product_origin}</span>
						</li>
						<li>
							<strong>유통기한</strong>
							<c:choose>
								<c:when test="${productVo.product_shelf_life != 0}">
									<span>${productVo.product_shelf_life}</span>
									<span style="padding-left:0px;">일</span>
								</c:when>
								<c:otherwise>
									<span>농산물로 별도의 유통기한은 없으나</span><br/>
									<span id="span-shelf">가급적 빠르게 드시기 바랍니다.</span>
								</c:otherwise>
							</c:choose>
						</li>
						<li class="li-count">
							<strong>구매수량</strong>
							<div>
								<button type="button" onclick="javascript:btnCountDown(this);">-</button>
								<input type="text" size="2" id="productCount" value="1" oninput="javascript:inputCount(this)"/>
								<button type="button" onclick="javascript:btnCountUp(this);" style="margin-left:0px;">+</button>
							</div>
						</li>
						<li class="li-delivery">
							<strong>배송비</strong>
							<span>3,000원 (30,000원 이상 무료)</span>
						</li>
						<li class="li-totalPrice" style="padding-right:10px;">
							<strong>총 상품금액 : </strong>
							<span id="totalPrice">0</span>
						</li>
						<li class="info-btn">
							<button type="button" class="btn btn-danger btn-sm"
								style="margin-left:15px; margin-right:5px;">♥</button>
							<button id="btnBuyNow" type="button" class="btn btn-outline-success">바로구매</button>
							<button id="btnCart" type="button" class="btn btn-success">장바구니 담기</button>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!--// 상품 개요 -->
		</div>
		<div class="col-md-3"></div>
	</div>
	
	<div class="row div-content">
		<div class="col-md-3"></div>
		<!-- 관련 상품 -->
		<div class="col-md-6 related-list">
			<div>
				<button type="button" class="btn btn-default btn-sm">
					<img src="${path}/resources/images/left.PNG">
		        </button>
				<ul class="ul-related">
					<c:forEach var="productVoList" items="${productBestList}">
					<c:forEach var="productImageDtoList" items="${productImageList}">
					<c:if test="${productVoList.product_code == productImageDtoList.product_code}">
					<c:if test="${productVoList.product_title != productVo.product_title}">
					<li class="li-related" style="float:left;">
						<div class="image-related">
							<a href="/product/detail/${productVoList.product_code}">
								<img src="${path}/resources/images/product/${productImageDtoList.image_info_file_name}"/>
							</a>
						</div>
						<div class="info-related">
							<p class="related-name">${productVoList.product_title} ${productVoList.product_weight}</p>
							<p class="related-price">${productVoList.product_price}</p>
						</div>
					</li>
					</c:if>
					</c:if>
					</c:forEach>
					</c:forEach>
				</ul>
				<button type="button" class="btn btn-default btn-sm">
					<img src="${path}/resources/images/right.PNG">
		        </button>
			</div>
		</div>
		<!--// 관련 상품 -->
		<div class="col-md-3"></div>
	</div>
	
	<div class="row div-content">
		<div class="col-md-3"></div>
		<!-- 상세 정보 -->
		<div class="col-md-6 infoDetail">
			<div>
<%-- 				<div><img class="img-detail" alt="상세 사진" src="${path}/resources/images/product/${productImageDto.image_content_file_name}"/></div> --%>
				<div><img class="img-detail" alt="상세 사진" src="https://greenfood.s3.ap-northeast-2.amazonaws.com/category_2003/${productImageDto.image_content_file_name}"/></div>
				<p>${productVo.product_sub_title}</p>
				<h1>${productVo.product_title}</h1>
				<p>${productVo.product_content}</p>
				<!-- <span>고구마는 맛과 영양을 고루 갖춘 팔방미인 식재료죠. 얼핏 보면 비슷하게 생긴 고구마도 종류에 따라 다양한 맛과 식감을 자랑하는데요. 
				그린푸드가 준비한 제품은 붉은색 껍질과 연노랑 속살의 고구마예요. 포근하고 고소하면서도, 씹을수록 달콤하고 담백하죠. 
				취향에 맞게 찌거나 구워서 간단한 식사처럼 즐기거나, 간식으로 활용하세요.</span> -->
			</div>
		</div>
		<!--// 상세 정보 -->
		<div class="col-md-3"></div>
	</div>
	
	<div class="row div-content">
		<div class="col-md-3"></div>
		<div class="col-md-6 tbl-review">
			<p>후기 게시판?</p>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>1</th>
						<th>2</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>11</td>
						<td>22</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-md-3"></div>
	</div>
	
</div>

</body>
</html>