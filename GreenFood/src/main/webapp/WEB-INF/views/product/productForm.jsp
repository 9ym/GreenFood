<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script src="/resources/js/myScript.js"></script>
<script type="text/javascript">

$(function() {

	productReviewList(1, 1, 5);
	
	//페이지네이션 - 페이지 번호 클릭했을때
	$("a.page-link").click(function(e){
		e.preventDefault();
		var pagingPage = "${pagingDto.page}"; // 맨처음 로딩
		var page = $(this).attr("data-page");
		console.log(page);
		var nStartRow = parseInt("${pagingDto.startRow}");
		var nEndRow = parseInt("${pagingDto.endRow}");
		
		console.log(pagingPage);
		
		startRow = nStartRow + (5 * (page-1));
		endRow = nEndRow + (5 * (page-1));
		console.log("startRow", startRow);
		console.log("endRow", endRow);
		productReviewList(page, startRow, endRow);
		$("a.page-link").parent().removeClass("active");
		$(this).parent().addClass("active");
	});
	
	/* 최종 가격 표현 */
	var priceGeneral = "${productVo.product_price}";
	$("#priceGeneral").text(addComma(priceGeneral));
	var count = parseInt($("#productCount").val());
	var totalPrice = priceGeneral * count;
	$("#totalPrice").text(addComma(totalPrice));
	
	/* amazon s3 이미지 불러오기 */
	$(".img-s3").each(function() {
		var thisImg = $(this);
		var fileName = thisImg.attr("data-img");
		var category = thisImg.attr("data-category");
		var sendData = {
				"fileName" : fileName,
				"category" : category
		};
		var url = "/upload/getImageUrl";
		$.post(url, sendData, function(data) {
			thisImg.attr("src", data);
		});
	});
	
	/* 할인된 값 표현 */
	var price = "${productVo.product_price}";
	var saleRate = "${productVo.product_sale_rate}";
	if (saleRate != 0) {
		$("#priceGeneral").text(addComma(Math.ceil(price * (100 - saleRate) / 100)));
		$("#totalPrice").text(addComma(Math.ceil(price * (100 - saleRate) / 100)));
	}

});

/* 상품 후기 리스트 1 ~ 5*/
function productReviewList(page, startRow, endRow){
	var url = "/product/review/getReviewdListProduct";
	var product_code = "${productVo.product_code}";
	
	var sendData = {
			"product_code" : product_code,
			"startRow" : startRow,
			"endRow" : endRow,
			"page" : page
	};
	$.post(url, sendData, function(data){
		console.log(data);
		$("#checkOrderTable > tbody").empty();
			
		$.each(data, function(){
				
				var img1 = ("<img src='/resources/images/review/star1.png'>");
				var img2 = ("<img src='/resources/images/review/star2.png'>");
				var img3 = ("<img src='/resources/images/review/star3.png'>");
				var img4 = ("<img src='/resources/images/review/star4.png'>");
				var img5 = ("<img src='/resources/images/review/star5.png'>");
				
				var tr = $("#trTable").find("tr").clone();
				tr.find("th").eq(0).html(this.review_no);
				tr.find("th").eq(1).html(this.product_title);
				 
					if (this.star_point == 1 ) {
						 tr.find("th").eq(2).html(img1);
					} else if (this.star_point == 2 ) {
						 tr.find("th").eq(2).html(img2);
					}  else if (this.star_point == 3 ) {
						 tr.find("th").eq(2).html(img3);
					}  else if (this.star_point == 4 ) {
						 tr.find("th").eq(2).html(img4);
					}  else if (this.star_point == 5 ) {
						 tr.find("th").eq(2).html(img5);
					}
					tr.find("th").eq(3).html("<a href=/review/reviewContent/"+ this.review_no +">"+this.review_title+"</a>");
					tr.find("th").eq(4).html(this.user_id);
					tr.find("th").eq(5).html(changeDateString(this.review_date));
					tr.find("th").eq(6).html(this.review_readcount);
					 
					$("#checkOrderTable > tbody").append(tr);
		});
	});
}

/* 갯수 올리는 버튼 */
function btnCountUp(obj) {
	var count = parseInt($("#productCount").val());
	$("#productCount").val(count + 1);
	count= parseInt($("#productCount").val());
	var priceStr = $("#priceGeneral").text();
	var productPrice = parseInt(subComma(priceStr));
	var totalPrice = productPrice * count;
	$("#totalPrice").text(addComma(totalPrice));
}

