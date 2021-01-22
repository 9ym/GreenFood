<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review Write</title>
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


.head_aticle {
    padding: 5px 0 1px;
}

thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: green;
}

.table {
	border-top-style: groove;
	border-width: 2px;
	border-color: #6ca435;
}

tbody tr {
    border-top-style: groove;
	border-width: 1px;
	border-color: #6ca435;
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
   


 
input {
	width: 150px;
	padding: 6px 5px;
    border: 1px solid #d9d9d9;
    color: #202020;
}

.bhs_button.yb {
    background-color: #62b748;
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


.xans-board-listheader {
    border-top-style: solid;
	/* border-right-style: dotted; */
	border-bottom-style: solid;
	/* border-left-style: groove; */
	border-width: 1px;
	border-color: #6ca435;
    
}


.container-fluid {
	padding-top: 150px;
}

.col-md-12 {
	padding-top: 30px;
}


</style>

<script>
$(function(){
	
	/* $("#btnNoticeWrite").click(function(){
		location.href="/customerCenter/notice/noticeWriteForm";
	});
	
		
	$(".notice_title").click(function(e){
		e.preventDefault();
		var n_no = $(this).attr("data-bno");
		
		location.href="/customerCenter/notice/noticeContent/" + n_no;
	});
	
	// 페이지네이션 - 페이지 번호 클릭했을때
	$("a.page-link").click(function(e){
		e.preventDefault();
		var page = $(this).attr("data-page");
		console.log(page);
		$("#frmNoticePaging").find("input[name=page]").val(page);
		$("#frmNoticePaging").submit();
	}); */
	
	
});
</script>



</head>
<body>



	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="row">
						
				<!-- --------------------------- 고객센터 왼쪽 작은창 ---------------------- -->
							<div class="col-md-2">
							</div>


				<!-- ------------------------- 공지사항 메인 창 --------------------------- -->
							<div class="col-md-8">
							
								<!-- ----------------- 메인창의 윗부분 ---------------------- -->
							
								<div class="head_aticle">
									<h2 class="tit">
										후기 작성 <span class="tit_sub"> 고객 여러분의 소중한 후기를 작성해주세요.</span>
										
									</h2>
									<!-- <div class="div-button" style="padding-bottom: 10px; height: 40px;">
									<button type="button" id="btnNoticeWrite">후기 작성하기</button>
									</div> -->

								</div><!-- // 메인창의 윗부분 -->


								
								<!-- ---------------- 후기 작성하는  부분 -------------------- -->
								<div class="row">
									<div class="col-md-12">
										<form role="form" action="/review/insertReview" method="post">
										<table class="table">
										
											<tbody>
												<tr style="display: none;">
													<th>작성자</th>
													<td>
													<input type=text name="user_id" style="width: 20%" value="${reviewVo.user_id }" 
													readonly="readonly"   >
													
													</td>
												</tr>
												
												<tr>
													<th>주문번호</th>
													<td>
													<input type=text name="order_code" style="width: 20%" value="${reviewVo.order_code }" 
													readonly="readonly"  >
													
													</td>
												</tr>
												
												<tr>
													<th>제품번호</th>
													<td>
													<input type=text name="product_code" style="width: 20%" value="${reviewVo.product_code }" 
													readonly="readonly"  >
													
													</td>
												</tr>
												
												<tr>
													<th>제품명</th>
													<td>
													<input type=text name="product_title" style="width: 20%" value="${reviewVo.product_title }" 
													readonly="readonly"  >
													
													</td>
												</tr>
												
												<tr>
														<th>별점주기</th>
														<td><select name="star_point" required label="별점선택"
															class=select>
																<option value="">별점 선택</option>
																<option class="option-item review"
																	name="star_point" id="one" value="1">1 점</option>
																<option class="option-item questionOne"
																	name="star_point" id="two" value="2">2 점</option>
																<option class="option-item review"
																	name="star_point" id="three" value="3">3 점</option>
																<option class="option-item review"
																	name="star_point" id="four" value="4">4 점</option>
																<option class="option-item review"
																	name="star_point" id="five" value="5">5 점</option>
																
														</select>
													</tr>
												
												<tr>
													<th>제목</th>
													<td>
													<input type=text name="review_title" style="width: 100%"
													required label="제목" value="" placeholder=" 제목을 입력해주세요.">
													</td>
												</tr>
												
												<tr>
													<th>내용</th>
													<td class="edit_area" style="position: relative;">
													<textarea name="review_content"
														style="width: 100%; height: 474px;" class="editing_area"
														required  label="내용" placeholder=" 후기 내용을 입력해주세요."></textarea>
													</td>
												</tr>
												<tr>
													<th>이미지 첨부</th>
													<td>
													<table width=100% id=table 
														style="border: solid 1px #f4f4f4; border-collapse: collapse;">
														<tr id="tr_0">
															<td width=10px; nowrap align="center" style="width: 30px;">1</td>
															<td width=100%>
															<input type=file name="review_image" style="width: 50%" class=linebg> 
															<!-- <a href="javascript:add()"><img
																	src="/shop/data/skin/designgj/img/common/btn_upload_plus.gif"
																	align=absmiddle></a> --></td>
														</tr>
													</table>
													
													<div width=100% style="padding: 5px; font-size: 10pt; color: #5AB63F"" class=stxt>
														* 파일은 최대 5개까지 업로드가 가능합니다.<br>
													</div>
												</td>
												</tr>
											</tbody>
										</table>
										
										
										<table width=100%>
											<tr>
												<td align=center style="padding-top: 10px; padding-bottom:50px; border: none;"id="avoidDbl">
												<input type="submit" class="bhs_button yb" value="작성완료" style="float: none; width: 120px;">
												</td>
											</tr>
										</table>
										</form>
									</div>
								</div>

								
							</div>
							<!-- // 공지사항메인창  -->
							<div class="col-md-2">
							</div>


						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>