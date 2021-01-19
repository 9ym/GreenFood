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

.div-title {
/* 	display: block; */
	margin-bottom : 80px;
}
.div-title h2 {
	margin-bottom : 20px;
}

.div-select {
	float : right;
}
.div-btn {
	float : left;
}
#btnProduct {
/* 	margin-bottom : 20px; */
}
#btnSearch {
 	margin-bottom : 2px;
}

.page-link {
    position: relative;
    display: block;
    padding: .5rem .75rem;
    margin-left: -1px;
    line-height: 1.25;
    color: #7f8284;
    font-size: 13px;
    background-color: #fff;
    border: 1px solid #dee2e6;
}
.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: #5AB63F;
    border-color: #5AB63F;
}
.page-link:hover {
    z-index: 2;
    color: #fff;
    text-decoration: none;
    background-color: gainsboro;
}

</style>

<script>
$(function(){
	
	// 페이지네이션 - 페이지 번호 클릭했을때
	$("a.page-link").click(function(e){
		e.preventDefault();
		var page = $(this).attr("data-page");
		console.log(page);
		$("#frmReviewPaging").find("input[name=page]").val(page);
		$("#frmReviewPaging").submit();
	});
	
});

function insertProduct(obj) {
	location.href="/upload/fileInputTest";
}

/* 상품 전체 선택 */
function checkSelectAll(obj) {
	if ($(obj).prop("checked")) {
		$(".input-checked").prop("checked", true);
	} else {
		$(".input-checked").prop("checked", false);
	}
}

/* 상품 각각 선택 */
function checkSelect(obj) {
	var allCount = $(".input-checked").length;
	var checkedCount = $(".input-checked:checked").length;
	if (checkedCount != allCount) {
		$("#inputCheckAll").prop("checked", false); // 전체 선택 해제
	} else {
		$("#inputCheckAll").prop("checked", true); // 전체 선택
	}
}

/* 검색 */
function search(obj) {
	$(".search-select").each(function(index) {
		console.log(index + "-" + $(this).val());
		var name = $(this).attr("id");
		var val = $(this).val();
// 		var inputHidden = $("#frmSearch > input").clone();
// 		inputHidden.attr("name", name);
// 		inputHidden.attr("value", val);
// 		$("#frmSearch").append(inputHidden);
		if (index == 0) {
			$("#frmSearch").empty();
		}
		$("#frmSearch").append($('<input/>', {type: 'hidden', name: name, value: val}));
	});
	$("#frmSearch").submit();
}

</script>
</head>
<body>

<form id="frmSearch" method="get" action="/admin/productList">
</form>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		
		<div class="col-md-6">
			<div class="div-title">
				<h2 class="tit">상품 관리</h2>
				<div class="div-btn">
					<button type="button" id="btnProduct" class="btn btn-outline-success btn-sm" 
						onclick="javascript:insertProduct(this);">상품 등록</button>
					<button type="button" id="btnDelete" class="btn btn-outline-danger btn-sm">삭제</button>
				</div>
				<div class="div-select">
					<select id="searchAnd" class="search-select">
						<option value="date">등록된 날짜</option>
						<option value="new">신상품 (등록 2주)</option>
						<option value="sale">세일 상품 (기한 2주)</option>
						<option value="star">별점 랭킹</option>
						<option value="orderCount">판매량</option>
						<option value="end">판매 종료(판매 기한 끝)</option>
					</select>
					<select id="searchWhere" class="search-select">
						<option value="all">모든 상품</option>
						<c:forEach var="cate" items="${categoryList}">
							<option value="${cate.product_category}">- ${cate.product_category_dsc}</option>
						</c:forEach>
					</select>
					<select id="searchBy" class="search-select">
						<option value="desc">오름차순</option>
						<option value="asc">내림차순</option>
					</select>
					<input type="text" id="searchWhat" class="search-select">
					<button type="button" id="btnSearch" class="btn btn-outline-secondary btn-sm"
						onclick="javascript:search(this);">검색</button>
				</div>
			</div>

			<!-- 상품 목록 -->
			<table class="table">
				<thead>
					<tr>
						<th>
							<input type="checkbox" id="inputCheckAll" 
								onchange="javascript:checkSelectAll(this);">
						</th>
						<th>상품번호</th>
						<th>상품 카테고리</th>
						<th>상품 이름</th>
						<th>등록 날짜</th>
						<th>판매 기한</th>
						<th>할인율</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="productVo" items="${productListAll}">
					<c:forEach var="cate" items="${categoryList}">
					<c:if test="${productVo.product_category == cate.product_category}">
					<tr>
						<td>
							<input type="checkbox" class="input-checked"
								onchange="javascript:checkSelect(this);">
						</td>
						<td>${productVo.product_code}</td>
						<td>${cate.product_category_dsc}</td>
						<td>${productVo.product_title}</td>
						<td>${productVo.product_registrantion_date}</td>
						<td>${productVo.product_sales_deadlines}</td>
						<td>${productVo.product_sale_rate}</td>
					</tr>
					</c:if>
					</c:forEach>
					</c:forEach>
				</tbody>
			</table>
					
			<!-- pagination -->
			<div class="row">
				<div class="col-md-12 text-center">
					<nav>
						<ul class="pagination justify-content-center">
							<!-- 이전 -->
							<c:if test="${pagingDto.startPage != 1}">
								<li class="page-item"><a class="page-link" href="#"
									data-page="${pagingDto.startPage - 1}">이전</a></li>
							</c:if>
							<!-- 1 ~ 10 -->
							<c:forEach var="i" begin="${pagingDto.startPage}"
								end="${pagingDto.endPage}">
								<li
									<c:choose>
										<c:when test="${i == pagingDto.page}">
											class="page-item active"
										</c:when>
										<c:otherwise>
											class="page-item"
										</c:otherwise>
									</c:choose>>
									<a class="page-link" href="#" data-page="${i}">${i}</a></li>
							</c:forEach>
							<!-- 다음 -->
							<c:if test="${pagingDto.endPage < pagingDto.totalPage}">
								<li class="page-item"><a class="page-link" href="#"
									data-page="${pagingDto.endPage + 1}">다음</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
			<!--// pagination -->
		</div>
		<div class="col-md-3"></div>
	</div>
</div>

</body>
</html>