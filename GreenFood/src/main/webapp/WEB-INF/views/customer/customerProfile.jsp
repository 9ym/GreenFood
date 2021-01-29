<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/css_customerMyPage.css"/>
<style>

.container-fluid1 {
	padding-top : 150px;
}

.container-fluid{
	padding-top : 30px;
}

.t_tit{
	font-family: 'Noto Sans KR';
    font-weight: 800;
    font-size: 20px;
    color: #000;
    line-height: 1.45;
}

.t_tit1{
	font-family: 'Noto Sans KR';
    font-weight: 800;
    font-size: 16px;
    color: #000;
    line-height: 1.5;
}

.input_type1{
    width: 100%;
    height: 40px;
    font-family: 'Noto Sans KR';
    font-weight: 400;
    font-size: 18px;
    color: #000;
    padding: 0 20px;
    border-bottom: 1px solid #ddd;
    vertical-align: middle;
    background: #fff;
    position: relative;
}

<!-- 회원정보 수정 -->
.wrap-content-area{
    float: left;
    margin-left: 40px;
    width: 500px;
}

.txt-required{
    padding: 30px 0 10px;
    font-size: 14px;
    font-weight: 500;
    text-align: right;
    color: #606060;
}

.required{
    font-weight: 500;
    color: #cd042a;
}

.wrap-table{ 
	fixed;
    width: 100%;
    border-top: 1px solid #999;
}

