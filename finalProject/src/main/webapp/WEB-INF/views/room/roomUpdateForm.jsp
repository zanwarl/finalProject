<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=UTF-8">

	<!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    <!-- Custom style -->
    <link rel="stylesheet" href="css/style1.css" media="screen" title="no title" charset="utf-8">

<link rel="stylesheet" href="css/remodal.css">
<link rel="stylesheet" href="css/remodal-default-theme.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<!-- loads jquery and jquery ui -->
<script src="js/jquery-3.2.1.js"></script>
<script src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/jquery-ui.multidatespicker.js"></script>

<script>
//header에 있는 js와 충돌나서 noConflict설정
var today = new Date();
var jq = $.noConflict();
jq(document).ready(function() {
	
	var conv = document.getElementById("conv").value;
	var arrConv = conv.split(',');
	
    jq('.conv').prop('checked', false); // 일단 모두 uncheck

    for (var nArrCnt in arrConv) {
       jq("input[name=conv][value="+arrConv[nArrCnt]+"]").prop("checked",true);
     }
    
    var safe = document.getElementById("safe").value;
	var arrSafe = safe.split(',');
	
    jq('.safe').prop('checked', false); // 일단 모두 uncheck

    for (var nArrCnt in arrSafe) {
       jq("input[name=safe][value="+arrSafe[nArrCnt]+"]").prop("checked",true);
     }    
    
    var space = document.getElementById("space").value;
	var arrSpace = space.split(',');
	
    jq('.space').prop('checked', false); // 일단 모두 uncheck

    for (var nArrCnt in arrSpace) {
       jq("input[name=space][value="+arrSpace[nArrCnt]+"]").prop("checked",true);
     }    

	jq("#datepicker").multiDatesPicker({
		minDate: 0,
		maxDate: 30,
		dateFormat: 'yy/mm/dd' //데이터포멧(ex - 2012.12.13)
  	});
	
});

function goList() {
	location.href = "home.do";
}
</script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header.jsp" %>
 <article class="container">
 <form name="room.do" action="roomUpdate.do" method="post">
   <div class="page-header">
	<h1>숙소수정페이지</h1>
	<c:set var="r" value="${rdto}" />
	<input type="hidden" name="roomidx" value="${r.roomidx}">
 	<input type="hidden" name="useridx" value="${r.useridx}"><br>     
        </div>
        <div class="col-md-6 col-md-offset-3">
		    <div class="form-group">
		      <label for="sel1">방타입</label>
		      <select class="form-control" id="btype" name="btype">
		        <option value="집">집</option>
		        <option value="호텔">호텔</option>
		        <option value="기타">기타</option>
		      </select>
		    </div>
		    <div class="form-group">
		      <label for="sel1">집타입</label>	      
		      <select class="form-control" id="rtype" name="rtype">
		        <option value="집전체">집전체</option>
		        <option value="다인실">다인실</option>
		        <option value="개인실">개인실</option>
		      </select>
		    </div>
            <div class="form-group">
              <label for="roomname">숙소이름</label>
              <input type="text" class="form-control" id="roomname" name="roomname" value="${r.roomname}" placeholder="숙소이름">
            </div>
            <div class="form-group">
              <label for="roomprice">숙소가격</label>
              <input type="text" class="form-control" id="roomprice" name="roomprice" value="${r.roomprice}" placeholder="숙소가격">
            </div>
             <div class="form-group">
              <label for="nodate">안되는날짜</label>
              <input type="text" class="form-control" id="datepicker" name="nodate" value="${r.nodate}" placeholder="안되는날짜" readonly="readonly">
            </div>
             <div class="form-group">
              <label for="checkin">체크인시간</label>
              <input type="text" class="form-control" id="checkin" name="checkin" value="${r.checkin}" placeholder="체크인">
            </div>
            <div class="form-group">
              <label for="checkout">체크아웃시간</label>
              <input type="text" class="form-control" id="checkout" name="checkout" value="${r.checkout}" placeholder="체크아웃">
            </div>
             <div class="form-group">
              <label for="roomprice">최대인원</label>
              <input type="number" class="form-control" id="maxcount" name="maxcount" value="${r.maxcount}" placeholder="최대인원">
            </div>
            <div class="form-group">
              <label for="addr">주소</label>
              <div class="input-group">
                <input type="text" class="form-control" id="postnum" name="postnum" value="${r.postnum}" placeholder="우편번호">
                <span class="input-group-btn">
                  <button class="btn btn-success" type="button"onclick="sample5_execDaumPostcode()">주소검색<i class="spaceLeft"></i></button>
                </span>               
              </div>
              	<input type="text" class="form-control" id="addr1" name="addr1" value="${r.addr1}" placeholder="기본주소">
              	<input type="text" class="form-control" id="addr2" name="addr2" value="${r.addr2}" placeholder="상세주소">
    	 </div>
	   <div id="map" style="width: 100%; height: 350px; display: none"></div>
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
 	

     <label for="conv">Conv</label>
     <input type="hidden" id="conv" value="${r.conv}">
            <div class="checkbox">
			  <label><input type="checkbox" name="conv" value="필수품목">필수품목(수건,침대시트,비누,화장지)</label>
			  <label><input type="checkbox" name="conv" value="무선인터넷">무선인터넷</label>
			  <label><input type="checkbox" name="conv" value="샴푸">샴푸</label><br>
			  <label><input type="checkbox" name="conv" value="TV">TV</label>
			  <label><input type="checkbox" name="conv" value="옷장">옷장</label>
			  <label><input type="checkbox" name="conv" value="난방">난방</label>
			  <label><input type="checkbox" name="conv" value="헤어드라이기">헤어드라이기</label>
			  <label><input type="checkbox" name="conv" value="에어컨">에어컨</label><br>
			  <label><input type="checkbox" name="conv" value="조식">조식,커피,차</label>
			  <label><input type="checkbox" name="conv" value="책상">책상/작업공간</label>
			  <label><input type="checkbox" name="conv" value="다리미">다리미</label><br> 
			</div>
			<label for="safe">안전시설</label>
			<input type="hidden" id="safe" value="${r.safe}">
			<div class="checkbox">
				<label><input type="checkbox" name="safe" value="연기감지기">연기감지기</label>
				<label><input type="checkbox" name="safe" value="구급상자">구급상자</label>
				<label><input type="checkbox" name="safe" value="소화기">소화기</label>
			</div>
			<label for="space">개인공간</label>
			<input type="hidden" id="space" value="${r.space}">
			<div class="checkbox">
				<label><input type="checkbox" name="space" value="개인거실">개인거실</label>
				<label><input type="checkbox" name="space" value="부엌">부엌</label>
				<label><input type="checkbox" name="space" value="세탁기">세탁기</label><br>
				<label><input type="checkbox" name="space" value="건조기">건조기</label>
				<label><input type="checkbox" name="space" value="주차">주차</label>
				<label><input type="checkbox" name="space" value="엘리베이터">엘리베이터</label>
				<label><input type="checkbox" name="space" value="헬스장">헬스장</label><br>
			</div>
			
            <div class="form-group">
			  <label for="comment">숙소설명:</label>
			  <textarea class="form-control" rows="5" id="content" name="content">${r.content}</textarea>
			</div>
            
          
            <div class="form-group text-center">
              <button type="submit" class="btn btn-info">수정완료<i class="fa fa-check spaceLeft"></i></button>
              <button type="button" class="btn btn-warning" onclick="goList()">수정취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
        </div>
     </form>
</article>
 <%@ include file="../footer.jsp" %>
</body>
</html>