<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="frmOrdered" action="/customer/customerOrderdList" method="get">
	<input type="hidden" name="user_id" value="${sessionScope.testVo.user_id}"/>
<!-- 	<input type="hidden" name="order_state" value=""/> -->
</form>