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
#btnUpdateFinish, .img-input input, #category, .input-update {
	display : none;
}
#category {
	top : 138px;
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
			<h3>${productVo.product_code}번 상품</h3><br/><br/>
			
			<form role="form" id="frmProductUpdate" action="/upload/productUpdate" method="post" enctype="multipart/form-data">
				<input type="hidden" name="product_code" value="${productVo.product_code}">
				<input type="hidden" name="shelfLifeStr" id="shelfLifeStr" value="updateNo">
				<input type="hidden" name="saleRateStr" id="saleRateStr" value="updateNo">
				<input type="hidden" name="salesDeadlinesStr" id="salesDeadlinesStr" value="updateNo">
				<input type="hidden" name="categoryOrigin" id="categoryOrigin" value="${productVo.product_category}">
				<input type="hidden" name="isImage" id="isImage" value="">
				<div class="form-group">
					<label>카테고리 :</label>
					<input type="text" class="input-add" name="productCategory" id="productCategory"
						<c:forEach var="cate" items="${categoryList}">
						<c:if test="${productVo.product_category == cate.product_category}">
							value="${cate.product_category_dsc}"
						</c:if>
						</c:forEach>
						data-category="${productVo.product_category}" readonly="readonly">
				</div>
				<div class="form-group">
					<label>카테고리 코드 :</label>
					<!-- 맨 처음은 카테고리 1번, 변화 생기면 value 변경 -->
					<input type="text" class="input-add" name="product_category" id="product_category"
						<c:forEach var="cate" items="${categoryList}">
						<c:if test="${productVo.product_category == cate.product_category}">
							placeholder="${cate.product_category_dsc}"
						</c:if>
						</c:forEach>
						value = "${productVo.product_category}"
						data-category="${productVo.product_category}" readonly="readonly">
					<select id="category" onchange="javascript:updateCategory(this);">
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
					<input type="text" class="input-add input-origin"
					<c:choose>
						<c:when test="${productVo.product_shelf_life != 0}">
							value="${productVo.product_shelf_life}일"
						</c:when>
						<c:otherwise>
							value="유통기한 없음"
						</c:otherwise>
					</c:choose>
						readonly="readonly" data-origin="${productVo.product_shelf_life}"/>
					<input type="number" class="input-add input-num input-update" name="shelfLife" id="shelfLife"
						placeholder="그대로 : 입력 X     or     판매 페이지에 [유통기한 : ?일] 표현">
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
					<input type="text" class="input-add input-origin"
					<c:choose>
						<c:when test="${productVo.product_sale_rate != 0}">
							value="${productVo.product_sale_rate}%"
						</c:when>
						<c:otherwise>
							value="할인 없음"
						</c:otherwise>
					</c:choose>
						readonly="readonly"  data-origin="${productVo.product_sale_rate}"/>
					<input type="number" class="input-add input-num input-update" name="saleRate" id="saleRate"
						placeholder="그대로 : 입력 X     or     최대 30%">
				</div>
				<div class="form-group">
					<label>판매 기한 :</label>
					<input type="text" class="input-add input-origin input-date" 
					<c:choose>
						<c:when test="${not empty productVo.product_sales_deadlines}">
							value="${productVo.product_sales_deadlines} 까지"
						</c:when>
						<c:otherwise>
							value="상시 판매"
						</c:otherwise>
					</c:choose>
						readonly="readonly"  data-origin="${productVo.product_sales_deadlines}"/>
					<input type="number" class="input-add input-num input-update" name="salesDeadlines" id="salesDeadlines"
						placeholder="그대로 : 입력 X     or     금일부터 ?일 뒤까지 판매 가능">
				</div>
				
				<div class="form-group img-input img-input-info">
					<label>썸네일 :</label>
					<input type="file" class="input-add" name="file" accept="image/*">
				</div>
				<div class="form-group img-input img-input-content">
					<label>디테일 사진 :</label>
					<input type="file" class="input-add" name="file2" accept="image/*">
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
						onclick="javascript:updateCheck(this);" id="btnUpdateFinish">수정 완료</button>
				</div>
			</form>
		</div>
		
		<div class="col-md-3"></div>
	</div>
