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
}
.ul-cart-list li .item{
 	display : block; 
 	position: relative;
 	float : left; 
}
.ul-cart-list li .item input {
	display : block;
/* 	position : absolute; */
/* 	bottom : 50px; */
/* 	left : 30px; */
}
.ul-cart-list li .item a {
	display : block;
/* 	height : 100px; */
/* 	width : 100px; */
/* 	position : absolute; */
/* 	bottom : 50px; */
/* 	left : 30px; */
}
.ul-cart-list li .item img{
	display : block;
	height : 100px;
	width : 100px;
/* 	position : absolute; */
/* 	top : 50px; */
/* 	float : left; */
}
.txt {
	padding : 120px 0px;
}
.div-empty {
	margin-bottom : 150px;
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
	top : 250px;
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
 	top : 250px;
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
					<input type="checkbox">
					<label>전체선택 ( <span>0</span> / <span>0</span> )</label>
					<a>선택삭제</a>
				</div>
				<div class="cart-inner">
					<p class="txt">장바구니에 담긴 상품이 없습니다</p>
					<ul class="ul-cart-list">
						<c:forEach var="cartDto" items="${cartList}" varStatus="i">
						<c:forEach var="img" items="${imgList}" varStatus="j">
						<c:forEach var="vo" items="${productList}" varStatus="k">
						<c:if test="${cartDto.product_code == vo.product_code}">
						<c:if test="${i.index == j.index}">
						<li>
							<div class="item">
								<input type="checkbox">
								<a><img src="${img}"></a>
								<span>${vo.product_title}</span>
								<span>${vo.product_price}</span>
							</div>
						</li>
						</c:if>
						</c:if>
						</c:forEach>
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
							<span class="span-won">? 원</span>
						</div>
						<div>
							<span class="span-tit">상품할인금액</span>
							<span class="span-won">? 원</span>
						</div>
						<div>
							<span class="span-tit">배송비</span>
							<span class="span-won">? 원</span>
						</div>
						<p>ddd</p> <!-- 배송비 안내? -->
						<div class="amount-last">
							<span class="span-tit">결제예정금액</span>
							<span class="span-won">? 원</span>
						</div>
					</div>
				</div>
			</div>
			<div class="btn-submit">
				<button type="submit">구매하기</button>
			</div>
			<div class="notice">
				<span class="notice-txt">· ‘입금확인’ 상태일 때는 주문 내역 상세에서 직접 주문취소가 가능합니다.</span>
				<span class="notice-txt">· ‘입금확인’ 이후 상태에는 고객센터로 문의해주세요.</span>
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>
	
</div>

<script>
$(function() {
	if ("${cartList}" != "") {
		$(".cart-inner > p").hide();
	}
});
</script>
</body>
</html>
<%@include file="../include/footer.jsp"%>