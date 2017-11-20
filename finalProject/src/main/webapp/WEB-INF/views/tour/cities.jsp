<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.contents_top b {
	font-size: 200%;
}
.contents_mid b {
	font-size: 220%;
}
.city_item {
	float: left;
}
.menu {
	font-size: 20px;
}
.menu_bar {
	background: #3173b7;
	float: left;
}
.city_list {
    width: 270px;
    height: 250px;
    border: 1px solid #dfdfdf;
    float: left;
    margin-right: 16px;
    margin-bottom: 16px;
    display: block;
    cursor: pointer;
    position: relative;
}
.item_name {
	width: 200px;
    height: 20px;
    overflow: hidden;
}
.category {
	height: 25px;
}
.category_item {
	float: left;
	width: 100px;
	height: 20px;
	cursor: pointer;
}
.item_img_box {
	width: 265px;
    height: 230px;
}

.city_img {
	width: 270px;
    height: 250px;
    position: relative;
    background-size: cover;
}
.bg{
   position: absolute;
   width: 270px;
   height: 250px;
   background-color: rgba(0, 0, 0, 0.4);                                                                 
   z-index:44;
}
.bg:hover {
   position: absolute;
   width: 270px;
   height: 250px;
   background-color: rgba(0, 0, 0, 0); 
   -webkit-transition: all 1s;                                                                
   z-index:44;
   
}
.bg:hover .city_img{
	transform: scale(1.2);
	-webkit-transition: all 3.6s;
}
/* .img{
   position: abhttp://localhost:9090/finalProject/city.do?areaCode=1solute;
   height: 300px;
   width: 350px;
   
} */
.city_list .name{
     position: absolute;
     top:50%;
     left:50%;
     transform: translate(-50%, -50%);                                                                   
     font-size:2.5rem;
     color: white;
     z-index: 55;
     text-align: center;
}
.contents_mid {
	width: 1000px;
	height: 600px;
	margin: 0 auto;
	position: relative;
	padding-left: 150px;
}
.contents_top {
	text-align: center;
	width: 600px;
	height: 50px;
	margin: 0 auto;
	padding-left: 300px;
}
.contents_bot {
	text-align: center;
	padding-bottom: 50px;
}
.category {
	text-align: center;
}
.popular {
	width: 850px;
	text-align: center;
}
.wrap_content_city_list {
	width: 1500px;
	height: 650px;
    position: relative;
} 
.content_city_list {
	width: 1500px;
	height: 600px;
    position: relative;
} 
</style>
<script type="text/JavaScript"
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	     $.ajax({
	           url:"areaCode.do",
	           type:"POST",
	           dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
	           success : function(msg) {
	        	  // console.log(msg.response.body.items.item);
	        	   var myItem = msg.response.body.items.item;
	        	   
	        	   var dataLen = msg.response.body.items.item;
	        	   
                   var output = '';
	        	   //for(var i=0; i<6; i++){
						output += '<div class="wrap_city_list">';
						
	                    output += '<a class="city_list" href="city.do?areaCode=1">';
	                    output += '<div class="name">서울</div>';
	            		output += '<div class="bg">';
	            		output += '</div><img class="city_img" src="img/city/seoul.jpg"></a>';
	            		
	                    output += '<a class="city_list" href="city.do?areaCode=6">';
	                    output += '<div class="name">부산</div>';
	                    output += '<div class="bg">';
	            		output += '</div><img class="city_img" src="img/city/busan.jpg"></a>';
	                    
	                    output += '<a class="city_list" href="city.do?areaCode=39">';
	                    output += '<div class="name">제주도</div>';
	                    output += '<div class="bg">';
	            		output += '</div><img class="city_img" src="img/city/jeju.jpg"></a>';
	                    
	                    output += '<a class="city_list" href="city.do?areaCode=3">';
	                    output += '<div class="name">대전</div>';
	                    output += '<div class="bg">';
	            		output += '</div><img class="city_img" src="img/city/daejeon.jpg"></a>';
	                    
	                    output += '<a class="city_list" href="city.do?areaCode=4">';
	                    output += '<div class="name">대구</div>';
	                    output += '<div class="bg">';
	            		output += '</div><img class="city_img" src="img/city/daegu.jpg"></a>';
	                    
	                    output += '<a class="city_list" href="city.do?areaCode=2">';
	                    output += '<div class="name">인천</div>';
	                    output += '<div class="bg">';
	            		output += '</div><img class="city_img" src="img/city/incheon.jpg"></a>';
	                    
                   		
	                    output += '</div>';
	                //}
	        	   $(".panel").html(output);
	           },
	           error : function(xhr, status, error) {
	                 alert("에러발생");
	           }
	     });
	});
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<div id="contents">
	<div class="contents_top">
		<div class="city_title"><b>${cityName }</b></div>
		<div class="menu">
			<div class="menu_bar">
				<a href="tour.do">홈</a>
				<a href="attraction.do">관광명소</a>
				<a href="foodList.do">음식점</a>
				<a href="shopping.do">쇼핑</a>
				<a href="plan.do">여행일정 </a>
			</div>
		</div>
	</div>
	
	<div class="contents_mid">
		<!-- <div class="category">
			<div class="category_item" data-cate="12">관광명소</div>
			<div class="category_item" data-cate="39">음식</div>
			<div class="category_item" data-cate="38">쇼핑</div>
		</div> -->
		<div class="popular"><b>인기 도시</b></div>
		<div class="panel"></div>
	</div>
	
	<div class="contents_bot">
		<a href="allCity.do">모든도시보기</a>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>