</style>
<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function(){
	/* 헤더 배경화면, 게시판 이름 바꾸는 부분 */
	/* url 뒤에 사진 넣으면됩니다. */
	$("#page_background").css({"background-image":"url('${path}/resources/images/login_dog.jpg')"});
	$("#page_background").css({"background-size":"100% 100%"});
	$("#page_background").css({"background-repeat":"no-repeat"});
	$("#boardNames").text("마이페이지");/* 게시판 이름 */
	
	/*주소 찾기 버튼 클릭*/
	$("#btnFindPostalCode").click(function() {
		sample6_execDaumPostcode();
	});
	
	// 비밀번호 변경 실패시 알림창
	var msg = "${msg}";
	if(msg == "pwChangeFail"){
		alert("비밀번호 변경을 실패하였습니다.");
	} else if(msg == "modifySuccess"){
		alert("회원정보 수정 실패.");
	} else if(msg == "pwChangeSuccess"){
		alert("비밀번호를 변경하였습니다.");
	}

	/*주소 찾기 함수*/
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName
										: data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							$("#detailAddress").val(extraAddr);

						} else {
							$("#detailAddress").val('');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						$("#postalCode").val(data.zonecode);
						$("#roadAddress").val(addr);
						// 커서를 상세주소 필드로 이동한다.
						$("#detailAddress").focus();
					}
				}).open();
	}
	
	// 비밀번호 일치시에 정보 확인 폼 닫고 회원정보수정창 보여주기
	$("#divForm").show();
	$("#divForm1").hide();
	$("#btnPassCheckComplete").click(function(){
		var user_pw = $("#user_pw").val();
		var that = $(this);
		var url = "/customer/customerProfileRun";
		var sendData = {
				"user_pw" : user_pw
		};
		// 회원정보 비밀번호 일치시에 세션정보들 넣어주기
		$.post(url, sendData, function(data){
			console.log(data);
			if(data == "success"){
				that.parent().parent().hide();
				$("#divForm1").show();
				// 핸드폰 split
				var user_phone = "${sessionScope.customerVo.user_phone}";
				var phone_split = user_phone.split("-", 3);
				var iMei = phone_split[0];
				var midNum = phone_split[1];
				var lastNum = phone_split[2];
				
				$("#phoneIMEI").val(iMei);
				$("#midPhoneNum").val(midNum);
				$("#lastPhoneNum").val(lastNum);
				
				// 이메일 split
				var user_email = "${sessionScope.customerVo.user_email}";
				var email_split = user_email.split("@", 2);
				var email_id = email_split[0];
				var email_domain = email_split[1];
				
				$("#emailId").val(email_id);
				$("#emailDomain").val(email_domain);
				
				// 주소 넣기
				var postalCode = "${sessionScope.customerVo.user_addr1}";
				var roadAddress = "${sessionScope.customerVo.user_addr2}";
				var detailAddress = "${sessionScope.customerVo.user_addr3}";
				$("#postalCode").val(postalCode);
				$("#roadAddress").val(roadAddress);
				$("#detailAddress").val(detailAddress);
				
				// 이메일 도메인 값 변환체크
				$("#selectEmail").on("change", function(){
						var emailDomain = $(this).val();
						$("#emailDomain").val(emailDomain);
						if(emailDomain == "직접입력"){
							$("#emailDomain").val("");
						}
				});
			} else if(data == "fail"){
				alert("비밀번호가 일치하지 않습니다.");
			}
			
			// 비밀번호 변경버튼 -> 모달창 띄우기
			$("#btnPwChange").click(function(){
				$(".modifyModal").trigger("click");
			});
			
			// 비밀번호 변경 모달 -> 다음에 변경 -> 입력값 초기화
			$("#btnModalPwNextChange").click(function(){
				$("#presentPw").val("");
				$("#newPw1").val("");
				$("#newPw2").val("");
			});
			
			// 비밀번호 변경 모달창 -> 비밀번호 controller에 전송
			$("#btnModalPwChange").click(function(){
				var presentPw = $("#presentPw").val().trim();
				var newPw1 = $("#newPw1").val().trim();
				var newPw2 = $("#newPw2").val().trim();
				
				var pw_regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
				
				var pw_test = pw_regex.test(newPw1);
				var pw_test1 = pw_regex.test(newPw2);

				var url = "/customer/customerProfilePwChangeChkRun";
				var sendData = {
						"presentPw" : presentPw
				};
				
				$.post(url, sendData, function(data){
					console.log(data);
					if(data == "equals" && newPw1 == newPw2 && pw_test === true && pw_test1 === true && newPw1 != "" && newPw2 != "" && presentPw != newPw1 && presentPw != newPw2){
						
						$("#frmProfilePwChk").attr("action", "/customer/customerProfilePwChange");
						$("#frmProfilePwChk > input[type=hidden]").val(newPw1);
						$("#frmProfilePwChk").submit();

						$("#presentPw").val("");
						$("#newPw1").val("");
						$("#newPw2").val("");
						
						return;
					} else if(data == "fail"){
						alert("현재 비밀번호가 일치하지않습니다");
					} else if(newPw1 != newPw2){
						alert("비밀번호가 다릅니다 다시입력해 주세요.");
					} else if(presentPw == newPw1 || presentPw == newPw2){
						alert("현재 비밀번호와 같습니다. 다른 비밀번호를 사용하세요.");
					} else if(pw_test === false || pw_test1 === false){
						alert("비밀번호는 8~10 영문/숫자/특수문자 조합입니다.");
					}
					$("#newPw1").val("");
					$("#newPw2").val("");
					$(".modifyModal").trigger("click");
				}); //$.post 끝
	
			});
			
		});
	});
	
	// 정보수정 submit
	$("#btnModifyComp").click(function(){
		
		// email 아이디 + 도메인
		var emailId = $("#emailId").val();
		var emailIdTrim = emailId.trim();
		var emailDomain = $("#emailDomain").val();
		var emailDomainTrim = emailDomain.trim();
		
		var email = emailId + "@" + emailDomain;
		
		var email_regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		
		if(email_regex.test(email) === false){
			alert("이메일을 확인해 주세요.");
			return;
		} else{
			$("#frmMemberModify > input[type=hidden]").eq(0).val(email);
		}
		
		// 핸드폰 번호 010-0000-0000 형식 , 중간자리 000까지는 인정
		var phoneNum_regex = /^[0-9]+$/;
		
		var phoneIMEI =  $("#phoneIMEI").val().trim();
		var midNum = $("#midPhoneNum").val().trim();
		var lastNum = $("#lastPhoneNum").val().trim();
		
		var lengthBlankCheck_regex = /^[0-9]+$/;	

		if(lengthBlankCheck_regex.test(midNum) === false || midNum.length < 3 || midNum.length > 4){
			alert("핸드폰 중간 번호를 다시확인해 주세요");
			return;
		} else if(lengthBlankCheck_regex.test(lastNum) === false || lastNum.length < 4 || lastNum.length > 4){
			alert("핸드폰 마지막 번호를 다시확인해 주세요");
			return;
		} else {
			var phoneNum = phoneIMEI + "-" + midNum + "-" + lastNum;
			$("#frmMemberModify > input[type=hidden]").eq(1).val(phoneNum);
		}
		
		// 히든에 date값 넣어주기
		var user_date = "${sessionScope.customerVo.user_date}";
		$("#frmMemberModify > input[type=hidden]").eq(2).val(user_date);
		
		$("#frmMemberModify").submit();
	});
	
});
</script>
<content>
<body>
<div class="container-fluid1">

  <button type="button" class="btn btn-primary modifyModal" data-toggle="modal" data-target="#myModal" style="display:none;">
    비밀번호 변경 모달창
  </button>

  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title t_tit">비밀번호 변경 안내</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	<div>
          		<span>${sessionScope.customerVo.user_name}</span>님 비밀번호를 변경해주세요.
        	</div>
          <div class="form-group">
          	<input type="password" class="form-control form-control-lg" id="presentPw" placeholder="현재 비밀번호 입력">
          </div>
          <div class="form-group">
          	<input type="password" class="form-control form-control-lg" id="newPw1" placeholder="새 비밀번호 입력(8~10 영문/숫자/특수문자 조합)">
          </div>
          <div class="form-group">
          	<input type="password" class="form-control form-control-lg" id="newPw2" placeholder="비밀번호를 한번더 입력해주세요.">
          </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
		        <div class="form-group">
		          <button type="button" class="btn btn-outline-success" id="btnModalPwChange" data-dismiss="modal">비밀번호 변경하기</button>	        
		        </div>
		        <div class="form-group">
		          <button type="button" class="btn btn-outline-secondary" id="btnModalPwNextChange" data-dismiss="modal">다음에 변경하겠습니다.</button>
		        </div>
        </div>
        
      </div>
    </div>
  </div>
  </div>
  
 <div id="content_left" style="width:300px;
