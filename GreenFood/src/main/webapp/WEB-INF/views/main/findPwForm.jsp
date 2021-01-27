<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/css_findIdPw.css"/>

<meta charset="UTF-8">										
<meta name="viewport" content="width=device-width, initial-scale=1">										
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">										
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>										
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>										
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>

</script>
<script>
$(function(){
	// 돌아가기 버튼 클릭시 -> 로그인 페이지로 이동
	$(".btn_returnLoginPage").click(function(){
		location.href="/main/loginPage";
	});
	var msg = "${msg}";
	if(msg == "emailNotEquals"){
		alert("회원정보로 된 이메일이 없습니다");
	} else if(msg == "tempPasswordCreateFail"){
		alert("비밀번호 생성 실패.");
	} else if(msg == "notFoundCustomerInfo"){
		alert("회원정보가 없습니다. 아이디, 이메일을 다시 확인해주세요.")
	}
	
});
</script>
<body>

<div class="inner_login">
    <div class="login_tistory">

        <form method="post" id="frmFindPw" action="/main/customerFindPwRun">
            <fieldset>
            <legend class="screen_out">비밀번호 찾기</legend>
            <div class="box_login">
                <div class="inp_text">
                <label for="loginId" class="screen_out">아이디</label>
                <input type="text" id="user_id" name="user_id" placeholder="아이디" required>
                </div>
                <div class="inp_text">
                <label for="loginPw" class="screen_out">이메일</label>
                <input type="text" id="user_email" name="user_email" placeholder="이메일" required>
                </div>
            </div>
            <button type="submit" class="btn_findPw">비밀번호 찾기</button>
            <button type="button" class="btn_returnLoginPage">돌아가기</button>
            </fieldset>
        </form>
        
    </div>
</div>
</body>