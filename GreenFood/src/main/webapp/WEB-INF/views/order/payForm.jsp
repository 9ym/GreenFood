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
	margin-bottom : 80px;
}
.div-cart strong {
	text-align : center;
	display : block;
	font-size : 22px;
	margin : 10px 0px 30px;
}
.div-pay {
	float : left;
 	display : block; 
	width : 70%;
	height : auto;
}
.pay-inner {
	padding : 10px;
	margin-bottom : 30px;
	height : auto;
}
.pay-inner strong {
	margin-bottom : 0px;
	font-size : 17px;
	text-align : left;
}
.pay-inner .ul-pay-list {
	border-top : 1px solid black;
 	border-bottom : 1px solid gainsboro;
	display : block;
	margin-bottom : 0px;
	padding : 20px;
	padding-left : 0px;
}
.pay-inner .product-list li {
	display : block;
 	clear : both;
	margin : 10px;
	text-align : center;
}
.pay-inner .ul-pay-list li {
	display : block;
 	clear : both;
	margin : 10px;
}
.ul-pay-list li .item{
 	display : block; 
 	position: relative;
 	float : left; 
}
.img {
	display : block;
	left : 80px;
	margin : 10px 50px;
}

.txt-span {
	display : block;
 	position : absolute; 
	top : 43px;
	left : 140px;
	width : 200px;
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
}

#btnFinalPay {
	margin-top : 50px;
}

.txt {
	padding : 120px 0px;
}
.div-empty {
	margin-bottom : 130px;
}
.div-price {
	float : right;
	width : 30%;
	height : auto;
	margin-top : 10px;
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
	font-size: 12px;
}
</style>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6 div-cart">
			<strong>결제</strong>
			<div class="div-pay">
				<div class="pay-inner ">
					<strong>주문정보</strong>
					<ul class="ul-pay-list product-list">
						<c:forEach var="cartDtoPay" items="${listCartPay}" varStatus="i">
						<li>
							<span>${cartDtoPay.product_title} 상품</span>
							<span>---</span>
							<span>${cartDtoPay.cart_quantity} 개</span>
							<input type="hidden" class="input-cartNo" value="${cartDtoPay.cart_no}">
						</li>
						</c:forEach>
					</ul>
				</div>
				
				<div class="pay-inner">
					<strong>배송 정보</strong>
					<ul class="ul-pay-list">
						<li class="order-addr">${customerVo.user_addr1}</li>
						<li class="order-addr">${customerVo.user_addr2}</li>
						<li class="order-addr">${customerVo.user_addr3}</li>
						<li><span>받는 사람 : </span>${customerVo.user_name}</li>
					</ul>
				</div>
				
				<div class="pay-inner">
					<strong>포인트 사용</strong>
					<ul class="ul-pay-list">
						<li>
							<input type="number" min="0" max="${customerVo.user_point}" value="0" id="inputPoint">
							<button id="btnPoint" onclick="javascript:usePoint(this);">포인트사용</button>
						</li>
						<li>
							<span>보유 포인트 : </span>
							<span class="needComma span-point" data-point="${customerVo.user_point}">${customerVo.user_point}</span>
							<span>원 내에서 사용할 수 있습니다.</span>
						</li>
					</ul>
				</div>
				
				<div class="pay-inner">
					<strong>결제수단</strong>
					<ul class="ul-pay-list">
						<li>
							<input type="radio" name="pay_meth" value="pay_card"><label>카드</label>
						</li>
						<li>
							<input type="radio" name="pay_meth" value="pay_transfer"><label>즉시이체</label>
						</li>
						<li>
							<input type="radio" name="pay_meth" value="pay_notYet"><label>무통장입금</label>
						</li>
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
								<span class="total-price needComma">${listPrices[0]}</span>
								<span>원</span>
							</span>
						</div>
						<div>
							<span class="span-tit">상품할인금액</span>
							<span class="span-won">
								<span class="total-sale needComma">
								<c:choose>
									<c:when test="${listPrices[1] != '0'}">- ${listPrices[1]}</c:when>
									<c:otherwise>0</c:otherwise>
								</c:choose>
								</span>
								<span>원</span>
							</span>
						</div>
						<div>
							<span class="span-tit">포인트사용</span>
							<span class="span-won">
								<span class="total-point needComma">0</span>
								<span>원</span>
							</span>
						</div>
						<div>
							<span class="span-tit">배송비</span>
							<span class="span-won">+ 3,000 원</span>
						</div>
						<div class="amount-last">
							<span class="span-tit">결제예정금액</span>
							<span class="span-won">
								<span class="final-price needComma">0</span>
								<span>원</span>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="btn-submit">
				<form action="/order/payCompleted">
					<button type="button" id="btnFinalPay" onclick="javascript:payFinal();">결제완료</button>
				</form>
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>
	