/* 갯수 내리는 버튼 */
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

/* 갯수 직접 입력 */
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

/* 장바구니에 상품 넣기 */
function btnCart(obj) {
	var customerVo = "${sessionScope.customerVo}";
	if(customerVo != "") {
	/* 로그인 됐으면 장바구니 추가 가능 */
		var user_id = "${sessionScope.customerVo.user_id}";
		var product_code = "${productVo.product_code}";
		var product_title = "${productVo.product_title}";
		var product_price = "${productVo.product_price}";
		var product_sale_rate = "${productVo.product_sale_rate}";
		var cart_quantity = parseInt($("#productCount").val());
		var sendData = {
				"user_id" : user_id,
				"product_code" : product_code, 
				"product_title" : product_title,
				"product_price" : product_price,
				"product_sale_rate" : product_sale_rate,
				"cart_quantity" : cart_quantity
		};
		var url = "/order/addCart";
		$.post(url, sendData, function(data) {
			console.log(data);
			if (data == "newCart") {
				alert("장바구니에 상품을 담았습니다.");
			} else if (data == "dupCart") {
				alert("이미 담으신 상품이 있어 추가되었습니다.");
			} 
		});
	} else {
		location.href="/main/loginPage";
	}
}

/* 바로구매(결제) 이동 */
function btnPay(obj) {
	var customerVo = "${sessionScope.customerVo}";
		
	/* 로그인 됐으면 바로결제 가능 */
	if (customerVo != "") { 
		console.log("not null");
		
		var productCount = $("#productCount").val();
		
		$("#frmProductPay").append($('<input/>', {type: 'hidden', name: 'product_code', value: '${productVo.product_code}' }));
		$("#frmProductPay").append($('<input/>', {type: 'hidden', name: 'product_title', value: '${productVo.product_title}' }));
		$("#frmProductPay").append($('<input/>', {type: 'hidden', name: 'product_price', value: '${productVo.product_price}' }));
		$("#frmProductPay").append($('<input/>', {type: 'hidden', name: 'product_sale_rate', value: '${productVo.product_sale_rate}' }));
		$("#frmProductPay").append($('<input/>', {type: 'hidden', name: 'cart_quantity', value: productCount }));
			
		$("#frmProductPay").submit();
		
	/* 로그인 페이지 강제? 이동 */
	} else {
		console.log("null");
//		$.session.set("dest", "/product/detail/${productVo.product_code}");
		location.href="/main/loginPage";
	}
}

function changeDateString(timestamp) {
	
	var d = new Date(timestamp);
	var year = d.getFullYear();
	var month = make2digits(d.getMonth() + 1);
	var date = make2digits(d.getDate());
	var hour = make2digits(d.getHours());
	var minute = make2digits(d.getMinutes());
	var second = make2digits(d.getSeconds());
	
	return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second;
	
}

function make2digits(num) {
	if (num < 10) {
		num = "0" + num;
	}
	return num;
}

</script>

<style>

.page-link {
    position: relative;
    display: block;
    padding: .5rem .75rem;
    margin-left: -1px;
    line-height: 1.25;
    color: #7f8284;
    font-size: 13px;
    background-color: #fff;
    border: 1px solid #dee2e6;
}

.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: #5AB63F;
    border-color: #5AB63F;
}

.page-link:hover {
    z-index: 2;
    color: #fff;
    text-decoration: none;
    background-color: #92e978;
    border-color: #92e978;
}

.col-md-12 text-center {
	padding-top: 30px;
}

