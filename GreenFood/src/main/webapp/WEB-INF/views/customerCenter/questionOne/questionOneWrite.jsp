<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ include file="../../include/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QuestionOneWrite</title>

<style>
.page_aticle.aticle_type2 {
    padding-top: 65px;
}
.page_aticle {
    width: 1050px;
    margin: 0 auto;
}

div {
    display: block;
}

#snb {
	padding: 0 10px 0 20px;
	float: left;
	width: 280px;

}

#snb .tit_snb {
    padding: 8px 0 33px 1px;
    font-weight: 700;
    font-size: 30px;
    line-height: 34px;
    color: #333;
    letter-spacing: -.5px;
}

.tit_sub {
    padding-left: 11px;
    font-size: 14px;
    color: #999;
    line-height: 20px;
    letter-spacing: -.3px;
    vertical-align: 3px;
}


#snb .inner_snb {
    border: 1px solid #f2f2f2;
    border-bottom: 0;
}

#snb .list_menu li {
    border-bottom: 1px solid #f2f2f2;
}
 

#snb .list_menu li.on a{
	background: #ffffff no-repeat 230px 52%;
	color: #B9B5B9;
}

#snb .list_menu li a{
	color: #B9B5B9;
}

#snb .list_menu li.on a:hover{
    background: #fafafa url(https://res.kurly.com/pc/ico/2008/ico_arrow_6x11_on.svg) no-repeat 230px 52%;
    background-size: 6px 11px;
    font-weight: 700;
    color: #5AB63F;
}

#snb .list_menu li a{
    background: #fafafa url(https://res.kurly.com/pc/ico/2008/ico_arrow_6x11_on.svg) no-repeat 230px 52%;
    background-size: 6px 11px;
    font-weight: 700;
    color: #5AB63F;
}


#snb .list_menu li a {
    display: block;
    overflow: hidden;
    padding: 15px 0 15px 20px;
    font-size: 15px;
    line-height: 20px;
    letter-spacing: -.3px;
}

.head_aticle {
    padding: 5px 0 34px;
    border-bottom-style: groove;
	border-width: 2px;
	border-color: #6ca435;
}

.checkOrder{
	font-size: 13px;
    vertical-align: middle;
    color: #5AB63F;
    border-bottom: 1px solid #5AB63F;
	
}

.btn_checkOrderModalClose {
	float: none;
	border-color : white;
	line-height: 18px;
	width: 70px;
    background-color: #80db65;
    color: #fff;
}


tbody tr {
    border-top-style: groove;
	border-width: 1px;
	/* border-color: #6ca435; */
	margin-top: 20px;
}

.table th {
    width: 110px;
    padding: 15px 0 15px 0;
    background-color: #f7f5f8;
    border-bottom: 1px solid #f4f4f4;
    text-align: center;
    font-size: 14px;
    font-weight: 400;
    font-family: noto sans;
    vertical-align: middle;
}

.table td {
	width: auto;
    padding: 15px 0 15px 20px;
    border-bottom: 1px solid #f4f4f4;
    text-align: left;
    font-size: 14px;
    font-weight: 400;
    font-family: noto sans;
    vertical-align: middle;
}
   

.table select {
	width: 150px;
	padding: 6px 5px;
    border: 1px solid #d9d9d9;
    margin-bottom: 5px;
    color: #202020;
    
}


.option-item {
    background: #fafafa  no-repeat 230px 52%;
    background-size: 6px 11px;
    font-weight: 400;
    color: #202020;
    font-size: 14px;
}

.option-item:hover {
    background: #fafafa  no-repeat 230px 52%;
    background-size: 6px 11px;
    font-weight: 700;
    color: #5AB63F;
    font-size: 16px;
}
 
input {
	width: 150px;
	padding: 6px 5px;
    border: 1px solid #d9d9d9;
    color: #202020;
}

.bhs_button.yb {
    background-color: #80db65;
    color: #fff;
}

.bhs_button.yb.checkOrder {
	float: none;
	line-height: 18px;
	width: 100px;
    background-color: #80db65;
    color: #fff;
}

.bhs_button.yb:hover {
    background-color: #5AB63F;
    color: #fff;
    border-style:  solid;
    border-color: #38b612;
}

input[type=checkbox] {
    position: relative;
    right: 2px;
    vertical-align: middle;
}

.container-fluid {
	padding-top: 150px;
}

.main-col {
	padding-top: 30px;
}

</style>

<script src="/resources/js/myScript.js"></script>

