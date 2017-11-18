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
	height: 850px;
}

#cityList {
  background: #FFBB00;
  float: left;
  width: 60%;
  height: 850px;
}
#cityContent {
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
	cursor: pointer;
}

.list_item {
	cursor: pointer;
}
.form_cityList {
	overflow:auto;	
	height: 620px;
}
#search {
	height: 180px;
	background: white;
}

#top_bar {
	height: 100px;
	background: #FFE08C;
}
</style>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript">
var add_img = '';
var initLoc = new Array();

var contentArray = [];
var iConArray = [];
var markers = [];
var iterator = 0;
var markerArray = [];

var markers = [];

var initx = '';
var inity = '';


	var cp = 1;
	function initxy() {
		/* ---ajax start--- */
		$.ajax({
			url:"areaBasedList.do?areaCode=${pdto.plan_place}&cp="+cp,
			type:"GET",
			dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
		 	async:false, // 이 한줄만 추가해주시면 됩니다.
			success : function(msg) {
			// console.log(msg.response.body.items.item);
			var myItem = msg.response.body.items.item;
			
			
			var totalCnt = msg.response.body.totalCount;
			var pageName = 'city.do?areaCode='+ 1;
			var listSize = 10;
			var pageSize = 5;
			
			var queryStr = '123123';
			
			var output ='<div class="form_cityList">';
			
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
				
	
				contentArray[key] = val.title;
				markerArray[key] = new google.maps.LatLng(val.mapy,val.mapx);
				inity = val.mapy;
				initx = val.mapx;
			});
			output += '</div>';
			
			$('#cityList').append(output);
			/* $("#cityList").html(output); */
			},
			error : function(xhr, status, error) {
				alert("에러발생");
			}
		});
	}
	/* ---ajax end--- */
	
$(document).ready(function() {	
	/* order 번호 1로 초기화. 수정시엔 마지막 order 번호 받아서 추가 */
	var compareOrder = '${lastOrder}';
	var order = 1;	
	if(compareOrder == null) {
		order = 1;
	} else if(compareOrder>1) {
		order = parseInt(compareOrder)+1; 
	}
	/* 여행지 선택 시 요소 구해서 새로 div append */
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
	
	$('#cityList').on('mouseover','.wrap_cityList',function() {
		var no = $(this).attr('data-no');
		markers[no].setIcon('img/mouseovermarker.png');  

	});
	
	$('#cityList').on('mouseout','.wrap_cityList',function() {
		var no = $(this).attr('data-no');
		markers[no].setIcon('img/defaultmarker.png');  

	});
	
	$('#cityList').on('click','.wrap_cityList',function() {
		var no = $(this).attr('data-no');
		alert(no);

	});
	
	
});
	
//header에 있는 js와 충돌나서 noConflict설정
var jq = $.noConflict();

jq(document).ready(function() {
	
	jq(function () {
	    jq("#planList").sortable({
	    	 revert: false,
	         items : '.list_item',
	         start: function (e, ui) {
				$(ui.placeholder).css('width', 0);
			},
			change: function (e, ui) {
				$(ui.placeholder).css('width', 'auto');
			},
			placeholder: "ui-state-highlight",
			
			//div order 순서 재정렬
			update: function(e,ui) {
				 var cur_order = ui.item.attr('data');
				 var set_order = Number($("#planList .list_item").index(ui.item))+1;
				 var jj = 1;
		          $('#planList .list_item').each(function(ii, val) {
		              $(this).attr('data',jj);
		              jj++;
		          });
		        ui.item.attr('data',set_order);
			}
	    });
	    
	    jq('.orderList').on('click', function() {
	    	var arrange = jq(this).attr('data-val');
	    	$('.form_cityList').remove();
	    	
	    	$.ajax({
				url:"areaBasedList.do?areaCode=${pdto.plan_place}&cp="+cp+"&arrange="+arrange,
				type:"GET",
				dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			 	async:false, // 이 한줄만 추가해주시면 됩니다.
				success : function(msg) {
				// console.log(msg.response.body.items.item);
				var myItem = msg.response.body.items.item;
				
				
				var totalCnt = msg.response.body.totalCount;
				var pageName = 'city.do?areaCode='+ 1;
				var listSize = 10;
				var pageSize = 5;
				
				var queryStr = '123123';
				
				var output ='<div class="form_cityList">';
				
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
					
		
					contentArray[key] = val.title;
					markerArray[key] = new google.maps.LatLng(val.mapy,val.mapx);
					inity = val.mapy;
					initx = val.mapx;
				});
				output += '</div>';
				initMap2();
				
				$('#cityList').append(output);
				/* $("#cityList").html(output); */
				},
				error : function(xhr, status, error) {
					alert("에러발생");
				}
			});
	    });
	    
	    
	    
	    jq('#tour_search').keyup(function(e) {
	    	var txt = $(this).val();
	    	/* var txt = '';
	    	switch (e.which)
			{
				case 16: break; // Shift
				case 17: break; // Ctrl
				case 18: break; // Alt
				case 27: this.value = ''; break; // Esc: clear entry
				case 35: break; // End
				case 36: break; // Home
				case 37: break; // cursor left
				case 38: break; // cursor up
				case 39: break; // cursor right
				case 40: break; // cursor down
				case 78: break; // N (Opera 9.63+ maps the "." from the number key section to the "N" key too!) (See: http://unixpapa.com/js/key.html search for ". Del")
				case 110: break; // . number block (Opera 9.63+ maps the "." from the number block to the "N" key (78) !!!)
				case 190: break; // .
				default:
					txt= $("#tour_search").val();
				// add your code here which will execute by default
		    } */
	    	jq.ajax({
            	url:"tourSearch.do?txt="+ encodeURI(encodeURIComponent(txt)) +"&areaCode=${pdto.plan_place}&cp="+cp,
				type:"GET",
				dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
                success : function(msg) {
                	
                	//배열 초기화
                	contentArray = [];
       				markerArray = [];
                	
                	jq('.form_cityList').remove();
                	// console.log(msg.response.body.items.item);
        			var myItem = msg.response.body.items.item;
        			
        			
        			var totalCnt = msg.response.body.totalCount;
        			console.log(totalCnt);
        			var pageName = 'city.do?areaCode='+ 1;
        			var listSize = 10;
        			var pageSize = 5;
        			
        			var queryStr = '123123';
        			
        			var output ='<div class="form_cityList">';
        			var tmp = '';
        			jq.each(myItem, function(key, val) {
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
        				
        	
        				contentArray[key] = val.title;
        				markerArray[key] = new google.maps.LatLng(val.mapy,val.mapx);
        				inity = val.mapy;
        				initx = val.mapx;
        				
        				
        				
        			});
        			output += '</div>';
        			initMap2();
        			jq('#cityList').append(output);
        			},
        			error : function(xhr, status, error) {
        				alert("에러발생");
        			}
        			
            }); // end ajax
            
            
	    });
	});

});
</script>
<script src="js/remodal.js"></script>
<script>
function initMap() {
	//마커 위치 초기화
	initxy();
	/* alert("t");
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom: 8,
		center: new google.maps.LatLng(36.733956, 127.806931),
	});
				  
  	for (var i=0;i<markerArray.length;i++) {
  		addMarker();
  	} */
  	 var mapOptions = {
  	        zoom: 10,
  	        mapTypeId: google.maps.MapTypeId.ROADMAP,
  	        //각 지역의 중심 좌표로
  	        center: new google.maps.LatLng(inity, initx)
  	    };
  	 
  	    map = new google.maps.Map(document.getElementById('map'),mapOptions);
  	 
  	    for (var i = 0; i < markerArray.length; i++) {
  	        addMarker();
  	    }
}

