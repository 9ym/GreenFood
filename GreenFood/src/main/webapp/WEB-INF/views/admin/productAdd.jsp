<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Center</title>

<style> 
.container-fluid {
	margin-top: 170px;
}
div {
    display: block; 
}
.input-add, select, textarea {
	position : absolute;
	left : 130px;
}
.input-add {
	width : 500px;
}
.div-textarea {
	margin-bottom : 185px;
}
textarea {
	width : 500px;
	height : 200px;
}
button {
	position : absolute;
	left : 553px;
}

</style>

</head>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		
		<div class="col-md-6">
			<h3>상품 등록</h3><br/><br/>
			
			<form role="form" id="frmProductAdd" action="/upload/productAdd" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label>카테고리 :</label>
					<input type="hidden" name="product_category" value="2001">
					<select id="category">
						<c:forEach var="cate" items="${categoryList}">
						<option value="${cate.product_category}">${cate.product_category_dsc}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label>상품 이름 :</label>
					<input type="text" class="input-add" name="product_title" id="product_title" 
						placeholder="필수 사항입니다." required="required">
				</div>
				<div class="form-group">
					<label>가격 :</label>
					<input type="number" class="input-add" name="product_price" id="product_price" 
						placeholder="필수 사항입니다." required="required">
				</div>
				<div class="form-group">
					<label>간단한 설명 :</label>
					<input type="text" class="input-add" name="product_sub_title" id="product_sub_title" 
						placeholder="필수 사항입니다." required="required">
				</div>
				<div class="form-group">
					<label>썸네일 :</label>
					<input type="file" class="input-add" id="file" name="file" accept="image/*" required="required">
				</div>
				<div class="form-group div-textarea">
					<label>자세한 설명 :</label>
<!-- 					<input type="text" name="product_content"><br/> -->
<!-- 					<textarea name="product_content" id="product_content"  -->
<!-- 						placeholder="필수 사항입니다." required="required"></textarea> -->
					<input name="product_content" id="product_content" 
						placeholder="필수 사항입니다." required="required">
				</div>
				<div class="form-group">
					<label>디테일 사진 :</label>
					<input type="file" class="input-add" id="file2" name="file2" accept="image/*" required="required">
				</div>
				<div class="form-group">
					<label>유통기한 :</label>
					<input type="number" class="input-add" name="product_shelf_life" id="product_shelf_life"
						placeholder="판매 페이지에 [페이지에 유통기한 : ?일] 표현">
				</div>
				<div class="form-group">
					<label>무게 :</label>
					<input type="text" class="input-add" name="product_weight" id="product_weight" 
						placeholder="필수 사항입니다." required="required">
				</div>
				<div class="form-group">
					<label>판매 단위 :</label>
					<input type="text" class="input-add" name="product_sales_unit" id="product_sales_unit" 
						placeholder="필수 사항입니다." required="required">
				</div>
				<div class="form-group">
					<label>원산지 :</label>
					<input type="text" class="input-add" name="product_origin" id="product_origin" 
						placeholder="필수 사항입니다." required="required">
				</div>
				<div class="form-group">
					<label>할인율 :</label>
					<input type="number" class="input-add" name="product_sale_rate" id="product_sale_rate"
						placeholder="최대 99%까지 가능합니다.">
				</div>
				<div class="form-group">
					<label>판매 기한 :</label>
					<input type="number" class="input-add" name="product_sales_deadlines" id="product_sales_deadlines"
						placeholder="상시 판매 : 입력 X / 등록 날짜부터 ?일 뒤까지 판매 가능">
				</div>
				
				<button type="button" class="btn btn-outline-success btn-sm"
					onclick="javascript:addCheck(this);">상품 등록</button>
			</form>
		</div>
		
		<div class="col-md-3"></div>
	</div>
</div>
<script src="/resources/js/myScript.js"></script>
<script>
$(function(){
	/* 가격에 , 추가 */
	var price = $("#product_price").val();
	if (price != 0) {
		$("#product_price").val(addComma(price));
	}
	
});

/* 상품 등록 전에 확인 */
function addCheck(obj) {
	var saleResult = checkSaleRate();
	console.log(saleResult);
	if (saleResult == "ok") {
		$("#frmProductAdd").submit();
	}
}

/* 할인율 */
function checkSaleRate() {
	var saleRate = $("#product_sale_rate").val();
	if (saleRate >= 100) {
		$("#product_sale_rate").val(0);
		alert("할인율은 100을 넘길 수 없습니다.");
		return "not";
	}
	return "ok";
}


</script>

</body>
</html>
<%@include file="../include/footer.jsp"%>