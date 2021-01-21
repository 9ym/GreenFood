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
#btnDetail {
	float : left;
}
.div-btn {
	position : absolute;
	left : 390px;
}
#btnUpdateFinish, .img-input input, #category {
	display : none;
}
#category {
	top : 90px;
}
input[readonly], textarea[readonly] {
    background-color: WhiteSmoke;
}
.img-product {
	height : 200px;
	width : 200px;
	position : absolute;
	border : 1px solid gainsboro;
}
#img-info {
	left : 650px;
	top : 88px;
}
#img-content {
	left : 650px;
	top : 380px;
}
.img-input {
	position : absolute;
	left : 650px;
	top : 380px;
}
.img-input-info {
	top : 300px;
}
.img-input-info input{
	left : 65px;
}
.img-input-content {
	top : 590px;
}
.img-input-content input{
	left : 100px;
}


</style>

</head>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		
		<div class="col-md-6">
			<h3>${productVo.product_code}번 상품 - 수정</h3><br/><br/>
			
			<form role="form" id="frmProductAdd" action="/upload/productAdd" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label>카테고리 :</label>
					<!-- 맨 처음은 카테고리 1번, 변화 생기면 value 변경 -->
					<input type="text" class="input-add" name="product_category" id="product_category"
						<c:forEach var="cate" items="${categoryList}">
						<c:if test="${productVo.product_category == cate.product_category}">
							value="${cate.product_category_dsc}"
						</c:if>
						</c:forEach>
						data-category="${productVo.product_category}" readonly="readonly">
					<select id="category" onchange="javascript:addCategory(this);">
						<c:forEach var="cate" items="${categoryList}">
						<option value="${cate.product_category}">${cate.product_category_dsc}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label>상품 이름 :</label>
					<input type="text" class="input-add" name="product_title" 
						value="${productVo.product_title}" readonly="readonly" required="required">
				</div>
				<div class="form-group">
					<label>가격 :</label>
					<input type="number" class="input-add input-num" name="product_price" 
						value="${productVo.product_price}" readonly="readonly" required="required">
				</div>
				<div class="form-group">
					<label>간단한 설명 :</label>
					<input type="text" class="input-add" name="product_sub_title" 
						value="${productVo.product_sub_title}" readonly="readonly" required="required">
				</div>
				<div class="form-group div-textarea">
					<label>자세한 설명 :</label>
					<textarea name="product_content" id="product_content" class="input-add"
						readonly="readonly" required="required">${productVo.product_content}</textarea>
				</div>
				<div class="form-group">
					<label>유통기한 :</label>
					<input type="text" value="${productVo.product_shelf_life}"/>
					<input type="number" class="input-add input-num" name="shelfLife" 
						placeholder="입력 X     or     판매 페이지에 [유통기한 : ?일] 표현">
				</div>
				<div class="form-group">
					<label>무게 :</label>
					<input type="text" class="input-add" name="product_weight"
						value="${productVo.product_weight}" readonly="readonly" required="required">
				</div>
				<div class="form-group">
					<label>판매 단위 :</label>
					<input type="text" class="input-add" name="product_sales_unit"
						value="${productVo.product_sales_unit}" readonly="readonly" required="required">
				</div>
				<div class="form-group">
					<label>원산지 :</label>
					<input type="text" class="input-add" name="product_origin"
						value="${productVo.product_origin}" readonly="readonly" required="required">
				</div>
				<div class="form-group">
					<label>할인율 :</label>
					<input type="text" value="${productVo.product_sale_rate}"/>
					<input type="number" class="input-add input-num" name="saleRate"
						placeholder="할인 없음 : 입력 X     or     최대 30%">
				</div>
				<div class="form-group">
					<label>판매 기한 :</label>
					<input type="text" value="${productVo.product_sales_deadlines}"/>
					<input type="number" class="input-add input-num" name="salesDeadlines"
						placeholder="상시 판매 : 입력 X     or     금일부터 ?일 뒤까지 판매 가능">
				</div>
				
				<div class="form-group img-input img-input-info">
					<label>썸네일 :</label>
					<input type="file" class="input-add" name="file" accept="image/*" required="required">
				</div>
				<div class="form-group img-input img-input-content">
					<label>디테일 사진 :</label>
					<input type="file" class="input-add" name="file2" accept="image/*" required="required">
				</div>
				
				<img class="img-product" id="img-info" src="/resources/images/item.png"
					data-img="${imageDto.image_info_file_name}" data-category="${productVo.product_category}">
				<img class="img-product" id="img-content" src="/resources/images/item.png"
					data-img="${imageDto.image_content_file_name}" data-category="${productVo.product_category}">
				
				<button type="button" class="btn btn-outline-success btn-sm" id="btnDetail"
						onclick="javascript:goDetail(this);">상품 페이지</button>
				
				<div class="div-btn">
					<button type="button" class="btn btn-outline-info btn-sm"
						onclick="javascript:goBefore(this);">상품 관리</button>
					<button type="button" class="btn btn-outline-danger btn-sm"
						onclick="javascript:endProductChange(this);" id="btnEnd" 
						data-code="${productVo.product_code}">판매 종료</button>
					<button type="button" class="btn btn-outline-warning btn-sm"
						onclick="javascript:updateShow(this);" id="btnUpdate">상품 수정</button>
					<button type="button" class="btn btn-warning btn-sm"
						onclick="javascript:addCheck(this);" id="btnUpdateFinish">수정 완료</button>
				</div>
			</form>
		</div>
		
		<div class="col-md-3"></div>
	</div>