height: 700px;
float:left;
border-top:2px solid #6ca435;
margin:0;
padding:0;">
		<div id="leftContent_top">
			<div id="profileImgBox" style="background: #BDBDBD;">
					<!--여기에 사진 파일주소 넣어줌-->
					<img class="profile" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCZq00uO6xhj9L20RgKIakgz8aYT3wfFqZKw&usqp=CAU">
					</div>
			<p>반갑습니다!</p>
			<p>구매자</p>
			<p><span id="spanUserName">${sessionScope.customerVo.user_name}</span>님</p>
		</div>
		
		<div id="left_bottom">
			<div><a href="/customer/customerProfile" class="btn">프로필</a></div>
			<div><a href="/customerCenter/question/questionContent" class="btn">Q&amp;A</a></div>
		</div>
</div>
	<!--오른쪽 메뉴-->
	<div id="content_right" style="float:right;
width:1000px;border-top:2px solid #6ca435;box-shadow:3px 3px 3px #c7c7c7;margin-bottom:200px;">
		<div id="pageName" >
			<h3 class="t_tit">My Profile</h3>
		</div>
		
		<!-- 프로필 폼 들어가기전 비밀번호 확인-->
		<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" id="divForm">
			<h3 class="t_tit">회원 정보를 보호하기 위해 비밀번호를 재확인합니다.</h3>
			<form role="form" id="frmProfilePwChk" action="/customer/customerProfileRun" method="post">
			<input type="hidden" name="user_pw">
			<div class="row">
				<div class="form-group col-md-6">	 
					<label for="user_id" class="t_tit1">
						아이디
					</label>
					<input type="text" class="form-control" id="user_id" name ="user_id" value="${sessionScope.customerVo.user_id }" readonly/>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="user_pw" class="t_tit1">
						비밀번호 확인
					</label>
					<input type="password" class="form-control" id="user_pw" placeholder="현재 비밀번호를 입력해주세요"/>
				</div>
			</div>
				<button type="button" id="btnPassCheckComplete" class="btn btn-primary">
					완료
				</button>
			</form>
		</div>
	</div>
</div>
<!-- // 프로필 폼 들어가기전 비밀번호 확인 끝-->

<!-- 나의 정보 확인 -->
		
<div class="container-fluid">
	<div class="row">
		<div class="form-group col-md-12" id="divForm1">
