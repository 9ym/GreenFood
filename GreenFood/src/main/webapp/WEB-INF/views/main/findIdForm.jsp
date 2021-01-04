<!DOCTYPE html>
<html lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/css_findIdPw.css"/>
<head>
<title>아이디 찾기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
$(function(){
	var msg = "${msg}";
	if(msg == "notFoundCustomerInfo"){
		alert("입력된 정보로 된 회원이 없습니다.");
	}
	
	// input이름, 이메일, 폰번호 popover
	$('#user_name').popover({title: "이름", content: "한글,영어 8~10자", trigger: "hover"});
	$('#user_email').popover({title: "이메일", content: "example@mail.com", trigger: "hover"});
	$('#user_phone').popover({title: "핸드폰 번호", content: "000-0000-0000", trigger: "hover"});
	
    // 아이디 찾기 버튼
	$("#btn_findId").click(function(){
		
		// 입력된 이름 값 정규식으로 확인
		var user_name = $("#user_name").val().trim();
		var user_name_regex = /^[가-힣a-zA-z]{2,10}$/;
		if(user_name_regex.test(user_name) === false){
			$('#user_name').popover('show');
			return;
		} 
		
		// 입력된 이메일 정규식 확인
		var email = $("#user_email").val();
		var email_regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		
		if(email_regex.test(email) === false){
			$("#user_email").popover('show');
			return;
		}
		
		// 핸드폰 번호 010-0000-0000 형식 , 중간자리 000까지는 인정
		var user_phone = $("#user_phone").val().split("-");
		var phoneNum_regex = /^[0-9]+$/;
		var phoneIMEI = user_phone[0];
		var midNum = user_phone[1];
		var lastNum = user_phone[2];
		
		if(phoneNum_regex.test(phoneIMEI) === false || phoneIMEI.length != 3){
			alert("핸드폰 첫번째 번호를 다시 확인해 주세요.");
			return;
		} else if(phoneNum_regex.test(midNum) === false || midNum.length < 3 || midNum.length > 4){
			alert("핸드폰 중간 번호를 다시 확인해 주세요.");
			return;
		} else if(phoneNum_regex.test(lastNum) === false || lastNum.length < 4 || lastNum.length > 4){
			alert("핸드폰 마지막 번호를 다시 확인해 주세요.");
			return;
		}
		
		$("#frmFindId").submit();
	});
});
</script>
</head>
<body>

<div class="inner_login">
    <div class="login_tistory">

        <form method="post" id="frmFindId" action="/main/customerFindIdRun">
            <fieldset>
            <legend class="screen_out">비밀번호 찾기</legend>
            <div class="box_login">
            
                <div class="inp_text">
                	<label for="loginId" class="screen_out">이름</label>
                	<input type="text" id="user_name" name="user_name" placeholder="이름" value="신귀환" required>
                </div>
                
                <div class="inp_text">
               	 	<label for="loginPw" class="screen_out">이메일</label>
                	<input type="text" id="user_email" name="user_email" placeholder="이메일" value="zerll9100@gmail.com" required>
                </div>
                
                <div class="inp_text">
                	<label for="loginPw" class="screen_out">이메일</label>
                	<input type="text" id="user_phone" name="user_phone" placeholder="핸드폰 번호 010-0000-0000" value="010-6428-4092" required>
                </div>
                
            </div>
            <button type="button" class="btn_findPw" id="btn_findId">아이디 찾기</button>
            <button type="button" class="btn_returnLoginPage">돌아가기</button>
            </fieldset>
        </form>
        
    </div>
</div>
</body>

</body>
</html>
