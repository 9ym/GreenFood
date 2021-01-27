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
td {
/* 	text-align : center; */
}
a {
	color : #6ca435;
}
label {
	margin-left : 10px;
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

</head>
<body>

<form id="frmSearch" method="get" action="/admin/productSearchList">
	<input type="hidden" name="searchAnd" value="${searchDto.searchAnd}"/>
	<input type="hidden" name="searchWhere" value="${searchDto.searchWhere}"/>
	<input type="hidden" name="searchBy" value="${searchDto.searchBy}"/>
	<input type="hidden" name="searchWhat" value="${searchDto.searchWhat}"/>
	<input type="hidden" name="page" value="${searchDto.page}"/>
</form>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		
		<div class="col-md-8">
			<div class="div-title">
				<h2 class="tit">상품 관리</h2>
				<div class="div-btn">
					<button type="button" id="btnProduct" class="btn btn-outline-success btn-sm" 
						onclick="javascript:insertProduct(this);">상품 등록</button>
					<button type="button" id="btnDelete" class="btn btn-outline-danger btn-sm"
						onclick="javascript:endProduct(this);">판매 종료</button>
					<label>상품 수 : ${searchCount} 개</label>
				</div>
				<div class="div-select">
					<select id="searchAnd" class="search-select">
						<option value="date">등록된 날짜</option>
						<option value="new">신상품 (등록된지 2주)</option>
						<option value="sale">세일 상품 (남은 판매 기한 2주)</option>
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
						<option value="desc">내림차순</option>
						<option value="asc">오름차순</option>
					</select>
					<input type="text" id="searchWhat" class="search-select" value="${searchDto.searchWhat}"
						placeholder="-상품 이름을 입력하세요-">
					<button type="button" id="btnSearch" class="btn btn-outline-secondary btn-sm"
						onclick="javascript:search(this);">검색</button>
				</div>
			</div>

			<!-- 상품 목록 -->
			<table class="table">
				<thead>
					<tr>
						<th>
							<input type="checkbox" id="inputCheckAll" onchange="javascript:checkSelectAll(this);">
						</th>
<!-- 						<th>순서</th> -->
						<th>상품번호</th>
						<th>상품 카테고리</th>
						<th>상품 이름</th>
						<th>등록 날짜</th>
						<th>판매 기한</th>
						<th>평점(5)</th>
						<th>할인율</th>
						<th>주문건수</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="productVo" items="${productListAll}">
					<c:forEach var="cate" items="${categoryList}">
					<c:if test="${productVo.product_category == cate.product_category}">
					<tr>
						<td>
							<input type="checkbox" class="input-checked" value="${productVo.product_code}"
								onchange="javascript:checkSelect(this);">
						</td>
						<td>${productVo.product_code}</td>
						<td>${cate.product_category_dsc}</td>
						<td><a href="/admin/productUpdateForm/${productVo.product_code}">${productVo.product_title}</a></td>
						<td class="td-date">${productVo.product_registration_date}</td>
						<td class="td-date td-deadlines" data-deadlines="${productVo.product_sales_deadlines}">
						<c:choose>
							<c:when test="${not empty productVo.product_sales_deadlines}">
								${productVo.product_sales_deadlines}
							</c:when>
							<c:otherwise>
								상시 판매
							</c:otherwise>
						</c:choose>
						</td>
						<td>${productVo.product_star} / 5</td>
						<td class="td-sale-rate">${productVo.product_sale_rate}</td>
						<td data-order-count="${productVo.product_order_count}">
						<c:choose>
							<c:when test="${productVo.product_order_count != 0}">
								${productVo.product_order_count} 회
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					</c:if>
					</c:forEach>
					</c:forEach>
				</tbody>
			</table>
			<!--// 상품 목록  -->
					
			<!-- 페이징 -->
			<div class="row">
				<div class="col-md-12 text-center">
					<nav>
						<ul class="pagination justify-content-center">
							<!-- 이전 -->
							<c:if test="${searchDto.startPage != 1}">
								<li class="page-item"><a class="page-link" href="#"
									data-page="${searchDto.startPage - 1}">이전</a></li>
							</c:if>
							<!-- 1 ~ 10 -->
							<c:forEach var="i" begin="${searchDto.startPage}" end="${searchDto.endPage}">
								<li
								<c:choose>
									<c:when test="${i == searchDto.page}">
										class="page-item active"
									</c:when>
									<c:otherwise>
										class="page-item"
									</c:otherwise>
								</c:choose>
								>
								<a class="page-link" href="#" data-page="${i}">${i}</a>
								</li>
							</c:forEach>
							<!-- 다음 -->
							<c:if test="${searchDto.endPage < searchDto.totalPage}">
								<li class="page-item"><a class="page-link" href="#"
									data-page="${searchDto.endPage + 1}">다음</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
			<!--// 페이징 -->
		</div>
		<div class="col-md-2"></div>
	</div>
</div>

<script>
$(function(){
	
	/* 상품 등록 성공 여부 알림 */
	var resultMsg = "${resultMsg}";
	if (resultMsg == "add_success") {
		alert("상품 등록이 완료되었습니다.")
	} else if (resultMsg == "add_fail") {
		alert("상품 등록이 실패했습니다. 다시 등록해 주세요.")
	}
	
	// 페이지네이션 - 페이지 번호 클릭했을때
	$("a.page-link").click(function(e){
		e.preventDefault();
		var page = $(this).attr("data-page");
		console.log(page);
		$("#frmSearch").find("input[name=page]").val(page);
		$("#frmSearch").submit();
	});
	
	/* 할인율 % 표현 */
	$(".td-sale-rate").each(function() {
		var txt = $(this).text();
		if (txt == 0) {
			$(this).text("");
		} else {
			$(this).text(txt + " %");
		}
	});
	
	/* 날짜, 시간 표현 */
	$(".td-date").each(function() {
		if ($(this).text().trim() != "상시 판매") {
			var date_str = $(this).text(); 
			var dateNew = new Date(date_str); 
			var year = dateNew.getFullYear();
			var month = dateNew.getMonth() + 1;
			var date = dateNew.getDate();
			var hour = dateNew.getHours();
			var dateShow = year +"년 "+ month +"월 "+ date + "일 " + hour + "시";
			$(this).text(dateShow);
		}
	});
	
	/* 판매기한 강조 */
	$(".td-deadlines").each(function() {
		if ($(this).text().trim() != "상시 판매") {
			$(this).css("color", "orange");
			/* 판매기한 경과 : 취소선 */
			var dateDeadLines = $(this).attr("data-deadlines");
			var dateDeadNew = new Date(dateDeadLines);
			var now = new Date();
			
			console.log("dateDeadNew :" + dateDeadNew);
			console.log("now :" + now);
			
			if (dateDeadNew < now) {
				$(this).parent().css("text-decoration", "line-through");
				$(this).css("color", "tomato");
				$(this).css("font-weight", "bold");
				$(this).text("판매 종료");
			}
		}
	});
	
	/* 검색 조건 유지 */
	searchStay();
	
});

/* 상품 등록 페이지로 이동 */
function insertProduct(obj) {
	location.href="/admin/productAddForm";
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

/* 판매 종료 - 비동기 */
function endProduct(obj) {
	var checkedCount = $(".input-checked:checked").length;
	if (checkedCount != 0) {
		var wantEnd = confirm("정말 해당 상품의 판매 기한을 종료할 것입니까?");
		if (wantEnd) {
			var url = "/admin/endProduct";
			var listEnd = []; // 배열
			$(".input-checked:checked").each(function() {
				listEnd.push($(this).val());
			});
// 			console.log(listEnd);
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
		} else {
			$(".input-checked").prop("checked", false); // 선택 취소
		}
	} else {
		alert("삭제할 상품을 선택해주세요.");
	}
}

/* 상품 검색 */
function search(obj) {
	$(".search-select").each(function(index) {
		/* 검색 조건 보내기 */
		if (index < 3) {
			var value = $(this).find("option:selected").val();
			$("#frmSearch > input").eq(index).val(value);
		} else {
			var value3 = $(".search-select").eq(3).val();
			$("#frmSearch > input").eq(3).val(value3);
		}
	});
	$("#frmSearch").submit();
}

/* 검색 조건 유지 */
function searchStay() {
	$(".search-select").each(function(index) {
		var value = $("#frmSearch > input").eq(index).val();
		var option = $(this).find("option");
		option.each(function() {
			var optionVal = $(this).val();
			if (value == optionVal) {
				$(this).attr("selected", true);
			}
		});
	});
}


</script>

</body>
</html>
<%@include file="../include/footer.jsp"%>