<div class="wrap-content-area">
	<h3 class="t_tit">회원정보 수정</h3>
	<div class="wrap-memberinfo-modify">
		<p class="txt-required">
			<span aria-label="필수 항목" class="required">*</span>
			표시는 필수 항목입니다
		</p>
	<form role="form" id="frmMemberModify" action="/customer/customerProfileModifyRun" method="post">
			<!-- 히든정보 이메일 폰번호 주소 -->
					<input type="hidden" name="user_email"/>
					<input type="hidden" name="user_phone"/>
					<input type="hidden" name="user_date"/>
					<div class="row">
						<div class="form-group col-md-3">
							<label for="user_id">
							아이디<span aria-label="필수 항목" class="required">*</span>
							</label>
							<input type="text" class="form-control" id="user_id" name="user_id" value="${sessionScope.customerVo.user_id }" readonly required />
							<br/>
						</div>
						
						<div class="form-group col-md-2">
							<label>
							　　　
							</label>
							<button type="button" class="form-control" id="btnPwChange">비밀번호 변경</button>
							
						</div>
					</div>
					
	<!-- 이름 핸드폰입력 row -->
	<div class="form-row user_name">
		<div class="form-group col-md-3">
			<label>이름<span aria-label="필수 항목" class="required">*</span></label>
			<input type="text" class="form-control" value="${sessionScope.customerVo.user_name}" name="user_name" readonly>
		</div>
	</div>
	<hr/>
	<div class="row">
		<div class="form-group col-md-2">
			<label>핸드폰 번호<span aria-label="필수 항목" class="required">*</span></label>
			<select id="phoneIMEI" class="form-control">
							<option>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>019</option>
			</select>
		</div>
		<div class="form-group col-md-2">
			<label>　　　</label>
			<input type="text" id="midPhoneNum" class="form-control" required/>
		</div>
		<div class="form-group col-md-2">
			<label>　　　</label>
			<input type="text" id="lastPhoneNum" class="form-control" required/>
		</div>
	</div>

	<!-- //이름 핸드폰입력 row 끝 -->
	
	<!-- 이메일 div row -->
	<div class="form-row">
		<div class="form-group col-md-2">
			<label for="emailId">이메일</label>
			<input type="text" id="emailId" class="form-control" placeholder="이메일 아이디" required/>
		</div>
		<div class="form-group col-md-1">
			<label>　　</label>
			<span class="form-control" style="border:none;">@</span>
		</div>
		<div class="form-group col-md-2">
			<label for="emailDomain">　　　</label>
			<input type="text" id="emailDomain" class="form-control" placeholder="도메인 입력" required/>
		</div>
		<div class="form-group col-2">
			<label>　　　</label> 
			<select id="selectEmail" class="form-control">
				<option>직접입력</option>
				<option>gmail.com</option>
				<option>naver.com</option>
				<option>nate.com</option>
				<option>hanmail.net</option>
				<option>hotmail.com</option>
			</select>
		</div>
	</div>
	<!-- //이메일 row 끝 -->
	
	<hr>
		
		<!-- 주소란 -->
		<div class="form-row">
				
			<div class="col-md-2">
				<label>주소(기본배송지)<span aria-label="필수 항목" class="required">*</span></label>
				<input type="text" placeholder="우편번호" id="postalCode" name="user_addr1" class="form-control" required/>
			</div>
			
			<div class="col-md-2">
				<label>　　　</label>
				<button type="button" class="form-control btn btn-warning" id="btnFindPostalCode">우편번호 찾기</button>
			</div>
		</div>
		
		<div class="form-row">
			<div class="col-md-6">
				<label>주소</label>
				<input type="text" id="roadAddress" class="form-control" placeholder="주소를 입력해주세요" required name="user_addr2" id="roadAddress"/>
			</div>
		</div>
		<div class="form-row">	
			<div class="col-md-6">
				<label>상세주소</label>
				<input type="text" id="detailAddress" class="form-control" placeholder="상세주소를 입력해주세요" required name="user_addr3" id="detailAddress"/>
				<br/>
			</div>
		</div>	
		<!-- //주소란 끝 -->
		
		<!-- 가입완료 submit 버튼 -->
		<div class="form-row">
			<button type="button" class="btn btn-primary" id="btnModifyComp">수정완료</button>
			<button type="button" class="btn btn-danger">취소</button>
		</div>
		
	</form>
		</div>
	</div>
</div>
	</div>
</div>
<!-- //나의 정보 확인 -->

</div >
</body>


</content>
