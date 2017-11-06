<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#cityList {
  background: #FFBB00;
  float: left;
  width: 300px;
  height: 950px;
}
#map {
  width: auto;
  height: 950px;
  position:relative;
 }
#select_detail_view_city{
	position:absolute;
	width:310px;
	height:auto;
	left:310px;
	top:380px;
	padding-bottom:20px;
	background:#fff;
	border-radius:5px;
	display:none;
}
.detail_view_full_box{
	z-index:130000000;
}

.cityItem:active .detail_view_full_box{
	display:block;
}

 
</style>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$.ajax({
		url:"areaCode.do",
		type:"POST",
		dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
		
		success : function(msg) {
			// console.log(msg.response.body.items.item);
			var myItem = msg.response.body.items.item;
			        	   
			var output = '';
			for(var i=0; i<myItem.length; i++){
			output += '<h4 class="cityItem">'+myItem[i].name+'</h4>';
			}
			$("#cityList").html(output);
			},
		error : function(xhr, status, error) {
			alert("에러발생");
		}
	});
});
</script>
<script>
function initMap() {
	//마커 위치 초기화
	var initLoc = [
					['서울',37.567874, 126.987895],
				    ['인천',37.491034, 126.707597],
				    ['경기',37.411543, 127.514934],
				    ['대전',36.373976, 127.388284],
				    ['대구',35.869106, 128.561676],
				    ['광주',35.153961, 126.834019],
				    ['부산',35.168423, 129.039288],
				    ['울산',35.548319, 129.245663],
				    ['세종',36.566003, 127.257765],
				    ['강원',37.823038, 128.156857],
				    ['충북',37.000694, 127.709422],
				    ['충남',36.703444, 126.798422],
				    ['경북',36.264092, 128.931699],
				    ['경남',35.458897, 128.221178],
				    ['전북',35.701074, 127.124440],
				    ['전남',34.882915, 126.982925],
				    ['제주',33.392589, 126.549532]
				  ];
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom: 8,
		center: new google.maps.LatLng(36.733956, 127.806931),
	});
	var marker, i;
	//지도에 마커 띄우기
    for (i = 0; i < initLoc.length; i++) {
    	marker = new google.maps.Marker({
    		position: new google.maps.LatLng(initLoc[i][1],initLoc[i][2]),
    		map: map
    	});
    }
}
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<div id="contents"><!-- contents -->

	<div id="cityList"><!-- cityList -->
	</div><!-- cityList -->
	<div id="map" style="overflow:auto;">
	</div><!-- map -->
	<div id="select_detail_view_city">
		<div class="detail_view_full_box">
			zzfffff
				fffff
				ffff
			</div>
		</div>
</div><!-- contents -->

	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDRvbbQ3ZU5pL6Q-JngNfSgfoO61PatCUw&callback=initMap">
	</script>
<%@ include file="../footer.jsp" %>
</body>
</html>