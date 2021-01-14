<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style>
.div {
	display: block;
}
.container-fluid {
	padding-top : 180px;
}
.div-cart {
/* 	display : block; */
/* 	border : 1px dotted red; */
	margin-bottom : 80px;
}
.div-cart strong {
	text-align : center;
	display : block;
	font-size : 22px;
	margin : 10px 0px 30px;
}
.div-cart-list {
	float : left;
/* 	border : 2px dashed blue; */
	border-bottom : 1px solid gainsboro;
 	display : block; 
	width : 70%;
	height : auto;
}
.cart-inner-select {
	padding-left : 19px;
}
.cart-inner-select label {
	margin-left : 5px;
	margin-right : 10px;
/* 	margin-bottom : 5px; */
}
.cart-inner-select #line {
	color : gainsboro;
}
.cart-inner-select a {
/* 	display : inline-block;  */
	padding-left : 10px;
	border-left : 1px solid gainsboro;
	height : 22px;
	color : black;
	text-decoration: none;
}
.cart-inner {
	border-top : 1px solid black;
/* 	border-bottom : 1px solid gainsboro; */
	padding : 10px;
	height : auto;
}
.cart-inner .ul-cart-list {
	display : block;
	margin-bottom : 0px;
}
.cart-inner .ul-cart-list li {
	display : block;
	width : 300px;
 	clear : both;
	margin : 10px;
/* 	border : 1px solid black; */
}
.ul-cart-list li .item{
 	display : block; 
 	position: relative;
 	float : left; 
}
.check {
	display : block;
	position : absolute;
	top : 50px;
}
.ul-cart-list li .item input {
	display : block;
}
.img {
	display : block;
/* 	position : absolute; */
	left : 80px;
	margin : 10px 50px;
}
.ul-cart-list li .item a {
	display : block;
}
.ul-cart-list li .item img{
	display : inline-block;
	height : 100px;
	width : 100px;
}
.txt-span {
	display : block;
 	position : absolute; 
	top : 43px;
	left : 140px;
	width : 200px;
}
.txt-span a{
	text-decoration: none;
	color : DimGrey;
	font-weight: 600;
	font-size : 15px;
}
.txt-span span{
	display : inline-block;
}
.txt-span .span-title {
	position : absolute;
	left : 10px;
	margin-left : 20px;
}
.txt-span .span-price {
	position : absolute;
	left : 370px;
	width : auto;
}
.txt-span .span-price-won {
	position : relative;
 	left : 420px; 
 	float : left; 
/*  	margin-left : 10px; */
}
.div-btn {
	position : absolute;
	left : 400px;
	top : 43px;
	width : 100px;
}
.div-btn input{
	float : left;
	width : 40px;
	height : 26px;	
	border-top : 1px solid LightGray;
	border-bottom : 1px solid LightGray;
	border-left : 0px;
	border-right : 0px;
	text-align : center;
}
.div-btn button{
	float : left;
	border: solid 1.5px LightGray;
	width: 20px;
    height: 26px;
    text-align: center;
    color: #6ca435;
    font-weight: bold;
    font-size: 17px;
/* 	position : relative; */
/* 	bottom : 25px; */
}
.div-btn-delete {
	position: absolute;
    left: 600px;
    top: 43px;
    width: 100px;
}
.div-btn-delete .btnDelete {
	border : 0px;
	background-color: white;
	width: 20px;
    height: 26px;
    text-align: center;
    color: gainsboro;
}
.div-hidden {
	display : none;
}

.txt {
	padding : 120px 0px;
}
.div-empty {
	margin-bottom : 130px;
}
.div-price {
	float : right;
/* 	border : 2px dashed green; */
/* 	display : block; */
	width : 30%;
	height : auto;
/* 	margin-left : 20px; */
	position : relative;
}
.inner-price {
	position : absolute;
	top : 32px;
	margin-left : 20px;
	width : 250px;
}
.price-amount {
	border : 1px solid gainsboro;
	padding : 10px;
	display: block;
	background-color : #fafafa;
}
.price-amount div {
	position : relative;
	display: block;
	overflow: hidden;
	margin-top : 10px;
}
.price-amount span {
	font-size : 14px;
}
.price-amount .span-tit {
	float : left;
}
.price-amount .span-won {
	float : right;
}
.amount-last {
	border-top : 1px solid gainsboro;
	padding-top : 15px;
	margin-top : 15px; /* ?? 왜 안 됨 ?? */
}
.btn-submit button {
	position : relative;
	top : 220px;
	margin-left : 20px;
	height : 50px;
	width : 250px;
	background-color : gainsboro;
	cursor : default;
	color : white;
	font-weight : bold;
	border : 0px;
	border-radius: 4px;
}
.notice {
	margin-top : 30px;
	display : block;
	position : relative;
 	top : 220px;
	float : right;
	width : 250px;
	padding-right : 5px;
}
.notice-txt {
 	display : block;
/* 	position : relative; */
/* 	top : 250px; */
/* 	width : 250px; */
	font-size: 12px;
}
</style>