<script>
$(function(){
	
	// 주문조회 누르면 모달창에 리스트 나타내기
	$("#orderList").click(function(){
			var url = "/customerCenter/questionOne/getOrderList"
		
			$.post(url, function(data){
				$("#checkOrderTable > tbody").empty();
				var nowCode = 0;
				var count = 0;
				$.each(data, function(){
					
					if (nowCode != this.order_code) {
						console.log(this.order_date);
						
						 var tr = $("#trTable").find("tr").clone();
						 tr.find("td").eq(0).html(this.order_code);
						 tr.find("td").eq(1).html(changeDateString(this.order_date));
						 tr.find("td").eq(2).html(this.product_title);
						 tr.find("td").eq(3).html(this.order_total_price);
						 
						 $("#checkOrderTable > tbody").append(tr);
						 nowCode = this.order_code;
						 count = 0;
					} else {
// 						console.log($("#tableTbody tr:last"));
						$("#tableTbody tr:last").find("td").eq(2).html(this.product_title + " 외 " + (++count) + " 건");
						
					}
					
				});
			});
	});
	
	// radio 버튼 클릭 이벤트
	$("#tableTbody").on("click", ".checkOrderRadioButton", function() {
		var number = $(this).parent().prev().prev().prev().prev().text();
		console.log(number);
		$("#q_o_order_code").val(number);
		$(".btn_checkOrderModalClose").trigger("click");
	});
	
}); 

function changeDateString(timestamp) {
	
	
	var d = new Date(timestamp);
	var year = d.getFullYear();
	var month = make2digits(d.getMonth() + 1);
	var date = make2digits(d.getDate());
	var hour = make2digits(d.getHours());
	var minute = make2digits(d.getMinutes());
	var second = make2digits(d.getSeconds());
	
	return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second;
	
}