function initMap2() {
	//iterator 초기화
	iterator = 0;
	
	var mapOptions = {
  	        zoom: 10,
  	        mapTypeId: google.maps.MapTypeId.ROADMAP,
  	        //각 지역의 중심 좌표로
  	        center: new google.maps.LatLng(inity, initx)
  	    };
  	 
  	    map = new google.maps.Map(document.getElementById('map'),mapOptions);
  	    for (var i = 0; i < markerArray.length; i++) {
  	        addMarker();
  	    }
}

function addMarker() {
	//지도에 마커 띄우기
	var img = 'img/defaultmarker.png';
   	var marker = new google.maps.Marker({
   		position: markerArray[iterator],
   		map: map,
   		icon: img
   	});
	markers.push(marker);
	
	var infowindow = new google.maps.InfoWindow({
	      content: contentArray[iterator]
	    });
	
	google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map,marker);
    });
	google.maps.event.addListener(marker, 'mouseover', function(){
	});  
	
	iterator++;
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
		<div id="planList" style="overflow:auto;">일정 리스트
			<c:forEach var="list" items="${list }">
				<div class="list_item" data="${list.pland_order }" data-type="${list.pland_typeid }" data-code="${list.pland_code }">
				<div class="item_img"><img src="${list.pland_img }" width="100" height="90"></div>
				<div class="item_title">${list.pland_subject }</div>
				<input type="hidden" value=${list.pland_order }>
				</div>
			</c:forEach>
		</div>
		<div id="cityList" >
			<div id="search">
				<!-- 홍주영 작업중.. -->
				<input type="hidden" value="${pdto.plan_place }">
				<input type="text" id="tour_search" name="txt" placeholder="장소 검색"><br>
				<span class="orderList" data="arrange" data-val="A">이름순</span>
				<span class="orderList" data="arrange" data-val="B">인기순</span>
			</div>
		</div>
		<div id="cityContent" >
			<div id="contentBox">
			tlqk
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
				function planSubmit() {
					var nlist = '';
					var count = '0';
					
					var p_writer = '';
					var txt = '';
					
					$('.list_item').each(function(key,val){
						count++;
					});
					
					var array = new Array();
					
					$('.plan_public').on('click',function() {
						alert("z");
					});
					
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
								<td><input type="text" name="plan_subject" value="${pdto.plan_subject }"></td>
							</tr>
							<tr>
								<th>출발일</th>
								<td><input type="text" id="plan_start" name="plan_start" id="datepicker" value="${pdto.plan_start }"></td>
							</tr>
							<tr>
								<th>설명</th>
								<td><textarea name="plan_explain" cols="20" rows="5" >${pdto.plan_explain }</textarea></td>
							</tr>
							<tr>
								<td colspan="2"><hr>비공개 <input type="checkbox" name="plan_public" value="N"></td>
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
									<input type="hidden" id="plan_idx" name="plan_idx" value=${plan_idx }>
								</td>
							</tr>
						</tfoot>
					</table>
				<button data-remodal-action="cancel" class="remodal-cancel">취소</button>
				<button class="remodal-confirm" onclick="planSubmit(); return false;">완료</button>
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