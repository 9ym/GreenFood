<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/css_customerMemberJoinForm.css" />
<!-- 주소 가져오기 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function() {
		/* 헤더 배경화면, 게시판 이름 바꾸는 부분 */
		/* url 뒤에 사진 넣으면됩니다. */
		$("#page_background")
				.css(
						{
							"background-image" : "url('${path}/resources/images/login_dog.jpg')"
						});
		$("#page_background").css({
			"background-size" : "100% 100%"
		});
		$("#page_background").css({
			"background-repeat" : "no-repeat"
		});
		$("#boardNames").text("회원가입");/* 게시판 이름 */

		/*주소 찾기 버튼 클릭*/
		$("#btnFindPostalCode").click(function() {
			console.log("클릭");
			sample6_execDaumPostcode();
		
		});

		/*주소 찾기 함수*/
			 function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                   $("#detailAddress").val( extraAddr);
                
                } else {
                	$("#detailAddress").val( '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
               $("#postalCode").val(data.zonecode);
               $("#roadAddress").val(addr);
                // 커서를 상세주소 필드로 이동한다.
                $("#detailAddress").focus();
            }
        }).open();
    }
		
	});
</script>

<content>
<div id="first">
	<p>약관동의</p>
	<div>
		<input type="checkbox" required>이용약관에 동의합니다.(필수)</input>
		<button type="button" class="whiteBtn">전체보기</button>
		<br /> <input type="checkbox" required>개인정보취급방침에 동의합니다.(필수)</input>
		<button type="button" class="whiteBtn">전체보기</button>
		<br /> <input type="checkbox" required>본인은 만 14세 이상입니다.(선택)</input><br />
		<input type="checkbox" required>문자 수신에 동의합니다.(선택)</input><br /> <input
			type="checkbox" required>이메일 수신에 동의합니다.(선택)</input>
	</div>
	<input type="checkbox">이용약관,개인정보취급방침,문자,이메일 수신에 모두 동의합니다.</input>
</div>

<div id="second">
	<p>필수정보입력</p>
	<div>
		<table>
			<thead>
				<th>구분</th>
				<th>구매회원</th>
			</thead>
			<tbody>
				<tr>
					<td>이름</td>
					<td><input style="width: 100%;" type="text"
						placeholder="이름을 입력해주세요" required /></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" style="width: 150px;"
						placeholder="아이디를 입력해주세요" required />
					<button id="btnIdDupChk">중복확인</button></td>

				</tr>
				<span id="span_idDupChk">중복검사결과표시하는곳.display_none</span>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" style="width: 100%;"
						placeholder="공백없는 소문자 몇자로하냐..ㅠㅠ" required /></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" style="width: 100%;"
						placeholder="비밀번호 확인을 위해 한번 더 입력해주세요" required /></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><select>

							<option>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>019</option>
					</select> - <input type="text" style="width: 70px;" required /> - <input
						type="text" style="width: 70px;" required /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td style="margin: 0 auto;"><input type="text"
						style="width: 120px;" placeholder="" required /> @ <input
						type="text" style="width: 180px;" placeholder="" required /> <select
						id="selectEmail">
							<option>직접입력</option>
							<option>gmail.com</option>
							<option>naver.com</option>
							<option>nate.com</option>
							<option>hanmail.net</option>
							<option>hotmail.com</option>
					</select></td>
				</tr>
				<tr rowspan="3">
					<td>주소<br> (기본배송지)
					</td>
					<td><input type="text" placeholder="우편번호" required
						id="postalCode" />
						<button type="button" style="width: 120px;" id="btnFindPostalCode">우편번호
							찾기</button></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="text" style="width: 100%;"
						placeholder="주소를 입력해주세요" required id="roadAddress" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="text" style="width: 100%;"
						placeholder="상세주소를 입력해주세요" required id="detailAddress" /></td>
				</tr>
			</tbody>
		</table>
	</div>

</div>

<div id="underBtns">
	<button type="button">가입완료</button>
	<button type="button">취소</button>
</div>
</content>