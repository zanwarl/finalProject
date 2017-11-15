<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
                document.getElementById('postnum').value = data.zonecode; //5자리 새우편번호 사용
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
<h1>숙소등록페이지</h1>
	<form name="roomadd.do" action="home.do" method="post">
 	<div>
 	<input type="hidden" name="useridx" value="${useridx}"><br>
 	방타입:<select name="btype">
 		<option value="집">집</option>
 		<option value="호텔">호텔</option>
 		<option value="기타">기타</option>
 	</select><br>
 	집타입:<select name="rtype">
 		<option value="집전체">집전체</option>
 		<option value="다인실">다인실</option>
 		<option value="개인실">개인실</option>
 	</select><br>
 	</div>
 
 	최대인원<input type="number" name="maxcount"><br>
 	
 	<input type="text" name="postnum" id="postnum" placeholder="우편번호">
	<input type="button" onclick="sample5_execDaumPostcode()" value="우편번호 찾기"><br>
	<input type="text" name="addr1" id="addr1" placeholder="주소"><br>
	<input type="text" name="addr2" id="addr2" placeholder="상세주소"><br>
	<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ea5cb03a486060e94b82b64937721b6d&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
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

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postnum').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
 	
 	편의시설<br>
 	<input type="checkbox" name="conv" value="필수품목">필수 품목(수건,침대시트,비누,화장지)<br>
 	<input type="checkbox" name="conv" value="무선인터넷">무선인터넷<br>
 	<input type="checkbox" name="conv" value="샴푸">샴푸<br>
 	<input type="checkbox" name="conv" value="옷장">옷장<br>
 	<input type="checkbox" name="conv" value="TV">TV<br>
 	<input type="checkbox" name="conv" value="난방">에어컨<br>
 	<input type="checkbox" name="conv" value="조식">조식,커피,차<br>
 	<input type="checkbox" name="conv" value="책상">책상/작업공간<br>
 	<input type="checkbox" name="conv" value="다리미">다리미<br>
 	<input type="checkbox" name="conv" value="헤어드라이기">헤어드라이기<br>
 	<div>안전시설<br>
 	<input type="checkbox" name="safe" value="연기감지기">연기감지기<br>
 	<input type="checkbox" name="safe" value="구급상자">구급상자<br>
 	<input type="checkbox" name="safe" value="소화기">소화기<br>
 	</div>
 	공간<br>
 	<input type="checkbox" name="space" value="개인거실">개인거실<br>
 	<input type="checkbox" name="space" value="부엌">부엌<br>
 	<input type="checkbox" name="space" value="세탁기">세탁기<br>
 	<input type="checkbox" name="space" value="건조기">건조기<br>
 	<input type="checkbox" name="space" value="주차">주차<br>
 	<input type="checkbox" name="space" value="엘리베이터">엘리베이터<br>
 	<input type="checkbox" name="space" value="헬스장">헬스장<br>
 	
 	<div>
 	내용<br>
 	<textarea name="content" rows="10" cols="60"></textarea><br>
 	방이름<input type="text" name="roomname"><br>
 	방가격<input type="number" name="roomprice"><br>
 	안돼는날자<input type="text" name="nodate"><br>
 	체크인<input type="text" name="checkin"><br>
 	체크아웃<input type="text" name="checkout"><br>
 	</div>
 	<input type="submit" value="등록">
 	</form>
</body>
</html>