</div>

<script src="/resources/js/myScript.js"></script>
<script>
$(function() {
	
	/* , 추가 */
	$(".needComma").each(function() {
		var num = $(this).text();
		$(this).text(addComma(num));
	});
	
	finalPayPrice();
	
});

/* 포인트 사용 */
function usePoint(obj) {
	var pointUse = $("#inputPoint").val();
	var pointHave = parseInt($(".span-point").attr("data-point"));
	console.log("pointUse :" + pointUse);
	console.log("pointHave :" + pointHave);
	if (pointUse <= 0) {
		alert("1원부터 사용할 수 있습니다.")
	} else if (pointUse > 0 && pointUse <= pointHave) {
		var pointLeft = pointHave - pointUse;
		$(".total-point").text("- " + addComma(pointUse));
	} else if (pointUse > pointHave) {
		$("#inputPoint").val(0);
		$(".total-point").text(0);
		alert("보유한 포인트 안에서만 사용할 수 있습니다.");
	}
	finalPayPrice();
}

/* 최종가격 */
function finalPayPrice() {
	var totalPrice = subComma($(".total-price").text());
	var salePrice = subComma($(".total-sale").text().trim().substring(2));
	var finalPrice = totalPrice - salePrice;
	var pointUse = subComma($(".total-point").text().trim().substring(2));
	if (pointUse != 0) {
		finalPrice -= pointUse;
	}
	finalPrice += 3000; // 배송비
	$(".final-price").text(addComma(finalPrice));
}

/* 결제 완료 */
function payFinal() {
	var finalTotalPrice = parseInt(subComma($(".final-price").text()));
	var finalSalePrice = 0;
	if ($(".total-sale").text() != 0) {
		finalSalePrice = parseInt(subComma($(".total-sale").text().trim().substring(2)));
	}
	var finalPointUse = 0;
	if ($(".total-point").text() != 0) {
		finalPointUse = parseInt(subComma($(".total-point").text().trim().substring(2)));
	}
	var listCartPay = []; // 배열
	$(".input-cartNo").each(function() {
		listCartPay.push($(this).val());
	});
	var listAddr = []; // 배열
	$(".order-addr").each(function() {
		listAddr.push($(this).text());
	});
	var payResult = $("input[name='pay_meth']:checked").val();
	
	console.log(finalTotalPrice);
	console.log(finalSalePrice);
	console.log(finalPointUse);
	console.log(listCartPay);
	console.log(listAddr);
	console.log(payResult);
	
	var url = "/order/payCompleted";
	var sendData = {
			"finalTotalPrice" : finalTotalPrice,
			"finalSalePrice" : finalSalePrice,
			"finalPointUse" : finalPointUse,
			"listCartPay" : listCartPay,
			"listAddr" : listAddr,
			"payResult" : payResult
	};
	if (payResult != null) {
		$.post(url, sendData, function(data) {
			console.log(data);
			if (data == "pay_fail") {
				alert("결제가 실패했습니다. 다시 시도해 주세요.");
			} else {
				/* 마이페이지 - 주문상세 -> order_code 보내기 */
				location.href="/customer/customerDetailOrder/" + data;
			}
		});
	} else {
		/* 결제 수단 체크 하라고 알림 */
		alert("결제수단을 선택해 주세요.");
	}
}

</script>
</body>
</html>
<%@include file="../include/footer.jsp"%>