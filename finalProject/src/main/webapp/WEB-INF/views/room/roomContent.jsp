<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	width: 50%;
	height: 50%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#floating-panel {
	position: absolute;
	top: 10px;
	left: 25%;
	z-index: 5;
	background-color: #fff;
	padding: 5px;
	border: 1px solid #999;
	text-align: center;
	font-family: 'Roboto', 'sans-serif';
	line-height: 30px;
	padding-left: 10px;
}
</style>

	
	<script>
		
     /*  function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 17,
          center: {lat: 37.566535, lng: 126.97796919999996}
        });
        var geocoder = new google.maps.Geocoder();
	
        geocodeAddress(geocoder, map);
        
      }
 */
      /* function geocodeAddress(geocoder, resultsMap) {
        var addr1 = document.getElementById('addr1').value;
        var addr2 = document.getElementById('addr2').value;
        var postnum = document.getElementById('postnum').value;
        geocoder.geocode({'address': addr1 + addr2 + postnum }, function(results, status) {
          if (status === 'OK') {
            resultsMap.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              map: resultsMap,
              zoom: 17,
            });
            var cityCircle = new google.maps.Circle({
                strokeColor: '#FF0000',
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: '#FF0000',
                fillOpacity: 0.35,
                map: resultsMap,
                center: results[0].geometry.location,
                radius: 100
              });
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      } */
      function golist() {
  		location.href="home.do";
  	  }
      function roomReq(){
    	  
      }
    </script>
<!-- <script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCbusV4tEDJhoqgUPVImHs8undZrTOaDEU&callback=initMap">
    </script> -->
<title>Insert title here</title>
</head>
<body>
	<c:set var="arr" value="${rdto}" />
	<input type="hidden" id="addr1" value="${arr.addr1}">
	<input type="hidden" id="addr2" value="${arr.addr2}">
	<input type="hidden" id="postnum" value="${arr.postnum}">
	숙소이름:${arr.roomname}
	<br> 설명
	<br>
	<textarea rows="10" cols="50">${arr.content}</textarea>
	<br> conv
	<br> ${arr.conv}
	<br> 안전시설
	<br> ${arr.safe}
	<br> 공간
	<br> ${arr.space}
	<br>

	<div id="map" style="width: 100%; height: 350px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=480ecaa22ccfdaea85bcf1452c80b3eb&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	var addr1 = document.getElementById('addr1').value;
	var addr2 = document.getElementById('addr2').value;
	var postnum = document.getElementById('postnum').value;
	var address = addr1 +addr2 + postnum;
	// 주소로 좌표를 검색합니다
		geocoder.addressSearch(document.getElementById('addr1')+document.getElementById('addr2').value+postnum = document.getElementById('postnum').value, function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {
	
	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	</script>
	
	<input type="button" value="목록으로" onclick="golist()">
	<input type="button" value="예약하기" onclick="roomReq()">
</body>
</html>