function make2digits(num) {
	if (num < 10) {
		num = "0" + num;
	}
	return num;
}
</script>

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 main-col">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="row">

							<!-- --------------------------- 고객센터 왼쪽 작은창 ---------------------- -->
							<div class="col-md-3">
								<div id="snb" class="snb_cc">
									<h2 class="tit_snb">고객센터</h2>
									<div class="inner_snb">
										<ul class="list_menu">
											<li class="on"><a
												href="/customerCenter/customerCenterMain">공지사항</a></li>
											<li class="on"><a
												href="/customerCenter/question/questionContent">자주하는 질문</a></li>
											<li><a
												href="/customerCenter/questionOne/questionOneContent">1:1
													문의</a></li>
										</ul>
									</div>
								</div>
							</div>

							<!-- ------------------------- 1 : 1 문의 메인 창 --------------------------- -->
							<div class="col-md-9">
								<div class="head_aticle">
									<h2 class="tit">
										1 : 1 문의 <span class="tit_sub"> 궁금하신 내용을 문의해 주세요.</span>
									</h2>

								</div>

								<div class="row">
									<div class="col-md-12">
										<form role="form" action="/customerCenter/questionOne/insertOuestionOne" method="post">
											<table class="table">
												<tbody>
													<tr>
														<th>작성자</th>
														<td><input type=text name="q_o_writer"
															value="${sessionScope.customerVo.user_id}" size=26
															class="read_only"
															style="background-color: #f7f5f8; width: 150px;"
															readonly="readonly" name="q_o_writer"></td>
													</tr>

													<tr>
														<th>제목</th>
														<td><select name="q_o_category" required label="질문유형"
															class=select>
																<option value="">선택해주세요.</option>
																<option class="option-item questionOne"
																	name="q_o_category" id="member" value="201">회원문의</option>
																<option class="option-item questionOne"
																	name="q_o_category" id="order" value="202">주문/결제</option>
																<option class="option-item questionOne"
																	name="q_o_category" id="cancel" value="203">취소/교환/반품</option>
																<option class="option-item questionOne"
																	name="q_o_category" id="delivery" value="204">배송관련</option>
																<option class="option-item questionOne"
																	name="q_o_category" id="point" value="205">쿠폰/적립금</option>
																<option class="option-item questionOne"
																	name="q_o_category" id="use" value="206">이용 및
																	기타</option>
														</select><br> 
														<input type=text name="q_o_title"
															style="width: 100%" required label="제목" value=""
															placeholder=" 제목을 입력해주세요."></td>
													</tr>
													<tr>
														<th>주문번호</th>
														<td><input type=text id="q_o_order_code"
															name="q_o_order_code" style="width: 25%" value=""
															placeholder=" 주문번호를  조회해주세요."> <a
															id="modal-75830" href="#modal-container-75830"
															role="button" class="" data-toggle="modal"> <input
																type="button" class="bhs_button yb checkOrder"
																value="주문조회" id="orderList" ></a> <br> <span
															id="span1" style="font-size: 10pt; color: #5AB63F">*
																주문내역이 없으면 비워두세요.</span></td>
													</tr>
													<tr>
														<th>이메일</th>
														<td><input type=text name="q_o_email"
															value="${sessionScope.customerVo.user_email}" size=26
															class="read_only" style="width: 200px;"> <span
															class="noline smalle" style="padding-left: 10px">
														</span></td>
													</tr>
													<tr>
														<th>전화번호</th>
														<td><input type=text name="q_o_phone"
															value="${sessionScope.customerVo.user_phone}"
															class="read_only" style="width: 130px;"> <span
															class="noline smalle" style="padding-left: 10px">
																<input type=checkbox name=sms style="width: 20px;">
																<span style="font-size: 8pt; color: #5AB63F">답변
																	등록 안내를 문자메시지로 받겠습니다.</span>
														</span></td>
													</tr>
													<tr>
														<th>내용</th>
														<td class="edit_area" style="position: relative;"><textarea
																name="q_o_content" style="width: 100%; height: 474px;"
																class="editing_area" required label="내용"
																placeholder=" 문의 내용을 입력해주세요."></textarea></td>
													</tr>
													
												</tbody>
											</table>


											<table width=100%>
												<tr>
													<td align=center
														style="padding-top: 10px; padding-bottom: 50px; border: none;"
														id="avoidDbl"><input type="submit"
														class="bhs_button yb" value="작성완료"
														style="float: none; width: 120px;"></td>
												</tr>
											</table>
										</form>
									</div>
								</div>

								<!------------------------ 주문번호 조회 모달창 ------------------------ -->

								<div class="row">
									<div class="col-md-12">
										<a id="modal-75830" href="#modal-container-75830"
											role="button" class="btn" data-toggle="modal"
											style="display: none;">주문번호 조회</a>

										<div class="modal fade" id="modal-container-75830"
											role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content"
													style="width: 700px; height: auto;">
													<div class="modal-header"
														style="padding-top: 5px; padding-left: 10px; padding-right: 5px; padding-bottom: 5px;">
														<p
															style="font-size: 18px; font-family: 'Noto Sans', sans-serif; font-weight: 700; color: green"
															class="modal-title" id="myModalLabel">주문번호 조회</p>
														<button type="button" class="close" data-dismiss="modal">
															<span aria-hidden="true">×</span>
														</button>
													</div>
													<div class="modal-body">
														<div
															style="padding-bottom: 7px; border-bottom: 2px solid #5AB63F;">문의하실
															주문번호를 선택해주세요</div>

														<table width="100%" align="center" cellpadding="0"
															cellspacing="0">
															<tbody
																style="border-top-style: hidden; padding-bottom: 10px;">
																<tr style="padding-bottom: 10px;">
																	<td>
																		<div class="" style="padding-top: 10px; padding-bottom: 10px;">

																			<table width="100%" class="xans-board-listheader jh"
																				cellpadding="0" cellspacing="0" id="trTable"
																				style="border-top-style: hidden; padding-bottom: 10px; display: none;">

																				<tr style="text-align: center; color: #98a18f; font-weight: 500;">
																					<td style="padding: 10px 0 10px 0;"></td>
																					<td style="padding: 10px 0 10px 0;"></td>
																					<td style="padding: 10px 0 10px 0;"></td>
																					<td style="padding: 10px 0 10px 0;"></td>
																					<td style="padding: 10px 0 10px 0;">
																						<input style="width: 50px;" type="radio" class="checkOrderRadioButton"
																							data-number="" name="checkOrderRadioButton" />
																					</td>
																				</tr>
																			</table>

																			<table width="100%" class="xans-board-listheader jh"
																				cellpadding="0" cellspacing="0" id="checkOrderTable"
																				style="border-top-style: hidden; padding-bottom: 10px;">

																				<thead class="checkOrder">
																					<tr style="text-align: center;">
																						<th style="width: 110px; padding-bottom: 10px;">주문번호</th>
																						<th style="width: 150px; padding-bottom: 10px;">주문일자</th>
																						<th style="width: auto; padding-bottom: 10px;">상품명</th>
																						<th style="width: 90px; padding-bottom: 10px;">주문금액</th>
																						<th style="width: 30px; padding-bottom: 10px;">선택</th>
																					</tr>
																				</thead>
																				<tbody class="checkOrder" id="tableTbody">

																				</tbody>

																			</table>

																		</div>


																	</td>
																</tr>
															</tbody>
														</table>
													</div>

													<div class="modal-footer">

														<button type="button" class="btn_checkOrderModalClose"
															data-dismiss="modal">close x</button>
													</div>
												</div>

											</div>

										</div>

									</div>
								</div>
							</div>
							<!-- // 자주하는 질문 메인창  -->

						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>