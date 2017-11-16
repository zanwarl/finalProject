<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
  width:90%;
  margin:20px auto;
}
#product_layout_3 .product_image{
  display:block;
  box-sizing:border-box;
  width:40%;
  float:left;
}
#product_layout_3 .product_image .main_image img{
  margin:0 auto;
  border:1px solid #808080;
  border-radius:2px;
}
#product_layout_3 .product_desc{
  width:50%;
  float:left;
  margin-left:10%;
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
  width:65%;
  float:left;
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
  min-height: 200px;
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
  font-size: 1.4em;
  margin: 10px;
}
#product_layout_3 .tabular #content #one .images{
  width:45%;
  float:left;  
}
#product_layout_3 .tabular #content #one{
  -webkit-columns: 2;
  -moz-columns: 2;
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
  #product_layout_3 .product_image{
    width:100%;
    margin-left:0;
    margin-right:0;
  }
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
	
	


</style>






<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<body>
 <c:set var="arr" value="${fdto}"/>
<div id="wrap">
  <div id="product_layout_3">
    <div class="product_image">
      <div class="main_image">
        <img src=""/>
      </div>
    </div>
    <div class="product_desc">
      <h1>${arr.fname}</h1>
      <span class="price">50000원/1박</span>
      <span class="sale_price">5000원</span>
      <span class="stars"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-half"></i></span>
      <div class="product_options">
        <div class="select">
                 <select id="size">
                   <option value = "1">1번방(온돌 작은방/화장실1)</option>
                   <option value = "2">2번방(온돌 작은방/화장실1)</option>
                   <option value = "3">3번방(온돌 큰방/화장실2)</option>
                   <option value = "4">4번방(침대 2개/화장실 2)</option>
                 </select>
                 </div>
          </div>
          <div class="buying">
                 <div class="quantity">
                   <label for="quantity">QTY:</label>
                   <input type="text">
                 </div>
                 <div class="cart">
                   <a href="#" class="add">장바구니 담기<i class="fa fa-shopping-cart fa-lg"></i></a>
                 </div>
          </div>
          <div class="other_options">
          <span class="SKU">SKU:12345</span>
          <span class="QTY">QTY:35</span>
          </div>
          <div class="description">
          
          	<p>전주 한옥집은 고풍적인 전통을 가진 목조로 지어진 주택으로서 온돌 2개와 화장실 1개, 주방1개로 구성되어있습니다</p>
          	<p>가장 한국적인 숙소를 찾으신다면 예약해주세요</p>
          	
			
        </div>
          <div class="social">
                   <span class="share">Share This:</span><span class="buttons"><img src="https://i.imgur.com/M8D8rr8.jpg"/></span>
           </div>
      </div>
      <div class="tabular">
        <ul class="tabs group">
          <li><a class="active" href="#/one">상세설명</a></li>
          <li><a href="#/two">후기</a></li>
          <li><a href="#/three">위치정보</a></li>
         
        </ul>
          <div id="content">
            <aside id="one">
              <p>숙소상세설명~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
			  <p>숙소상세설명~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>             
		   	  <p>숙소상세설명~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>              
			  <p>숙소상세설명~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>          
			    </aside>
            <aside id="two">
              <span class="author">김재현</span><span class="stars"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-half"></i></span>
              <p>편안하고 좋은 경험이었습니다</p>
              <p>다음에도 이용할 의사가 있습니다.</p>
              <span class="full_review"><a href="#">전체리뷰목록</a></span>
              <span class="write_review"><a href="#">자기리뷰목록</a></span>
            </aside>
             <aside id="three">
              <div class="images" id="map"></div>
                
              <div class="details">
              <p>${arr.addr1}</p>
              <p>${arr.addr2}</p>
              </div>
              </aside>
               
              
              
          
          </div>
      </div>
    </div>
  </div>
  </div>
  
  



<script type="text/javascript">

 var address1 = "${arr.addr1}";
 var address2 = "${arr.addr2}";
 
 var infowindow; // 지도의 마커위에 표시해주는 말풀선
 var marker;
 var map;
 
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



function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
      zoom: 16,
      center: {lat: 37.566535, lng: 126.97796919999996}
    });
    var geocoder = new google.maps.Geocoder();

    geocodeAddress(geocoder, map);
    
  }

  function geocodeAddress(geocoder, resultsMap) {
    /* var address1 = document.getElementById('addr1').value;
    var address2 = document.getElementById('addr2').value;
     */
    console.log(address1+ "");
    console.log(address2 + "");
    geocoder.geocode({'address': address1+address2}, function(results, status) {
      if (status === 'OK') {
        resultsMap.setCenter(results[0].geometry.location);
          marker = new google.maps.Marker({
          map: resultsMap,
          zoom: 15,
          position: results[0].geometry.location
        });
        infowindow= new google.maps.InfoWindow({
            content: address2
          });
        
    	infowindow.open(map , marker);
    	
    	// 예외처리 -> X 버튼을 클릭하였을 경우. 다시 메세지 창을 띄워줘야한다.
    	// User에게 다시 보여주기 위해서 CLick 이벤트 추가.
    	marker.addListener("click", function() {
    	 	    infowindow.open(map , marker);
    	 });
        
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
  }
</script>
  <script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCbusV4tEDJhoqgUPVImHs8undZrTOaDEU&callback=initMap">
</script>





</body>
</html>