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
#btnAdd {
	position : absolute;
	left : 553px;
}
#btnBefore {
	float : left;
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
					<!-- 맨 처음은 카테고리 1번, 변화 생기면 value 변경 -->
					<input type="hidden" name="product_category" value="2001">
					<select id="category" onchange="javascript:addCategory(this);">
						<c:forEach var="cate" items="${categoryList}">
						<option value="${cate.product_category}">${cate.product_category_dsc}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label>상품 이름 :</label>
					<input type="text" class="input-add" name="product_title"
						placeholder="필수 사항입니다." required="required">
				</div>
				<div class="form-group">
					<label>가격 :</label>
					<input type="number" class="input-add input-num" name="product_price"
						placeholder="필수 사항입니다." required="required">
				</div>
				<div class="form-group">
					<label>간단한 설명 :</label>
					<input type="text" class="input-add" name="product_sub_title"
						placeholder="필수 사항입니다." required="required">
				</div>
				<div class="form-group div-textarea">
					<label>자세한 설명 :</label>
					<textarea name="product_content" id="product_content" 
						placeholder="필수 사항입니다." required="required"></textarea>
				</div>
				<div class="form-group">
					<label>유통기한 :</label>
					<input type="number" class="input-add input-num" name="shelfLife"
						placeholder="입력 X     or     판매 페이지에 [유통기한 : ?일] 표현">
				</div>
				<div class="form-group">
					<label>무게 :</label>
					<input type="text" class="input-add" name="product_weight"
						placeholder="필수 사항입니다." required="required">
				</div>
				<div class="form-group">
					<label>판매 단위 :</label>
					<input type="text" class="input-add" name="product_sales_unit"
						placeholder="필수 사항입니다." required="required">
				</div>
				<div class="form-group">
					<label>원산지 :</label>
					<input type="text" class="input-add" name="product_origin"
						placeholder="필수 사항입니다." required="required">
				</div>
				<div class="form-group">
					<label>할인율 :</label>
					<input type="number" class="input-add input-num" name="saleRate"
						placeholder="할인 없음 : 입력 X     or     최대 30%">
				</div>
				<div class="form-group">
					<label>판매 기한 :</label>
					<input type="number" class="input-add input-num" name="salesDeadlines"
						placeholder="상시 판매 : 입력 X     or     금일부터 ?일 뒤까지 판매 가능">
				</div>
				
				<div class="form-group">
					<label>썸네일 :</label>
					<input type="file" class="input-add" name="file" accept="image/*" required="required">
				</div>
				<div class="form-group">
					<label>디테일 사진 :</label>
					<input type="file" class="input-add" name="file2" accept="image/*" required="required">
				</div>
				
				<button type="button" class="btn btn-outline-info btn-sm" id="btnBefore"
						onclick="javascript:goBefore(this);">상품 관리</button>
						
				<button type="button" class="btn btn-outline-success btn-sm" id="btnAdd"
					onclick="javascript:addCheck(this);">상품 등록</button>
			</form>
		</div>
		
		<div class="col-md-3"></div>
	</div>
</div>
<script src="/resources/js/myScript.js"></script>
<script>
$(function(){

	/* 상품 등록 성공 여부 알림 */
	var resultMsg = "${resultMsg}";
	if (resultMsg == "add_success") {
		alert("상품 등록이 완료되었습니다.")
	} else if (resultMsg == "add_fail") {
		alert("상품 등록이 실패했습니다. 다시 등록해 주세요.")
	}
	
});

/* 상품관리로 이동 */
function goBefore(obj) {
	location.href = "/admin/productSearchList?searchAnd=date&searchWhere=all&searchBy=desc&searchWhat=&page=1";
}

/* 카테고리 데이터 저장 */
function addCategory(obj) {
	var category = $(obj).val();
	$(obj).prev().val(category);
}

/* 상품 등록 전에 확인!! */
function addCheck(obj) {
	var saleResult = checkSaleRate();
	console.log(saleResult);
	addNum();
	if (saleResult == "ok") {
		$("#frmProductAdd").submit();
	}
}

/* 할인율 */
function checkSaleRate() {
	var saleRate = $("#product_sale_rate").val();
	if (saleRate >= 100) {
		$("#product_sale_rate").val(0);
		alert("할인율은 30%를 넘길 수 없습니다.");
		return "not";
	}
	return "ok";
}

/* input-num 값 임시로 0 */
function addNum() {
	$(".input-num").each(function() {
		var val = $(this).val();
		if (val == "" || val == null) {
			$(this).val(0);
		}
	});
}

</script>

</body>
</html>
<%@include file="../include/footer.jsp"%>