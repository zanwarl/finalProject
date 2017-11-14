<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/remodal.css">
<link rel="stylesheet" href="css/remodal-default-theme.css">
<link rel="stylesheet" href="css/pikaday.css">
<link rel="stylesheet" href="css/site.css">

<style>
#left_box {
	width: 550px;
	float: left;
}

#right_box {
	width: 800px;
	float: left;
}

#planList {
	backgroud: skyblue; 
	width: 40%;
	float: left;
	height: 950px;
}

#cityList {
  background: #FFBB00;
  float: left;
  width: 60%;
  height: 850px;
}
#map {
  width: auto;
  height: 850px;
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

.add {
	float: left;
}

.img {
	float: left;
}
.info {
	float: left;
	font-size: 13px;
	
}
.wrap_cityList {
	height: 120px;
}

#search {
	height: 200px;
	background: white;
}

#top_bar {
	height: 100px;
	background: #FFE08C;
}
</style>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
var add_img = '';


$(document).ready(function() {	
	var cp = 1;
	$.ajax({
		url:"areaBasedList.do?areaCode=1&cp="+cp,
		type:"GET",
		dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
		success : function(msg) {
		// console.log(msg.response.body.items.item);
		var myItem = msg.response.body.items.item;
		
		
		var totalCnt = msg.response.body.totalCount;
		var pageName = 'city.do?areaCode='+ 1;
		var listSize = 10;
		var pageSize = 5;
		
		var queryStr = '123123';
		
		var output = '';
		
		$.each(myItem, function(key, val) {
			output += '<div class="wrap_cityList ui-draggable" data-no="'+key+'" data-val="'+val.title+'" data="'+val.contentid+'" data-type="'+val.contenttypeid+'">';
			if(val.firstimage == null) {
				output += '<div class="img" fl="'+val.firstmiage+'"><img src="img/notimage.png" width="100" height="100"></div>'; 
			} else {
				output += '<div class="img" fl='+val.firstimage+'"><img src="'+val.firstimage+'" width="100" height="90"></div>';
			}
			output += '<div class="info">'+val.title+'</div>';
			output += '<div class="add"><img src="img/plan/add_button.png" width="17"></div>';
			output += '<input type="hidden" name="contentid" value="'+val.contentid+'">';
			output += '<input type="hidden" name="contentid" value="'+val.contenttypeid+'">';
			output += '</div>';
		});
		
		$('#cityList').append(output);
		/* $("#cityList").html(output); */
		},
		error : function(xhr, status, error) {
			alert("에러발생");
		}
	});
	/* ---ajax end--- */
	var order = 1;
	/* 여행지 선택 시 div 복사해서 추가 */
	$('#cityList').on('click','.add',function() {
		add_title = $(this).parent().attr('data-val');
		add_code = $(this).parent().attr('data');
		add_type = $(this).parent().attr('data-type');
		
		
		//add_img = $(this).parent().children('.img').attr('fl');
		add_img = $(this).parent().children('.img').attr('fl');
		
		var output = '';
		
		output += '<div class="list_item" data="'+order+'" data-type="'+add_type+'" data-code="'+add_code+'">';
		output += '<div class="item_img"><img src="'+add_img+'" width="100" height="90"></div>';
		output += '<div class="item_title">'+add_title+'</div>';
		output += '<input type="hidden" id="add_code" name="add_code" value="'+add_code+'">';
		output += '<input type="hidden" id="add_type" name="add_type" value="'+add_type+'">';
		output += '</div>';
		order++;
		$('#planList').append(output);
		
	});
	
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
<script src="js/pikaday.js"></script>
</head>
<body>
<%@ include file="../header.jsp" %>
<script src="js/jquery-3.2.1.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/json2.js"></script>
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
<div id="contents"><!-- contents -->
	<div id="top_bar">
		<div class="remodal-bg"><a href="#modal">저장하기</a></div>
	</div>
	<div id="left_box">
		<div id="planList" style="overflow:auto;">일정 리스트</div>
		<div id="cityList" style="overflow:auto;">
			<div id="search">
				${areaCode }
			</div>
		</div>
	</div>
	
	<div id="right_box">
		<!-- map -->
		<div id="map" style="overflow:auto;"></div>
	</div>
	
	<div id="select_detail_view_city">
		<div class="plan_full_box">
			<div class="plan_main_name"></div>
			<div class="plan_main_make" onclick="plan()"></div>
		</div>
	</div>

<!-- modal div start -->
<div class="remodal" data-remodal-id="modal" role="dialog" aria-labelledby="modal1Title" aria-describedby="modal1Desc">
	<button data-remodal-action="close" class="remodal-close" aria-label="Close"></button>
		<div>
			<h2 id="modal1Title">일정만들기 완료</h2>
			<div class="modal_content">
				<form name="plan_make" action="planDetailWrite.do">
				<!-- <form name="plan_make" action="planDetailWrite.do"> -->
				<script>
				function submit() {

					var nlist = '';
					var count = '0';
					
					var p_writer = '';
					var txt = '';
					
					$('.list_item').each(function(key,val){
						count++;
					});
					
					var array = new Array();
					
					$('.list_item').each(function(key,val){
						/* txt += 'order?' + $(this).attr('data');
						txt += 'type?' + $(this).attr('data-type');
						txt += 'code?' + $(this).attr('data-code');
						txt += 'title?' +$(".item_title").eq(key).html();
						txt += 'img?' + $(".item_img img").eq(key).attr('src');*/
						
						order = $(this).attr('data');
						type = $(this).attr('data-type');
						code = $(this).attr('data-code');
						title = $(".item_title").eq(key).html();
						img = $(".item_img img").eq(key).attr('src');
						/* alert($("#add_code").val());
						alert($("#add_type").val()); */
						//array[key] = txt;
						
						var planInfo = new Object();
						
						writer = $("#plan_writer").val();
						
						
						planInfo.order = order;
						planInfo.type = type;
						planInfo.code = code;
						planInfo.title = title;
						planInfo.img = img;
						
						array.push(planInfo);
						
					});
					
					var jsonInfo = JSON.stringify(array);
					$('#str').val(jsonInfo);
					//var jsonInfo = {"datalist":JSON.stringify(array)};
					console.log(jsonInfo); //브라우저 f12개발자 모드에서 confole로 확인 가능
					
					
				document.plan_make.submit();
				}
				
				</script>
					<table>
						<tbody>
							<tr>
								<th>여행 제목</th>
								<td><input type="text" name="plan_subject"></td>
							</tr>
							<tr>
								<th>출발일</th>
								<td><input type="text" id="plan_start" name="plan_start" id="datepicker"></td>
							</tr>
							<tr>
								<th>설명</th>
								<td><textarea name="plan_explain" cols="20" rows="5"></textarea></td>
							</tr>
							<tr>
								<td colspan="2"><hr>비공개 <input type="checkbox" name="plan_public"></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>	
								<td>
									<!-- form에서 넘겨줘야 할 데이터 -->
									<!-- 작성자,areacode -->
									<input type="hidden" id="plan_writer" name="plan_writer" value="${sIdx }">
									<input type="hidden" name="plan_name" value="${sName }">
									<input type="hidden" id="str" name="str">
									<input type="text" id="plan_idx" name="plan_idx" value=${plan_idx }>
								</td>
							</tr>
						</tfoot>
					</table>
				<button data-remodal-action="cancel" class="remodal-cancel">취소</button>
				<button class="remodal-confirm" onclick="submit();">완료</button>
				<a href="javascript:submit()">[완료]</a> 
				<!-- <a class="remodal-confirm" href="planDetail.do">완료</a> -->
				</form>
			</div>	
		</div>
</div>
<!-- modal div end -->
</div><!-- contents -->

	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDRvbbQ3ZU5pL6Q-JngNfSgfoO61PatCUw&callback=initMap">
	</script>
<%@ include file="../footer.jsp" %>
</body>
</html>