</div>
<script src="/resources/js/myScript.js"></script>
<script>
$(function(){

	/* 상품 등록, 수정, ... 여부 알림 */
	var resultMsg = "${resultMsg}";
	switch (resultMsg) {
		case 'end_success':
			alert("판매 중지되었습니다.")
			break;
		case 'end_fail':
			alert("판매 중지가 실패했습니다. 다시 시도해 주세요.")
			break;
		case 'start_success':
			alert("판매 시작했습니다.")
			break;
		case 'start_fail':
			alert("판매 시작이 실패했습니다. 다시 시도해 주세요.")
			break;
		case 'update_product_success':
			alert("상품 수정을 성공했습니다.")
			break;
		case 'update_all_success':
			alert("상품과 이미지 수정을 성공했습니다.")
			break;
		case 'update_fail':
			alert("상품 수정을 실패했습니다. 다시 시도해 주세요.")
			break;
	}

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
	
	/* 판매 기한 종료 -> 알림 */
	var countEnd = "${countEnd}";
	if (countEnd == 0) {
		$("#btnEnd").text("상시 판매");
		$("#btnEnd").removeClass("btn-outline-danger");
		$("#btnEnd").addClass("btn-outline-primary");
		$("h3").append("<span> [판매 중지된 상품]</span>");
		$("h3 > span").css("color", "red");
	}
	
	/* 판매 기한 표현 */
	var diff = knowDiff();
	
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
	/* 버튼 교체 */
	$(obj).hide();
	$("#btnUpdateFinish").show();
	/* 파일 등록 버튼 */
	$(".img-input > input").show();
	/* 카테고리 변경 가능 */
	$("#product_category").attr("type", "hidden");
	$("#category").show();
	/* 추가 사항 변경 가능 */
	$(".input-origin").hide();
	$(".input-update").show();
}

/* 카테고리 데이터 저장 */
function updateCategory(obj) {
	var category = $(obj).val();
	$(obj).prev().val(category);
}

/* 상품 수정 전에 확인!! */
function updateCheck(obj) {
	var saleResult = checkSaleRate();
	console.log(saleResult);
	stayNum();
	if (saleResult == "ok") {
		/* 상품 이미지 수정 여부 확인 */
		var isImageResult = isImage();
		$("#isImage").val(isImageResult);
		$("#frmProductUpdate").submit();
	}
}

/* 할인율 */
function checkSaleRate() {
	var saleRate = $("#saleRate").val();
	if (saleRate >= 31) {
		$("#product_sale_rate").val(0);
		alert("할인율은 30%를 넘길 수 없습니다.");
		return "not";
	}
	return "ok";
}

/* input-num 값 유지 혹은 변경 */
function stayNum() {
	$(".input-num").each(function(index) {
		var valOrigin = $(this).prev().attr("data-origin");
		var val = $(this).val();
		console.log(index +"-origin-"+ valOrigin);
		console.log(index +"-this-"+ val);
		console.log($(this));
		/* 유통기한, 할인율 */
		if ((index > 0 && index < 3) && val.length == 0) {
			$(this).val(valOrigin);
		} else if ((index > 0 && index < 3) && val.length != 0) {
			$("input[type='hidden']").eq(index).val("updateYes");
		}
		/* 판매 기한 */
		if (index == 3 && val.length == 0) {
			var diff = knowDiff();
			console.log("diff :" + diff);
			if (diff != 0) {
				$(this).val(diff); // 판매 기한 O
			} else {
				$(this).val(0); // 판매 기한 X + updateNo
			}
		} else if (index == 3 && val.length != 0) {
			$("input[type='hidden']").eq(3).val("updateYes");
		}
	});
}

/* 판매 기한 표현 + 차이나는 기간  */
function knowDiff() {
	if ($(".input-date").val().trim() != "상시 판매") { // 판매 기한 O
		/* 판매 기한 날짜 */
		var date_str = $(".input-date").attr("data-origin");
		var dateDeadlines = new Date(date_str); 
		var year = dateDeadlines.getFullYear();
		var month = dateDeadlines.getMonth() + 1;
		var date = dateDeadlines.getDate();
		var hour = dateDeadlines.getHours();
		/* 현재 날짜 */			
		var dateNow = new Date();
		var hourNow = dateNow.getHours();
		/* 몇 일 차이 나나? */
		var diff = Math.abs(dateDeadlines.getTime() - dateNow.getTime());
	    diff = Math.floor(diff / (1000 * 3600 * 24));
	    
	    console.log("dateDeadlines.getTime() :" + dateDeadlines.getTime());
		console.log("dateNow.getTime() :" + dateNow.getTime());
		console.log("diff :" + (dateDeadlines.getTime() - dateNow.getTime()));
		console.log("diff :" + ((dateDeadlines.getTime() - dateNow.getTime()) / (1000 * 3600 * 24)));
		console.log("diff :" + Math.abs(dateDeadlines.getTime() - dateNow.getTime()));
		console.log("diff :" + diff);
		
		var dateShow = year +"년 "+ month +"월 "+ date + "일 " + hour;
		
		if (dateNow > dateDeadlines) {
			dateShow += "시 (오늘부터 " + diff + "일 전)";
		} else {
			dateShow += "시 (오늘부터 " + diff + "일 뒤)";
		}
	    
		/* 보여줄 문장 */
// 	    var dateShow = year +"년 "+ month +"월 "+ date + "일 " + hour + "시 (오늘부터 " + diff + "일 뒤)";
		console.log(dateShow);
		$(".input-date").val(dateShow);
		return diff;
	} else { // 판매 기한 X
		return 0;
	}
}

/* 판매 종료 변경 */
function endProductChange(obj) {
	var countEnd = "${countEnd}";
	console.log(countEnd);
	var product_code = $(obj).attr("data-code");
	if (countEnd == 1) {
		endProduct(product_code);
	} else {
		reStart(product_code);
	}
}

/* 다시 판매 */
function reStart(product_code) {
	// 판매 기한 아예 삭제하고 상시 판매 할 거임????
	var wantEnd = confirm("정말 해당 상품을 다시 판매할 것입니까?");
	if (wantEnd) {
		var url = "/admin/startProduct";
		var listEnd = []; // 배열
		var sendData = {
			"product_code" : product_code	
		};
		$.post(url, sendData, function(data) {
			console.log(data);
			if (data == "start_success") {
				alert("해당 상품을 다시 판매합니다.");
			} else {
				alert("판매가 시작되지 않았습니다. 조금 뒤에 다시 시도해 주세요");
			}
			location.reload(); // 페이지 새로고침
		});
	}
}

/* 판매 종료 - 비동기 */
function endProduct(product_code) {
	var wantEnd = confirm("정말 해당 상품의 판매 기한을 종료할 것입니까?");
	if (wantEnd) {
		var url = "/admin/endProduct";
		var listEnd = []; // 배열
		listEnd.push(product_code);
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
			location.reload(); // 페이지 새로고침
		});
	}
}

