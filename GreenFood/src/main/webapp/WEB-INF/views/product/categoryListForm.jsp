<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style>
.container-fluid {
	padding-top : 180px;
}
.row {
	margin-bottom : 30px;
}
.productList {
	height : 100%;
	text-align: center;
	padding : 0px 15px;
}
.list {
	text-align: center;
}
.list li {
	display : inline-block;
	float : left;
	padding : 1px;
	margin : 10px;
}
.item {
}
.item a {
	text-decoration: none;
	color : black;
}
.item-thumb {
	height : 280px;
}
.item-thumb img {
	width : 280px;
	height : 280px;
 	border : solid 1px LightGray; 
}

.item-title {
	display : block;
	padding-left : 0px;
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

</style>

<div class="container-fluid">
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="productList">
				<div>
					<ul class="list">
						<c:forEach var="productVo" items="${productList}">
						<c:forEach var="imageDto" items="${productImageList}">
						<c:if test="${productVo.product_code == imageDto.product_code}">
						<li>
							<div class="item">
								<div class="item-thumb">
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
	
});
</script>
</body>
</html>

<%@include file="../include/footer.jsp" %>