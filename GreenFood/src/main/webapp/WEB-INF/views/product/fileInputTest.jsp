<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>													
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>													
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>													
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>													
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>File Input Test</title>
</head>
<body>

	
<div class="row">
	<div class="col-md-3"></div>
	
	<div class="col-md-6">
		<h2>File Input Test</h2><br/><br/>
	
		<form id="frmTest" action="/upload/fileTest" method="post" enctype="multipart/form-data">
			
<!-- 			상품 코드 : <input type="text" name="product_code"><br/> -->
			카테고리 : <input type="text" name="product_category"><br/>
			이름 : <input type="text" name="product_title"><br/>
			가격 : <input type="text" name="product_price"><br/>
			유통기한 : <input type="text" name="product_shelf_life"><br/>
			간단 설명 : <input type="text" name="product_sub_title"><br/>
			자세 설명 : <input type="text" name="product_content"><br/>
			무게 : <input type="text" name="product_weight"><br/>
			판매 단위 : <input type="text" name="product_sales_unit"><br/>
			원산지 : <input type="text" name="product_origin"><br/><br/>
			
			썸네일 : <input type="file" id="file" name="file" accept="image/*"><br/>
			자세 이미지 : <input type="file" id="file2" name="file2" accept="image/*"><br/><br/>
		
			<input type="submit" id="btnSubmit" value="submit 버튼">
		</form>
		
	</div>
	
	<div class="col-md-3"></div>
</div>
	
</body>
<script>
$(function() {
	$("#btnSubmit").click(function(e) {
// 		e.preventDefault();
		
	});
});
</script>
</html>