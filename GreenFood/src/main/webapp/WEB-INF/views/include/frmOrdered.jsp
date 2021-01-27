<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="frmOrdered" action="/customer/customerOrderdList" method="get">
	<input type="hidden" name="user_id" value="${sessionScope.customerVo.user_id}"/>
	<input type="hidden" name="order_state_dsc"/>
	<input type="hidden" name="order_state"/>
	<input type="hidden" name="order_code"/>
	<input type="hidden" name="product_code"/>
	<input type="hidden" name="order_total_price"/>
</form>

<form id="frmOrdereding" action="/admin/orderManager/changeState" method="get">
	<input type="hidden" name="user_id" value="${sessionScope.customerVo.user_id}"/>
	<input type="hidden" name="order_state_dsc"/>
	<input type="hidden" name="order_code"/>
</form>