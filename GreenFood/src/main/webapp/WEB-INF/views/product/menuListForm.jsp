<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style>
.container-fluid {
	padding-top : 180px;
}
.row {
/* 	border-top : 1px dashed red; */
/* 	border-bottom : 1px dashed blue; */
	margin-bottom : 30px;
}
.productList {
	height : 100%;
/* 	background-color : #f7f7f7; */
/* 	border-right : dotted 3px green; */
/* 	border-left : dotted 3px green; */
	text-align: center;
	padding : 0px 15px;
/* 	padding-top : 180px; */
}
.list {
	text-align: center;
}
.list li {
	display : inline-block;
	float : left;
	padding : 1px;
	margin : 10px;
	bottom : 60px;
	position : relative;
/* 	border : solid Coral 1px; */
}
.item {
/* 	border : solid LimeGreen 1px; */
}
.item a {
	text-decoration: none;
	color : black;
}
.item-thumb {
	height : 280px;
	display : block;
}
.item-thumb img {
	display : block;
	width : 280px;
	height : 280px;
 	border : solid 1px LightGray; 
}
.item-thumb .span-sale {
	display : inline-block;
	background-color : green;
	opacity : 0.7;
	position : relative;
    top: 60px;
    width: 60px;
    height: 60px;
    float : left;
}
.span-sale span {
	display : block;
	text-align : left;
	padding-left : 10px;
	padding-top : 2px;
}
.span-sale .span-ratio {
	font-size : 18px;
	font-weight : bold;
/* 	opacity : 1.0; */
}
/* .span-sale .span-percentage { */
/* 	clear : both; */
/* } */
/* .item-thumb .group-btn {
	display : block;
 	position : relative;
	bottom : 50px;
	left : 193px;
    width : 40px;
    height : 40px;
    border : 1px solid red;
} */
.item-title {
	display : block;
	padding-left : 0px;
	margin-top : 60px;
}
.item-title span {
	display : block;
	text-align : left;
	padding : 2px;
	font-weight : bold;
}
.item-title .span-3 {
	font-size : 13px;
}
.item-title .span-title {
	font-size : 18px;
	font-weight : bold;
}
.item-title .span-price {
	color: Tomato;
}

.div-search {
	display : none;
	margin : 30px;
	padding : 20px 0px;
/* 	border-top : 1px solid gainsboro; */
/* 	border-bottom : 1px solid gainsboro; */
 	text-align : center; 
	color : darkgray;
}
.div-search span{
 	margin-left : 30px;
	padding : 5px 30px;
/* 	border-top : 1px solid gainsboro; */
	border-bottom : 1px solid gainsboro;
	text-align : center;
	color : darkgray;
}

</style>

<div class="container-fluid">

<%-- 	${productCategoryList} --%>
<%-- 	${productImageList} --%>
	
<!-- 	<div class="row"> -->
<!-- 		<div class="col-md-2"></div> -->
<!-- 		<div class="col-md-8"> -->
<!-- 			<p>메뉴 보여주기</p> -->
<!-- 		</div> -->
<!-- 		<div class="col-md-2"></div> -->
<!-- 	</div> -->
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="div-search">
<!-- 				<h3>상품 검색</h3> -->
				<strong>검색 조건 : <span>${searchTitle}</span></strong>
			</div>
			<div class="productList">
				<div>
					<ul class="list">
						<c:forEach var="productVo" items="${productList}">
						<c:forEach var="imageDto" items="${productImageList}">
						<c:if test="${productVo.product_code == imageDto.product_code}">
						<li>
							<div class="item">
								<div class="item-thumb">
									<span class="span-sale"
									<c:if test="${productVo.product_sale_rate == 0}">
										style="opacity : 0;"
									</c:if>
									>
										<span class="span-sale-title">save</span>
										<span class="span-ratio">${productVo.product_sale_rate} %</span>
									</span>
									<a href="/product/detail/${productVo.product_code}">
										<img class="img-thumb" src="${path}/resources/images/item.png" 
											data-img="${imageDto.image_info_file_name}" 
											data-category="${productVo.product_category}">
									</a>
<!-- 									<div class="group-btn"><button></button></div> -->
								</div>
								<a class="item-title" href="/product/detail/${productVo.product_code}">
									<span class="span-title">${productVo.product_title}</span>
									<span class="span-price">${productVo.product_price}</span>
<!-- 									<span class="span-3">3.간단 설명</span> -->
								</a>
							</div>
						</li>
						</c:if>
						</c:forEach>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>

</div>

<script src="/resources/js/myScript.js"></script>
<script type="text/javascript">
$(function() {
	
	/* 상품명 전체 검색 -> 결과 메시지 */
	var msgResult = "${msgResult}";
	if (msgResult == "noList") {
// 		$(".div-search > strong").empty();
		alert("검색 결과가 없습니다. 다시 검색해 주세요.");
		$(".div-search").show();
		$(".div-search > strong").text("검색 결과가 없습니다. 다시 검색해 주세요.")
	} else if (msgResult == "isList") {
// 		alert("비슷한 제품을 찾았습니다.");
		$(".div-search").show();
	}
	
	/* s3에서 이미지 받아오기 */
	$(".img-thumb").each(function() {
		var thisImg = $(this);
		var fileName = thisImg.attr("data-img");
		var category = thisImg.attr("data-category");

		var url = "/upload/getImageUrl";
		var sendData = {
			"fileName" : fileName,
			"category" : category
		};
		$.post(url, sendData, function(data) {
			thisImg.attr("src", data);
		});
	});
	
	/* 가격에 , 적용하기 */
	$(".span-price").each(function() {
		var price = $(this).text();
// 		console.log(price);
		$(this).text(addComma(price));
	});
	
	/* 간격 조절 */
	$(".list > li").each(function() {
		if ($(this).index() > 3) {
			$(this).css("bottom", "120px");
		}
	});
	
});
</script>
</body>
</html>

<%@include file="../include/footer.jsp" %>