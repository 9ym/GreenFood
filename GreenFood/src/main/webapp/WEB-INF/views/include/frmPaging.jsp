<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="frmNoticePaging" action="/customerCenter/customerCenterMain" method="get">
	<input type="hidden" name="notice_no" value="${noticeVo.notice_no}"/>
	<input type="hidden" name="page" value="${pagingDto.page}">
	<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
	<%-- <input type="hidden" name="searchType" value="${pagingDto.searchType}""/>
	<input type="hidden" name="keyword" value="${pagingDto.keyword}"/> --%>
</form>

<form id="frmQuestionPaging" action="/customerCenter/question/questionContent" method="get">
	<input type="hidden" name="question_no" value="${questionVo.question_no}"/>
	<input type="hidden" name="page" value="${pagingDto.page}">
	<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
	<%-- <input type="hidden" name="searchType" value="${pagingDto.searchType}""/>
	<input type="hidden" name="keyword" value="${pagingDto.keyword}"/> --%>
</form>

<form id="frmReviewPaging" action="/review/reviewMain" method="get">
	<input type="hidden" name="review_no" value="${reviewVo.review_no}"/>
	<input type="hidden" name="page" value="${pagingDto.page}">
	<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
	<%-- <input type="hidden" name="searchType" value="${pagingDto.searchType}""/>
	<input type="hidden" name="keyword" value="${pagingDto.keyword}"/> --%>
</form>

<form id="frmDeleteCustomer" action="/admin/deleteCustomer" method="post">
	<input type="hidden" name="user_id" value=""/>
</form>

<form id="frmPaging" action="/admin/customerList" method="get">
	<input type="hidden" name="selectType" value="${pagingDto.selectType}">
	<input type="hidden" name="keyword" value="${pagingDto.keyword}">
	<input type="hidden" name="page" value="${pagingDto.page}"/>
</form>