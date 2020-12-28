<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<script src="/resources/js/myScript.js"></script>
<script type="text/javascript">

</script>

<style>

</style>

<div class="container-fluid">

${productCategoryList}

</div>

</body>
</html>