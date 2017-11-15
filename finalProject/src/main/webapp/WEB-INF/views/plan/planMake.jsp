<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/remodal.css">
<link rel="stylesheet" href="css/remodal-default-theme.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<style>
#cityList {
  background: #FFFFC6;
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
	height:200px;
	left:350px;
	top:400px;
	padding-bottom:20px;
	background:#fff;
	border-radius:5px;
	display:none;
}
.plan_full_box{
	z-index:130000000;  //0 7개
}

.cityItem:active .plan_full_box{
	display:block;
}
.remodal-bg.with-red-theme.remodal-is-opening,
.remodal-bg.with-red-theme.remodal-is-opened{
	filter: none;
}
</style>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	/* ----ajax start--- */
	$.ajax({
		url:"areaCode.do",
		type:"POST",
		dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
		
		success : function(msg) {
			var myItem = msg.response.body.items.item;
			        	   
			var output = '';
				
			//도시 리스트 뿌려주는 div 배열
			$.each(myItem, function(key, val) {
				output += '<div class="wrap_cityList" data-no="'+key+'" data-val="'+val.name+'" data="'+val.code+'">'
				output += '<div class="info">'+val.name+'</div>';
				output += '<div class="add"><img src="img/plan/add_button.png" width="17"></div>';
				output += '</div>';
			});
			
			$("#cityList").html(output);
			},
			
		error : function(xhr, status, error) {
			alert("에러발생");
		}
	});
	/* ---ajax end-- */
	

	$('#cityList').on('click','.add',function(){
		//부모? div의 attribute 읽어와서 저장
		name = $(this).parent().attr('data-val');
		code = $(this).parent().attr('data');
		$('#select_detail_view_city').show();
		
		$('#plan_city_list').each(function() {
			var html = '<div class="city_info">'+name+'</div>';
			$('#plan_city_list').append(html);
		});
	});
	
	/* var picker = new Pikaday(
	{
	    field: document.getElementById('datepicker'),
	    firstDay: 1,
	    minDate: new Date(),
	    maxDate: new Date(2020, 12, 31),
	    yearRange: [2000,2020]
	});  */
});
</script>
<script src="js/remodal.js"></script>
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

function plan() {
	window.alert("zzz");
}

function plan_display() {
	var con = document.getElementById("select_detail_view_city");
	
	if(con.style.display=='none'){
		con.style.display = 'block';
	}else{
		con.style.display = 'none';
	}
}
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<div id="contents"><!-- contents -->
	<div id="contents_header">
		<a href="plan.do">닫기</a>
	</div>
		<div id="cityList" style="overflow:auto;"><!-- cityList -->
		</div><!-- cityList -->
		
		<div id="map" style="overflow:auto;">
		</div><!-- map -->
		
	
<script src="js/jquery-3.2.1.js"></script>
<script src="js/jquery-ui.js"></script>
<script>
//header에 있는 js와 충돌나서 noConflict설정
var jq = $.noConflict();

jq(document).ready(function() {
	
	jq("#datepicker").datepicker({
		dateFormat: 'yy-mm-dd' //데이터포멧(ex - 2012.12.13)
  	});
	
	jq(".modal_content #datepicker").datepicker({
		dateFormat: 'yy-mm-dd'
	});
});
</script>

		<!-- 도시 선택 시 띄워주는 화면 -->
		<div id="select_detail_view_city">
			<div id="plan_date">
				여행도시 출발일
				<input type="text" name="plan_start" id="datepicker">
			</div>
			
			<!-- 클릭 시 도시 리스트 추가 -->
			<div id="plan_city_list">
			</div>
			
			<div class="plan_make">
				<div class="plan_main_name"></div>
				<div class="remodal-bg"><a href="#modal">상세 일정만들기</a></div>
			</div>
		</div>

		<!-- modal div start -->	
		<div class="remodal" data-remodal-id="modal" role="dialog" aria-labelledby="modal1Title" aria-describedby="modal1Desc">
			<button data-remodal-action="close" class="remodal-close" aria-label="Close"></button>
				<div>
					<h2 id="modal1Title">출발일 선택</h2>
					<div class="modal_content">
						<form name="plan_make" action="planMainSaveDb.do">
							<table>
								<tbody>
									<tr>
										<th>여행 제목</th>
										<td><input type="text" name="plan_subject"></td>
									</tr>
									<tr>
										<th>출발일</th>
										<td><input type="text" name="plan_start" id="datepicker"></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>	
										<td>
											<!-- form에서 넘겨줘야 할 데이터 -->
											<!-- 작성자,areacode -->
											<input type="hidden" name="plan_writer" value="1">
											<input type="hidden" name="area_code" value="1">
											
										</td>
									</tr>
								</tfoot>
							</table>
						<button data-remodal-action="cancel" class="remodal-cancel">취소</button>
						<button class="remodal-confirm">완료</button>
						<!-- <a class="remodal-confirm" href="planDetail.do">완료</a> -->
						</form>
					</div>
				</div>
		</div>
		<!-- modal div end -->
		<!-- Datepicker -->
</div><!-- contents -->

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDRvbbQ3ZU5pL6Q-JngNfSgfoO61PatCUw&callback=initMap">
</script>
<%@ include file="../footer.jsp" %>
</body>
</html>