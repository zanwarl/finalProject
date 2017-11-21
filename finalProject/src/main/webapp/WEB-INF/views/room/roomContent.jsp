<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
 <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<title>Insert title here</title>
</head>


<style>
/** map area */
  #map {
        
        overflow: hidden;
    float: left;
    height: 200px;
    width: 100%;
    margin-bottom: 10px;
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
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
      
     
      
      /**-----------------------------------------*/





body{
  background:#f1f2f3;
  font-size:62%;
  color:#262626;
  font-family:'Arial',sans-serif;
}
img{ 
  max-width:100%;
}
#wrap{
  width:100%;
  margin:auto;
}
#product_layout_3 .product_image .main_image img{
  margin:0 auto;
  border:1px solid #808080;
  border-radius:2px;
}
#product_layout_3 .product_desc{
  width:40%;
  float:middle;
  margin:auto;
  min-height:660px;
}
#product_layout_3 .product_desc h1{
  font-size:3.6em;
  font-weight:500;
}
#product_layout_3 .product_desc .price{
  display:block;
  font-size:2.4em;
  color:#ccc;
  text-decoration:line-through;
}
#product_layout_3 .product_desc .sale_price{
  display:block;
  font-size:2.8em;
  color:crimson;
  font-weight:700;
}
#product_layout_3 .product_desc .stars{
  display:block;
  font-size:2em;
  color:goldenrod;
  margin-top:5px;
}
#product_layout_3 .product_options .select{
  width: 100%;
  max-width:300px;
  height: 40px;
  overflow: hidden;
  background: url('https://i.imgur.com/10e9Roz.png') no-repeat right #FFF;
  border: 1px solid #ccc;
  border-radius:2px;
  margin-top:15px;  
}
#product_layout_3 .product_options select{
  background: transparent;
  display:block;
  width: 268px;
  padding: 5px;
  font-size: 2em;
  line-height: 1;
  border: 0;
  border-radius:0;
  height: 40px;
  -webkit-appearance: none;
}
#product_layout_3 .buying{
  max-width:300px;
  width:100%;
  display:block;
}
#product_layout_3 .buying .quantity{
  font-size:2em;
  margin-top:15px;
  width:35%;
  float:left;
  display:block;
}
#product_layout_3 .buying .quantity [type="text"]{
  width:40px;
  height:40px;
  border:1px solid #ccc;
  border-radius:2px;
  padding:10px;
  box-sizing:border-box;
  font-size:1em;
}
#product_layout_3 .buying .cart{
  margin-top:25px;
  width:100%;
  float:auto;
  margin-bottom:20px;
}
#product_layout_3 .buying .cart a.add{
  font-size:2em;
  float:right;
  color:#FFF;
  background:skyblue;
  text-decoration:none;
  padding:10px 20px;
  margin-top:-10px;
  border-radius:2px;
}
#product_layout_3 .product_desc .other_options{
  color:#aaa;
  display:block;
  float:left;
  width:100%;
  min-height:30px;
  margin-bottom:15px;
}
#product_layout_3 .product_desc .other_options span{
  display:block;
}
#product_layout_3 .product_desc .description{
  font-size:1.4em;
  display:block;
  width:100%;
  clear:both;
}
#product_layout_3 .product_desc .social{
  font-size:1.4em;
  line-height:1.2;
  margin-bottom:15px;
  width:60%;
  display:block;
  margin:15px 0px;
}
#product_layout_3 .product_desc .social .share{
  margin-top:-5px;
  margin-bottom:15px;
}
#product_layout_3 .product_desc .buttons{
  margin-top:20px;
  margin-left:10px;
  display:inline-block;
  width:30%;
}
#product_layout_3 .tabular{
  display:block;
  margin-top:20px;
  width:100%
}
#product_layout_3 .tabular ul.tabs {
	width: 50%;
	height: 80px;
	list-style: none;
	overflow: hidden;
  padding: 0;
}
#product_layout_3 .tabular ul.tabs li {	
	float: left;
	width: 32%;
  margin-right:1%;
}
#product_layout_3 .tabular ul.tabs li a {
	position: relative;
	display: block;
	height: 30px;
	margin-top: 40px;
	padding: 10px 0 0 0;
	font-size: 1.8em;
	text-align: center;	
	text-decoration: none;
	color: #ffffff;
	background: skyblue;
	transition: padding 0.2s ease, margin 0.2s ease;
  margin-bottom:-10px;
  border-top-left-radius: 3px;
  border-top-right-radius: 3px;
}
#product_layout_3 .tabular .tabs li:first-child a {
	z-index: 3;
  border-top-left-radius: 3px;
}
#product_layout_3 .tabular .tabs li:nth-child(2) a {
	z-index: 2;
}
#product_layout_3 .tabular .tabs li:last-child a {
	z-index: 1;
  border-top-right-radius: 3px;
}
#product_layout_3 .tabular ul.tabs li a:hover {
	margin: 35px 0 0 0;
	padding: 10px 0 5px 0;
}
#product_layout_3 .tabular ul.tabs li a.active {
	margin: 30px 0 0 0;
	padding: 10px 0 10px 0;
	background: #545f60;
	color: skyblue;
	z-index: 4;
	outline: none;
  border: 1px solid #808080;
}
#product_layout_3 .tabular .group:before,
#product_layout_3 .tabular .group:after {
}
#product_layout_3 .tabular .group:after {
   clear: both;
}
#product_layout_3 .tabular #content {
  width: 100%;
  min-height: 350px;
  background: #545f60;
  border-bottom-right-radius: 3px;
  border-bottom-left-radius: 3px;
  border-top-right-radius:3px;
  padding:2em;
  float:left;
  margin-top:-10px;
  border:1px solid #808080;
  border-top:0;
  margin-bottom:30px;
  box-sizing:border-box;
  -moz-box-sizing:border-box;
}
#product_layout_3 .tabular #content p{
  color: #ffffff;
  font-weight:500;
  font-size: 1.6em;
  margin: 10px;
}
#product_layout_3 .tabular #content #one .images{
  width:45%;
  float:left;  
}
#product_layout_3 .tabular #content #one{
  -webkit-columns: 1;
  -moz-columns: 1;
}
#product_layout_3 .tabular #content #two .author{
  font-size:1.6em;
  font-weight:700;
  color:#FFF;
  display:inline-block;
  margin:10px;
}
#product_layout_3 .tabular #content #two .stars{
  font-size:1.8em;
  color:goldenrod;
  display:inline-block;
  margin:10px;
}
#product_layout_3 .tabular #content #two span.full_review a{
  font-size:1.4em;
  display:block;
  color:skyblue;
  text-align:center;
}
#product_layout_3 .tabular #content #two span.write_review a{
  font-size:1.4em;
  color:skyblue;
  text-align:center;
  display:block;
  margin-top:10px;
}
#product_layout_3 .tabular #content #three .images{
  width:45%;
  float:left;
  display:block;
  margin-right:5%;
  -moz-columns:2;
  -webkit-columns:2;
  height:300px;
  
}
#product_layout_3 .tabular #content #three .images img{
  width:100px;
  margin-top:20px;
  margin-left:auto;
  margin-right:auto;
  display:block;				/* map size */
}