.row {
	font-family: 'Black Han Sans', sans-serif, ;
	font-family: 'Noto Serif KR', serif;
	font-size : 15px;
	color : DimGray;
}
.menuInfo {
	margin-top : 20px;
	margin-left : 20px;
}
.viewInfo {
	padding : 10px 0px;
	padding-top : 20px;
	padding-bottom : 0px;
}
.infoImage{
	float : left;
}
.img-product {
	width : 400px;
	height : 420px;
	padding-left : 0px;
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
	padding : 9px 30px;
}
#priceWon {
	font-weight : bold;
	font-size : 15px;
	padding-left : 3px;
}
#priceGeneral {
	fonf-weight : bold;
	font-size : 20px;
	padding-left : 0px;
}
#priceSaleTitle {
	font-size : 13px;
	padding-left : 0px;
	display : block;
}
.li-price-sale #priceGeneral {
	display : inline-block;
	margin-bottom : 10px;
}
.li-price-sale #priceSaleRate {
	fonf-weight : bold;
	font-size : 20px;
	padding-left : 10px;
	color : tomato;
}
#priceCanceled {
	padding-left : 0px;
	text-decoration: line-through;
}
.li-totalPrice {
	float : right;
	padding-right: 10px;
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
	padding : 10px 20px;
	font-weight : bold;
}
.info-btn #btnCart {
	width : 200px;
	margin-left : 30px;
}
.info-btn #btnBuyNow {
	border : 1px solid MediumSeaGreen;
	margin-left : 13px;
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
	margin : 20px 0px;
	padding : 0px 20px;
}
.infoDetail .img-detail {
 	width : 100%;
 	height : 400px;
 	display: block;
  	margin-left: auto;
 	margin-right: auto;
}
.text-detail {
	margin-top : 50px;
}
.infoDetail h2 {
	margin-top : 5px;
	margin-bottom : 20px;
	text-align: center;
	padding : 0px;
}
.infoDetail .p-sub {
	text-align: center;
	font-size : 20px;
	font-weight : bold;
	margin-bottom : 0px;
}
.infoDetail .p-content {
	border-top : 1px solid Gainsboro;
	margin-bottom : 50px;
	text-align: center;
	padding-top : 30px;
}
.text-check {
	margin-top : 150px;
}
.text-check h2 {
    z-index: 1; 
	border-top : solid 1px Gainsboro;
	font-weight : bold;
}
.text-check span {
  	position: relative;  
  	width : 390px;
    z-index: 2; 
    display: inline-block;
	background: white;
	top : -20px;
}
.div-img {
	margin-bottom : 70px;
}
.info-btn span{
	padding-left : 0px;
}
.tbl-review {
	margin : 10px 20px;
	padding : 10px 20px;
}
.related-list {
	display : block;
	margin : 0px;
	padding-left : 157px;
	position : relative;
}
.related-list #related-title {
	border-top : 6px solid black;
	width : 26px;
	color : black;
}
.related-list #related-title p{
	width : 200px;
	font-weight : bold;
}
.related-list #relates-product-list {
	left : 0px; 
	bottom : 0px;
	display : block;
}
.ul-related {
	width : 900px;
	display : block;
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

.related-list button img{
	height : 20px;
	width : 20px;
}
.tbl-review {
	margin-left : 0px;
	padding : 0px;
}
.container-fluid {
	padding-top : 180px;
}
.view-wrap { 
	position : relative;
	padding-left : 0px;
	padding-right : 0px;
}
.view-tab ul  {
 	margin-bottom : 0px;
	clear: both;
}
.view-tab ul li {
 	float: left;
  	background-color : WhiteSmoke;
}
.view-tab ul li a {
 	position: relative; 
    top: 1px; 
	color : black;
	text-align: center; 
	text-decoration: none;
	cursor: pointer;
	border-top : 1px solid Silver;
	border-right : 1px solid Silver;
	display: block;
	padding : 10px 0px;
	width : 150px;
}
.view-wrap .view-content {
	clear: both;
 	position : relative;
	left : 0px;  
 	bottom : 0px; 
 	border-top : solid 1px Silver;
	padding : 20px 0px;
	padding-top : 50px;
}

.xans-board-listheader {
    border-top-style: solid;
	border-bottom-style: solid;
	border-width: 1px;
	border-color: #6ca435;
    
}

.xans-board-listheader tbody tr{
	color: #333;
   	border-top-style: groove;
	border-width: 1px;
	border-color: #6ca435;
}

.xans-board-listheader tbody tr td a {
	color: #333;
   
}

.xans-board-listheader tbody tr td a:hover {
	color: #5AB63F;
  
}


.xans-board-listheader th{
    padding: 20px 0;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

.xans-board-listheader td:nth-child(1) {
    padding: 15px 0;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

.xans-board-listheader td:nth-child(2) {
    padding: 15px 0 15px 30px;
    vertical-align: middle;
    font-size: 13px;
}

.xans-board-listheader td:nth-child(3) {
    padding: 15px 0;
    vertical-align: middle;
    font-size: 13px;
}

.xans-board-listheader td:nth-child(4) {
    padding: 15px 0;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

.xans-board-listheader td:nth-child(5) {
    padding: 15px 0;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

.xans-board-listheader td:nth-child(6) {
    padding: 15px 0;
    vertical-align: middle;
    text-align: center;
    font-size: 13px;
}

a {
	color: #98a18f;
}

<%-- <%@ include file="../include/frmOrdered.jsp" %> --%>

</style>

<div class="container-fluid">
	<div class="row div-content">
		<div class="col-md-3"></div>
		<!-- 상품 개요 -->
		<div class="col-md-6 viewInfo">
		<div>
			<div class="infoImage">
				<img class="img-product img-s3" alt="상품 이미지" src="${path}/resources/images/item.png"
					data-img="${productImageDto.image_info_file_name}" data-category="${productVo.product_category}">
			</div>
			<div class="infoNamePrice">
				<div class="infoName">
					<h3>${productVo.product_title}</h3>
					<span>${productVo.product_sub_title}</span>
				</div>
				<div class="productInfo">
					<ul class="priceList">
						<c:choose>
						<c:when test="${productVo.product_sale_rate == 0}">
						<li class="li-price">
							<span id="priceGeneral">${productVo.product_price}</span>
							<span id="priceWon">원</span>
						</li>
						</c:when>
						<c:otherwise>
						<li class="li-price-sale">
							<span id="priceSaleTitle">회원할인가</span>
							<span id="priceGeneral">${productVo.product_price}</span>
							<span id="priceWon">원</span>
							<span id="priceSaleRate">${productVo.product_sale_rate}%</span><br/>
							<span id="priceCanceled">${productVo.product_price} 원</span>
						</li>
						</c:otherwise>
						</c:choose>
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
							<span>3,000원</span>
						</li>
						<li class="li-totalPrice" style="padding-right:10px;">
							<strong>총 상품금액 : </strong>
							<span id="totalPrice">0</span>
						</li>
						<li class="info-btn">
							<button id="btnBuyNow" type="button" class="btn btn-outline-success"
								onclick="btnPay(this);">바로구매</button>
							<button id="btnCart" type="button" class="btn btn-success" 
								onclick="btnCart(this);">장바구니 담기</button>
							<form id="frmProductPay" action="/order/payImmediate" method="post" style="display:none;"></form>
						</li>
					</ul>
				</div>
			</div>
		</div>
		</div>
		<!--// 상품 개요 -->
		<div class="col-md-3"></div>
	</div>
	
	<div class="row div-content">
		<div class="col-md-2"></div>
		<!-- 관련 상품 -->
		<c:if test="${not empty listRelated}">
		<div class="col-md-8 related-list">
			<div id="related-title"><p>RELATED PRODUCT</p></div>
			<div id="relates-product-list">
				<ul class="ul-related">
					<c:forEach var="productVoList" items="${listRelated}">
					<c:forEach var="productImageDtoList" items="${productImageList}">
					<c:if test="${productVoList.product_code == productImageDtoList.product_code}">
					<li class="li-related" style="float:left;">
						<div class="image-related">
							<div id="infoMove-tab" style="height : 00px;"></div>
							<a href="/product/detail/${productVoList.product_code}">
								<img class="img-related img-s3" alt="관련 상품 사진" src="${path}/resources/images/item.png"
									data-img="${productImageDtoList.image_info_file_name}" data-category="${productVoList.product_category}">
							</a>
						</div>
						<div class="info-related">
							<p class="related-name">${productVoList.product_title} ${productVoList.product_weight}</p>
							<p class="related-price">${productVoList.product_price}</p>
						</div>
					</li>
					</c:if>
					</c:forEach>
					</c:forEach>
				</ul>
			</div>
		</div>
		</c:if>
		<!--// 관련 상품 -->
		<div class="col-md-2"></div>
	</div>
	
	<div class="row div-content">
		<div class="col-md-3"></div>
		<!-- 상세 정보 -->
		<div class="col-md-6 infoDetail view-wrap" id="infoDetail-tab">
			<div class="view-tab">
				<ul>
					<li><a href="#infoDetail-tab" style="border-left: 1px solid Silver; border-bottom: 0px; 
						background-color: white; z-index: 2;">상품설명</a></li>
					<li><a href="#tbl-review-tab" id="reviewList">후기</a></li>
				</ul>
			</div>
			<div class="view-content">
				<div>
					<img class="img-detail img-s3" alt="상세 사진" src="${path}/resources/images/right.PNG"
						data-img="${productImageDto.image_content_file_name}" data-category="${productVo.product_category}">
				</div>
				<div class="text-detail">
					<p class="p-sub">${productVo.product_sub_title}</p>
					<h2>${productVo.product_title}</h2>
					<p class="p-content">${productVo.product_content}</p>
				</div>
				<div class="text-check">
					<h2>
						<span>GreenFood's Check Point</span>
					</h2>
				</div>
				<div class="div-img">
					<img alt="상세 사진" src="https://img-cf.kurly.com/shop/data/goodsview/20200518/gv30000095827_1.jpg">
				</div>
			</div>
		</div>
		<!--// 상세 정보 -->
		<div class="col-md-3"></div>
	</div>
	
	<div class="row div-content">
		<div class="col-md-3"></div>
		<!-- 후기 모음 -->
		<div class="col-md-6 tbl-review view-wrap" id="tbl-review-tab">
			<div class="view-tab">
				<ul>
					<li><a href="#infoMove-tab" style="border-left: 1px solid Silver;">상품설명</a></li>
					<li><a href="#tbl-review-tab" style="background-color: white; border-bottom: 0px; z-index: 2;">후기</a></li>
				</ul>
			</div>
			<div class="view-content" style="padding-top: 0px;">				
				
				<table width="100%" align="center" cellpadding="0"
								
									cellspacing="0">
									<tbody>
										<tr>
											<td>
												<div
													class="xans-element- xans-myshop xans-myshop-couponserial ">
													<table width="100%" class="xans-board-listheader jh"
														cellpadding="0" cellspacing="0" id="trTable"
														style="border-top-style: hidden; padding-bottom: 10px; display: none;">
														
															<tr style="text-align: center; color: #98a18f; font-weight: 500;">
																<th style="width : 60px;"></th>
																<th style="width : 150px;"></th>
																<th style="width : 100px;"></th>
																<th><a class="review_title" href="#"
																			data-bno="${reviewVo.review_no}"></a></th>
																<th style="width : 120px;"></th>
																<th style="width : 120px;"></th>
																<th style="width : 80px;"></th>
															</tr>
														</table>
														
														<table width="100%" class="xans-board-listheader jh"
															cellpadding="0" cellspacing="0" id="checkOrderTable"
															style="border-top-style: hidden; padding-bottom: 10px;">
														<thead class="checkOrder">
															<tr>
																<th style="width : 60px;">번호</th>
																<th style="width : 150px;">상품명</th>
																<th style="width : 100px;">별점</th>
																<th>제목</th>
																<th style="width : 120px;">작성자</th>
																<th style="width : 120px;">작성일</th>
																<th style="width : 80px;">조회수</th>
															</tr>
														</thead>
														<tbody class="checkOrder" id="tableTbody">
														
														</tbody>

													</table>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								
								
								<!-- ----------------------------------- pagination -------------------------------- -->

								<div class="row">
									<div class="col-md-12 text-center" style="margin-top: 30px;">
										<nav>
											<ul class="pagination justify-content-center">
												<!-- 이전 -->
												<c:if test="${pagingDto.startPage != 1}">
													<li class="page-item"><a class="page-link" href="#"
														data-page="${pagingDto.startPage - 1}">이전</a></li>
												</c:if>
												<!-- 1 ~ 10 -->
												<c:forEach var="i" begin="${pagingDto.startPage}"
													end="${pagingDto.endPage}">
													<li
														<c:choose>
															<c:when test="${i == pagingDto.page}">
																class="page-item active"
															</c:when>
															<c:otherwise>
																class="page-item"
															</c:otherwise>
														</c:choose>>
														<a class="page-link" href="#" data-page="${i}">${i}</a></li>
												</c:forEach>
												<!-- 다음 -->
												<c:if test="${pagingDto.endPage < pagingDto.totalPage}">
													<li class="page-item"><a class="page-link" href="#"
														data-page="${pagingDto.endPage + 1}">다음</a></li>
												</c:if>
											</ul>
										</nav>
									</div>
								</div><!-- // pagination -->
			</div>
		</div>
		<!--// 후기 모음  -->
		<div class="col-md-3"></div>
	</div>
	
</div>

</body>
</html>

<%@include file="../include/footer.jsp" %>