</div>
<script src="/resources/js/myScript.js"></script>
<script>
$(function(){

	/* 상품 등록 성공 여부 알림 */
// 	var resultMsg = "${resultMsg}";
// 	if (resultMag == "add_success") {
// 		alert("상품 등록이 완료되었습니다.")
// 	} else if (resultMsg == "add_fail") {
// 		alert("상품 등록이 실패했습니다. 다시 등록해 주세요.")
// 	}

	/* amazon s3 이미지 불러오기 */
	$(".img-product").each(function() {
		var thisImg = $(this);
		var fileName = thisImg.attr("data-img");
		var category = thisImg.attr("data-category");
		var sendData = {
				"fileName" : fileName,
				"category" : category
		};
		var url = "/upload/getImageUrl";
		$.post(url, sendData, function(data) {
// 			console.log(data);
			thisImg.attr("src", data);
		});
	});
	
	
});

/* 상품 페이지로 이동 */
function goDetail(obj) {
	location.href = "/product/detail/${productVo.product_code}";
}

/* 상품관리로 이동 */
function goBefore(obj) {
	location.href = "/admin/productSearchList?searchAnd=date&searchWhere=all&searchBy=desc&searchWhat=&page=1";
}

/* 수정 가능 */
function updateShow(obj) {
	$(".input-add").each(function() {
		var readOnly = $(this).prop("readonly");
		console.log(readOnly);
		if (readOnly) {
			$(this).prop("readonly", false);
		}
	});
	$(obj).hide();
	$("#btnUpdateFinish").show();
	$(".img-input > input").show();
	$("#product_category").attr("type", "hidden");
	$("#category").show();
}

/* 상품 등록 전에 확인!! */
function addCheck(obj) {
	var saleResult = checkSaleRate();
	console.log(saleResult);
	addNum();
	if (saleResult == "ok") {
// 		$("#frmProductAdd").submit();
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

/* 카테고리 데이터 저장 */
function addCategory(obj) {
	var category = $(obj).val();
	$(obj).prev().val(category);
}

/* input-num 값 임시로 0 */
function addNum() {
	$(".input-num").each(function() {
		var val = $(this).val();
// 		console.log(val);
		if (val == "" || val == null) {
// 			console.log($(this));
			$(this).val(0);
		}
	});
}

/* 판매 종료 변경 */
function endProductChange(obj) {
	var countEnd = "${countEnd}";
	console.log(countEnd);
	if (countEnd == 1) {
		endProduct(obj);
	} else {
		
	}
}

function gg() {
	
}

/* 판매 종료 - 비동기 */
function endProduct(obj) {
	var wantEnd = confirm("정말 해당 상품의 판매 기한을 종료할 것입니까?");
	if (wantEnd) {
		var url = "/admin/endProduct";
		var listEnd = []; // 배열
		listEnd.push($(obj).attr("data-code"));
		console.log(listEnd);
		var sendData = {
			"listEnd" : listEnd	
		};
		$.post(url, sendData, function(data) {
			if (data == "end_success") {
				alert("해당 상품의 판매 기한이 종료되었습니다.");
			} else {
				alert("판매가 종료되지 않았습니다. 조금 뒤에 다시 시도해 주세요");
			}
			$("#frmSearch").submit(); // 페이지 새로고침
		});
	}
}

</script>

</body>
</html>
<%@include file="../include/footer.jsp"%>