#product_layout_3 .tabular #content #three .details{
  width:45%;
  float:left;
  margin-left:5%;
  height:auto;
}
@media (max-width:500px){
   #product_layout_3 .product_desc{
     width:100%;
     margin-left:0;
     margin-right:0;
   }
  #product_layout_3 .tabular ul.tabs {
	width: 100%;
  }
  #product_layout_3 .tabular #content #three{
     height:auto;
    display:block;
  }
  #product_layout_3 .tabular #content #one,
  #product_layout_3 .tabular #content #three .images,
  #product_layout_3 .tabular #content #three .details{
  width:100%;
  float:none;
  -moz-columns:1;
  -webkit-columns:1;
}
  #product_layout_3 .buying .quantity{
    width:35%;
  }
  #product_layout_3 .buying .cart{
    width:65%;
  }
	
	
.but{
    display: inline-block;
    text-decoration: none;
    color: #fff;
    font-weight: bold;
    background-color: #538fbe;
    padding: 5px 5px;
    font-size: 10px;
    border: 1px solid #2d6898;
    background-image: linear-gradient(bottom, rgb(73,132,180) 0%, rgb(97,155,203) 100%);
    background-image: -o-linear-gradient(bottom, rgb(73,132,180) 0%, rgb(97,155,203) 100%);
    background-image: -moz-linear-gradient(bottom, rgb(73,132,180) 0%, rgb(97,155,203) 100%);
    background-image: -webkit-linear-gradient(bottom, rgb(73,132,180) 0%, rgb(97,155,203) 100%);
    background-image: -ms-linear-gradient(bottom, rgb(73,132,180) 0%, rgb(97,155,203) 100%);
 
    background-image: -webkit-gradient(
        linear,
        left bottom,
        left top,
        color-stop(0, rgb(73,132,180)),
        color-stop(1, rgb(97,155,203))
    );
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    text-shadow: 0px -1px 0px rgba(0,0,0,.5);
    -webkit-box-shadow: 0px 6px 0px #2b638f, 0px 3px 15px rgba(0,0,0,.4), inset 0px 1px 0px rgba(255,255,255,.3), inset 0px 0px 3px rgba(255,255,255,.5);
    -moz-box-shadow: 0px 6px 0px #2b638f, 0px 3px 15px rgba(0,0,0,.4), inset 0px 1px 0px rgba(255,255,255,.3), inset 0px 0px 3px rgba(255,255,255,.5);
    box-shadow: 0px 6px 0px #2b638f, 0px 3px 15px rgba(0,0,0,.4), inset 0px 1px 0px rgba(255,255,255,.3), inset 0px 0px 3px rgba(255,255,255,.5);
}