<div class="container-fluid">
	
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6 div-cart">
			<strong>장바구니</strong>
			<div class="div-cart-list">
				<div class="cart-inner-select">
					<input type="checkbox" onchange="javascript:checkSelectAll(this);">
					<label>전체선택 ( <span>0</span> / <span>0</span> )</label>
					<a href="#" onclick="javascript:deleteSelected(this);">선택삭제</a>
				</div>
				<div class="cart-inner">
					<p class="txt">장바구니에 담긴 상품이 없습니다</p>
					<ul class="ul-cart-list">
						<c:forEach var="cartDto" items="${cartList}" varStatus="i">
						<c:forEach var="img" items="${imgList}" varStatus="j">
						<c:if test="${i.index == j.index}">
						<li>
							<div class="item">
								<div class="check">
									<input type="checkbox" class="selected" onchange="javascript:checkSelect(this);">
								</div>
								<div class="img">
									<a href="/product/detail/${cartDto.product_code}"><img src="${img}"></a>
								</div>
								<div class="div-btn">
									<button type="button" class="btnDown" onclick="javascript:btnCountDown(this);">-</button>
									<input type="text" size="2" class="productCount" value="${cartDto.cart_quantity}" readonly="readonly"/>
									<button type="button" class="btnUp" onclick="javascript:btnCountUp(this);">+</button>
								</div>
								<div class="txt-span">
									<a href="/product/detail/${cartDto.product_code}">
										<span class="span-title">${cartDto.product_title}</span>
									</a>
									<span class="span-price" data-price="${cartDto.product_price}" data-price-ori="${cartDto.product_price}"
										data-sale="${cartDto.product_sale_rate}">${cartDto.product_price}</span>
									<span class="span-price-won">원</span>
								</div>
								<div class="div-btn-delete">
									<button type="button" class="btnDelete" data-cartNo="${cartDto.cart_no}"
										onclick="javascript:deleteOne(this);">X</button>
								</div>
								<div class="div-hidden" data-cartNo="${cartDto.cart_no}" data-productCode="${cartDto.product_code}"></div>
							</div>
						</li>
						</c:if>
						</c:forEach>
						</c:forEach>
					</ul>
				</div>
				<div class="div-empty"></div>
			</div>
			<div class="div-price">
				<div class="inner-price">
					<div class="price-amount">
						<div>
							<span class="span-tit">상품금액</span>
							<span class="span-won">
								<span class="total-price">0</span>
								<span>원</span>
							</span>
						</div>
						<div>
							<span class="span-tit">상품할인금액</span>
							<span class="span-won">
								<span class="total-sale">0</span>
								<span>원</span>
							</span>
						</div>
						<div>
							<span class="span-tit">배송비</span>
							<span class="span-won">+ 3,000 원</span>
						</div>
						<p>ddd</p> 배송비 안내?
						<div class="amount-last">
							<span class="span-tit">결제예정금액</span>
							<span class="span-won">
								<span class="final-price">0</span>
								<span>원</span>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="btn-submit">
				<form action="#">
					<input value="gg">
				</form>
				<button type="submit" id="btnPay" onclick="">구매하기</button>
			</div>
			<div class="notice">
				<span class="notice-txt">· ‘입금확인’ 상태일 때는 주문 내역 상세에서 직접 주문취소가 가능합니다.</span>
				<span class="notice-txt">· ‘입금확인’ 이후 상태에는 고객센터로 문의해주세요.</span>
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>
	
</div>

<script src="/resources/js/myScript.js"></script>
<script>

</script>
</body>
</html>
<%@include file="../include/footer.jsp"%>