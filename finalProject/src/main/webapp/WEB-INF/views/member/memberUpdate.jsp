<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

function pwd(){
	var member_pwd = document.getElementById("member_pwd").value;
	var member_pwd2 = document.getElementById("member_pwd2").value;
	
	if(member_pwd == member_pwd2 && member_pwd2 != null){
		document.getElementById("pwd3").value = "비밀번호가 일치합니다.";
	}else{
		document.getElementById("pwd3").value = "일치하지 않습니다.";
	}
}

</script>
<style>
.content {
	padding-left: 400px;
	padding-bottom: 50px;
}
#title {
	padding-bottom: 50px;
}
#bot {
	padding-left: 150px;
	padding-top: 50px;
}
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<h2 align="center" id="title">회원 정보수정</h2>
<div id="contents">
<div class="content">
<form name="memberJoin" action="memberUpdate.do" method="post">
<table align="center" style="text-align: left;">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="member_id" placeholder="아이디" maxlength="16" readonly value="${sId }">
		</td>
	</tr>
	
	<tr>
		<th>비밀번호</th>
		<td><input type="password" id="member_pwd" name="member_pwd" placeholder="비밀번호"></td>
	</tr>
	<tr>
		<th>비밀번호확인</th>
		<td><input type="password" id="member_pwd2" name="member_pwd2" placeholder="비밀번호확인" onkeyup="pwd()">&nbsp;
		<input type="text" id="pwd3" name="pwd3" readonly style="background-color:transparent;border:0 solid black;text-align:left; color: #FF6000; font: 7pt 돋움;">
		
		</td>
	</tr>
	
	<tr>
		<th>전화번호</th>
		<td><select name="member_tel">
								<option value="">선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select> - <input type="text" name="member_tel" 
								size="4" maxlength="4"> - <input type="text"
								name="member_tel" size="4"
								maxlength="4"></td>
	</tr>
	<tr>
		<th>E-mail</th>
		<td><input type="text" name="member_email" placeholder="이메일"></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="member_addr" id="sample6_postcode" placeholder="우편번호" readonly>
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" name="member_addr" id="sample6_address" placeholder="주소" readonly>
<input type="text" name="member_addr" id="sample6_address2" placeholder="상세주소">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
		</td>
	</tr>
	
	
</table>

<p id="bot">
		
			<input type="submit" value="회원정보수정">
			<input type="reset" value="다시작성">
		
	</p>
</form>
</div></div>
<%@ include file="../footer.jsp" %>
</body>
</html>