/* 이미지 파일 수정 여부 확인 */
function isImage() {
	var isImageInfo = "";
	var isImageContent = "";
	var isImageStr = "";
	var isImageResult = "isNull";
	$("input[type='file']").each(function(index) {
		var imageVal = $(this).val();
		if (index == 0 && (imageVal != null && imageVal != "")) {
			isImageInfo = "info";
		}
		if (index == 1 && (imageVal != null && imageVal != "")) {
			isImageContent = "content";
		}
	});
	isImageStr = isImageInfo + isImageContent;
	/* 카테고리 변화 O + 이미지 그대로 */
	var categoryOrigin = $("#categoryOrigin").val();
	var categoryUpdate = $("#product_category").val();
	console.log("categoryOrigin :" + categoryOrigin);
	console.log("categoryUpdate :" + categoryUpdate);
	if ((categoryOrigin != categoryUpdate) && (isImageResult == "isNull")) { // 카테고리 변경
		isImageResult = "changeCategory";
	}
	switch (isImageStr) {
	  case "info":
		isImageResult = "isInfo";
	    break;
	  case "content":
		isImageResult = "isContent";
	    break;
	  case "infocontent":
		isImageResult = "isAll";
	    break;
	}
	return isImageResult;
	console.log("isImageResult :" + isImageResult);
}

/*  */
function isUpdate() {
	
}

</script>

</body>
</html>
<%@include file="../include/footer.jsp"%>