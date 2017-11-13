<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="text/javascript">
        
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
                    document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                    document.getElementById('addr1').value = fullAddr;

                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById('addr2').focus();
                }
            }).open();
        }
    </script>
<title>Insert title here</title>
</head>
<body>
<section>
	<article>
		<h2>음식점 등록</h2>
		<form name="addFood" action="addFood.do"  method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>가게이름</th>
				<td><input type="text" name="fname"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="user_id"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="number" name="fpay"></td>
			</tr>
			<tr>
				<th>오픈시간</th>
				<td><input type="text" name="opentime"></td> 
			</tr>
			<tr>
				<th>클로즈시간</th>
				<td><input type="text" name="closetime"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly>
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="addr1" name="addr1" size="50" placeholder="도로명주소" readonly><br>
					<input type="text" id="addr2" name="addr2" size="50" placeholder="지번주소"></td>
			</tr>
			<tr>
				<th>예약가능인원</th>
				<td><input type="number" name="pcount"></td>
			</tr>
			<tr>
				<th>가게설명</th>
				<td colspan="4">
					<textarea rows="10" cols="80" name="fcontent">
					</textarea>
				</td>
			</tr>
			<tr>
				<td>
				<input type="submit" value="다음">
				<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
		</form> 
	</article>
</section>
</body>
</html>