</style>


<script type="text/javascript">
var jq = $.noConflict();
jq(document).ready(function() {
  jq(document).ready(function(){
    jq('.slider').bxSlider();
  });
});

function golist() {
	location.href = "home.do";
}
function goUpdate(idx) {
	location.href = 'roomUpdate.do?idx=' + idx;
}
function roomReq(idx) {
	location.href = 'roomReq.do?roomIdx=' + idx;
}
function goDelete(idx) {
	location.href = 'roomDelete.do?idx=' + idx;
}
function goImageUpdate(idx) {
	location.href = 'imageUpdate.do?idx=' + idx;
}
</script>

<body>
<%@ include file="../header.jsp" %>
 <c:url value="${contextPath }/img/room/" var="src"/>
	<c:set var="arr" value="${rdto}" />
	
	<input type="hidden" id="addr1" value="${arr.addr1}">
	<input type="hidden" id="addr2" value="${arr.addr2}">
	<input type="hidden" id="postnum" value="${arr.postnum}">
	
       <ul class="slider">
		<c:forEach var="imageList" items="${imageList}">
			<li><img src="${src}${imageList.filename}" width="100%" height="650"></li>
		</c:forEach>
  		</ul>
<div id="wrap">
  <div id="product_layout_3">
    <div class="product_desc">
      <h1>${arr.roomname}</h1><br>
		<span class="sale_price">${arr.roomprice}원/1박</span><br>
          <div class="description">
          
          	<p>
          	<strong>체크인:</strong>${arr.checkin}<br>
          	<strong>체크아웃:</strong>${arr.checkout}<br>
          	<strong>숙박최대인원:</strong>${arr.maxcount}
          	</p>
          	<p>
          	<strong>편의용품:</strong>${arr.conv}<br>
          	<strong>안전시설:</strong>${arr.safe}<br>
          	<strong>개인공간:</strong>${arr.space}
          	<p><br>
          	<p>
          	<strong>예약 취소</strong><br>
			이 호스트는 엄격 환불 정책을 시행합니다
			체크인 30일 전까지 예약을 취소하면 전액이 환불됩니다. 체크인까지 30일이 남지 않은 시점에 취소하면 총 숙박 요금의 50%와 수수료 전액이 환불됩니다.
          	</p><br>
          	<p>
          	 <c:url var="profileURL" value="userProfile.do">
				<c:param name="userId" value="${receiver }"></c:param>
			 </c:url>
		     <a href="${profileURL}" style="color: red"><b>${receiver}님의 프로필 보기</b></a>
		     </p>
          </div>
         	 <div class="buying">
                 <div class="cart">
                 <c:url var="Url" value="roomReq.do">
					<c:param name="roomIdx" value="${arr.roomidx}"></c:param>
				</c:url>
                   <a href="${Url}" class="add">예약하기</a>
                 </div>
          	</div>
      </div>
      <div class="tabular">
        <ul class="tabs group">
          <li><a class="active" href="#/one">상세설명</a></li>
        </ul>
          <div id="content">
            <aside id="one">
            	<p>${arr.content}           
             	<div id="map" style="width: 100%; height: 450px;">지도</div>
             </aside>
          </div>
      </div>
    </div>
  </div>
   <input type="button" class="but" value="목록으로" onclick="golist()">
   <c:if test="${sIdx ==arr.useridx}">
	
	<input type="button" class="but" value="내용 수정" onclick="goUpdate('${arr.roomidx}')">
	<input type="button" class="but" value="이미지수정" onclick="goImageUpdate('${arr.roomidx}')">
	<input type="button" class="but" value="삭제하기" onclick="goDelete('${arr.roomidx}')">
	</c:if>
	
	<c:if test="${not empty sId }">
	<c:url value="sendMsg.do" var="sendMsgURL">
		<c:param name="receiver" value="${receiver }"></c:param>
	</c:url>
		<c:url value="comReq.do" var="complainURL">
		<c:param name="receiver" value="${arr.useridx }"></c:param>
	</c:url>
	<input type="button" class="but" value="메세지보내기" onclick="window.open('${sendMsgURL}', '_blank', 'width=300, height=300');">
	<input type="button" class="but" value="신고하기" onclick="window.open('${complainURL}', '_blank', 'width=300, height=350');">
	</c:if>
