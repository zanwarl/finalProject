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
.city_list {
    width: 350px;
    height: 350px;
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
.item_img {
	width: 100%;
    height: 100%;
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
	width: 350px;
    height: 300px;
    position: relative;
    background-size: cover;
}
.bg{
   position: absolute;
   height: 300px;
   width: 350px;
   background-color: rgba(0, 0, 0, 0.4);                                                                 
   z-index:44;
}
.bg:hover {
   position: absolute;
   height: 300px;
   width: 350px;
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
     font-size:3rem;
     color: white;
     z-index: 55;
     text-align: center;
}
.contents_mid {
	width: 1200px;
	height: 1000px;
}

    

.wrap_content_food_list {
	width: 1500px;
	height: 650px;
    position: relative;
} 
.content_food_list {
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
	    	 url:"areaBasedList.do?areaCode=${areaCode}&arrange=B&contentTypeId=39",
	           type:"POST",
	           dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
	           success : function(msg) {
	        	// console.log(msg.response.body.items.item);
	        	   var myItem = msg.response.body.items.item;
	        	   
	        	   //page(String pageName, int totalCnt, int listSize, int pageSize, int cp, String queryStr) {
	        	   
	        	   var totalCnt =msg.response.body.totalCount;
	        	   var pageName = 'city.do?areaCode=';
	        	   var listSize = 3;
	        	   var pageSize = 5;
	        	   
	        	   var queryStr = '${pageContext.request.queryString}';
	        	   //alert(queryStr);
	        	   //var pageStr = paging(pageName, totalCnt, listSize, pageSize, cp, queryStr);
	        	   var moreInfo = totalCnt +'개의 정보 모두보기';

	        	   //총 게시물 수 myItem.length + 페이징처리 
                   var output = '<div class="wrap_content_food_list">';
                   output += '<span>총 '+msg.response.body.totalCount + ' 개</span>';
                   output += '<div class="content_food_list">';
                   var chkImg = '';

                   var iterator = 0;
	        	   for(var i=0; i<listSize; i++){
						output += '<a class="item" href="tourDetail.do?contentTypeId='+myItem[i].contenttypeid+'&contentId='+myItem[i].contentid+'">';
                  		output += '<div class="item_name">' +myItem[i].title+ '</div>' ;
                  		output += '<div class="item_img_box">';
	                    if(myItem[i].firstimage==undefined) {
	                    	output += '<img src="img/notimage.png" alt class="item_img">';             	
	                    } else {
	                    	output += '<img src="'+myItem[i].firstimage+'" alt class="item_img">';
	                    }
	                    output += '<input type="hidden" name="contentid" value="'+myItem[i].contentid+'">';
	                    output += '</div></a>';
	        	   }
	        	   output += '</div>';
	        	   output += '</div>';
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
		<div class="menu">1홈</a>
			<a href="tour.do">주요도시</a>
			<a href="attraction.do">관광명소</a>
			<a href="foodList.do">음식점</a>
			<a href="shopping.do">쇼핑</a>
			<a href="plan.do">여행일정 </a>
		
		</div>
	</div>
	
	<div class="contents_mid">
		<div class="foodList"><b>${cityName }의 음식점</b></div>
		<div class="panel"></div>
	</div>
	
	<div class="contents_bot">
		모든도시보긔
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>