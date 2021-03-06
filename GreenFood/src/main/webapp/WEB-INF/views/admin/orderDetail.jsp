<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/css_customerMyPage.css"/>
<style>
.container-fluid {
	padding-top : 150px;
}

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
	text-align : left;
	display : block;
	font-size : 22px;
	color : #6ca435;
	margin : 10px 0px 30px;
}
.div-pay {
	float : left;
/* 	border-bottom : 1px solid gainsboro; */
 	display : block; 
	width : 70%;
	height : auto;
}
.pay-inner {
/* 	border-top : 1px solid black; */
/*  	border-bottom : 1px solid gainsboro; */
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
/* 	border : 1px solid black; */
}
.ul-pay-list li .item{
 	display : block; 
 	position: relative;
 	float : left; 
}
.img {
	display : block;
/* 	position : absolute; */
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
/*  	margin-left : 10px; */
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
.price-amountt {
	border : 1px solid gainsboro;
	padding : 10px;
	display: block;
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
.price-amountt span {
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
.product-list span{
	color: #999;
	font-size: 18px;
}

.product-list span .span-title{
    position: absolute;
    left: 10px;
    margin-left: 20px;
}

.ul-pay-list li .imggg img{
    display: inline-block;
    height: 100px;
    width: 100px;
}

</style>
<script src="/resources/js/myScript.js"></script>
<script>
$(function(){
	
	/* 결제수단 addComma */
	var comma = $(".needComma");
	for(var i = 0; i < comma.length; i++){
		var text = $(".needComma").eq(i).text().trim();
		var textAddComma = addComma(text);
		$(".needComma").eq(i).text(textAddComma);
	}
	
	var total = $(".price-amountt > div > span").eq(1).text().trim();
	var total_price = addComma(total);
	$(".price-amountt > div > span").eq(1).text(total_price);
	
	/* 헤더 배경화면, 게시판 이름 바꾸는 부분 */
	/* url 뒤에 사진 넣으면됩니다. */
	$("#page_background").css({"background-image":"url('${path}/resources/images/login_dog.jpg')"});
	$("#page_background").css({"background-size":"100% 100%"});
	$("#page_background").css({"background-repeat":"no-repeat"});
	$("#boardNames").text("마이페이지");/* 게시판 이름 */
	
	
	$(".review_write").click(function(e){
		e.preventDefault();
		var p_code = $(this).attr("data-bno");
		
		location.href="/review/reviewWrite/" + p_code;
	});
});
</script>
<content>
<div class="container-fluid">

	<!--오른쪽 메뉴-->
	<div id="content_right" style="float:right; width:1000px;border-top:2px solid #6ca435;box-shadow:3px 3px 3px #c7c7c7;margin-bottom:200px;">
	
	<!-- 주문 상세 내역 -->
	<div class="container-fluidInner">
	<div class="row">
		<div class="col-md-12 div-cart">
			<div class="div-pay">
				<div class="pay-inner ">
					<strong>주문상세</strong>
					<div class="ul-pay-list product-list">
						<span>주문 번호</span><strong>${orderVo.order_code}</strong>	<span>주문 일자</span><strong>${orderVo.order_date}</strong>
					</div>
					<div>
						<!-- list -->
						<ul class="ul-pay-list product-list">
						<c:forEach var="productInfo" items="${productDetailInfo}" varStatus="i">
						<c:forEach var="img" items="${imgList}" varStatus="j">
						<c:if test="${i.index == j.index}">
							<li>
								<div align="left" class="imggg">
									<span>
										<c:choose>
											<c:when test="${productInfo.dead_line_count == 1}">
												<img src="${img}">
											</c:when>
											<c:otherwise>
												<a href="/product/detail/${productInfo.product_code}"><img src="${img}"></a>
											</c:otherwise>
										</c:choose>
									</span>
									<span>${productInfo.product_title}</span>
									<span>${productInfo.order_quantity}개</span>
									<span>${productInfo.product_price}원</span>
										<c:if test="${productInfo.dead_line_count == 1}">
											<span class="deadProduct">상품판매 종료된 제품입니다.</span>
										</c:if>
								</div>
							</li>
						</c:if>
						</c:forEach>
						</c:forEach>
						</ul>
						<!-- //list -->
					</div>
				</div>
				<div class="pay-inner">
					<strong>배송 정보</strong>
					<ul class="ul-pay-list">
						<li class="order-addr">${orderVo.order_addr1}</li>
						<li class="order-addr">${orderVo.order_addr2}</li>
						<li class="order-addr">${orderVo.order_addr3}</li>
						<li><span>받는 사람 : ${orderVo.user_id}</span></li>
					</ul>
				</div>

						<div class="pay-inner">
							<div class="row">
								<div class="col-md-6">
									<strong>결제 내용</strong>
									<div class="price-amount">
										<div>
											<span class="span-tit">상품금액</span> <span class="span-won">
												<span class="total-price needComma">
													${orderVo.order_origin_price}
												</span>
												<span>원</span>
											</span>
										</div>

										<div>
											<span class="span-tit">상품할인금액</span> <span class="span-won">
												<span class="total-sale needComma">
													<c:choose>
														<c:when test="${orderVo.order_sale_price != '0'}"> - ${orderVo.order_sale_price}
														</c:when>
														<c:otherwise>0</c:otherwise>
													</c:choose>
											</span> <span>원</span>
											</span>
										</div>

										<div>
											<span class="span-tit">포인트사용</span> <span class="span-won">
												<span class="total-point needComma">
													<c:choose>
														<c:when test="${orderVo.order_point_use != '0'}"> - ${orderVo.order_point_use}
														</c:when>
														<c:otherwise>0</c:otherwise>
													</c:choose>
												</span> <span>원</span>
											</span>
										</div>

										<div>
											<span class="span-tit">배송비</span> <span class="span-won">+
												3,000 원</span>
										</div>
										
										<div class="amount-last">
											<span class="span-tit">총결제금액</span> <span class="span-won">
												<span class="final-price needComma">${orderVo.order_total_price}</span> <span>원</span>
											</span>
										</div>
									</div>
								</div>

								<div class="col-md-6">
									<strong>결제 수단</strong>
									<div class="price-amountt">
										<div>
											<span>
											<c:if test="${orderVo.order_pay_method == 'card'}">
												신용카드
											</c:if>
											<c:if test="${orderVo.order_pay_method == 'transfer'}">
												즉시결제
											</c:if>
											<c:if test="${orderVo.order_pay_method == 'deposit'}">
												무통장입금
											</c:if>
											</span><br/>
											<span>${orderVo.order_total_price}</span>
										</div>
									</div>
								</div>

							</div>
						</div>

						<div class="pay-inner">
					
					
				</div>
				
				<div class="div-empty"></div>
			</div>
			
			
		</div>
	</div>
	</div>
	<!-- // 전체 주문 내역끝 -->
	</div>
</div>
</content>