<script>
(function($) {

	var tabs =  $(".tabs li a");
    
	tabs.click(function() {
		var content = this.hash.replace('/','');
		tabs.removeClass("active");
		$(this).addClass("active");
    $("#content > aside").hide();
    $(content).fadeIn(200);
	});
	
})(jQuery);
</script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9251be7575bdb59bd3083f1f226f6a13&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};
	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption);
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	var addr1 = document.getElementById('addr1').value;
	var addr2 = document.getElementById('addr2').value;
	var postnum = document.getElementById('postnum').value;
	var address = addr1 + addr2 + postnum;
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(address, function(result, status) {
		// 정상적으로 검색이 완료됐으면 
		if (status === daum.maps.services.Status.OK) {
			var coords = new daum.maps.LatLng(result[0].y, result[0].x);
			// 결과값으로 받은 위치를 마커로 표시합니다
			/*  var marker = new daum.maps.Marker({
			 map: map,
			 position: coords
				}); */
			var circle = new daum.maps.Circle({
				map : map,
				center : coords, // 원의 중심좌표 입니다 
				radius : 130, // 미터 단위의 원의 반지름입니다 
				strokeWeight : 1, // 선의 두께입니다 
				strokeColor : '#75B8FA', // 선의 색깔입니다
				strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				fillColor : '#CFE7FF', // 채우기 색깔입니다
				fillOpacity : 0.5
			// 채우기 불투명도 입니다   
			});
			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
		}
	});
</script>

<%@ include file="../footer.jsp" %>  
</body>
</html>