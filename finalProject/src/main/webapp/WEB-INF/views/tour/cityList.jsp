<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.menu {
	margin: 0 auto;
	width: 1263px;
	text-align: center;
}
.contents_top b {
	font-size: 200%;
}
.contents_mid b {
	font-size: 220%;
}
.city_item {
	float: left;
}
.item {
    width: 200px;
    height: 210px;
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
	width: 1163px;
	height: 25px;
	margin: 0 auto;
	padding-left: 100px;
}
.category_item {
	float: left;
	width: 100px;
	height: 20px;
	cursor: pointer;
}
.item_img_box {
	width: 200px;
    height: 180px;
}

.item_img {
	width: 100%;
    height: 100%;
}

.wrap_content_city_list {
	width: 1263px;
	height: 650px;
    position: relative;
	margin: 0 auto;
} 
.contents_top {
	margin: 0 auto;
}
.category {
	 text-align: center;
}
.more_info{
    text-align: center;
}
.popular {
    text-align: center;
}
.contents_mid{
    text-align: center;
    margin: 0 auto;
}
.category_item {
    text-align: center;
}
.content_city_list {
	width: 1160px;
	height: 600px;
    position: relative;
    padding-left: 100px;
} 
</style>
<script type="text/JavaScript"
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/jsPaging.js" type="text/javascript"></script>    
<script type="text/javascript">
var cp = 1;
$(document).ready(function() {
var contentTypeId = $('.category_item').attr('data-cate'); 

		 /* ajax start */
		 $.ajax({
	    	   
    	 		//기본 베이스는 관광지(contenttypeid = 12)
				url:"areaBasedList.do?areaCode=${areaCode}&sigunguCode=${sigunguCode}&arrange=B&contentTypeId=12",
				type:"GET",
	           dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
	           success : function(msg) {
	        	  // console.log(msg.response.body.items.item);
	        	   var myItem = msg.response.body.items.item;
	        	   
	        	   //page(String pageName, int totalCnt, int listSize, int pageSize, int cp, String queryStr) {
	        	   
	        	   var totalCnt =msg.response.body.totalCount;
	        	   var pageName = 'city.do?areaCode='+ ${areaCode};
	        	   var listSize = 10;
	        	   var pageSize = 5;
	        	   
	        	   var queryStr = '${pageContext.request.queryString}';
	        	   //alert(queryStr);
	        	   //pageStr = paging(pageName, totalCnt, listSize, pageSize, cp, queryStr);
	        	   var moreInfo = totalCnt +'개의 정보 모두보기';

	        	   //총 게시물 수 myItem.length + 페이징처리 
                   var output = '<div class="wrap_content_city_list">';
                   output += '<div class="content_city_list">';
                   var chkImg = '';

                   var iterator = 0;
	        	   for(var i=0; i<listSize; i++){
	                   
	        		   
	        		   output += '<a class="item" href="tourDetail.do?contentTypeId='+myItem[i].contenttypeid+'&contentId='+myItem[i].contentid+'">';
                   		output += '<div class="item_img_box">';
	                    if(myItem[i].firstimage==undefined) {
	                    	output += '<img src="img/notimage.png" alt class="item_img">';             	
	                    } else {
	                    	output += '<img src="'+myItem[i].firstimage+'" alt class="item_img">';
	                    }
	                    output += '<div class="item_name">' +myItem[i].title+ '</div>' ;
	                    output += '<input type="hidden" name="contentid" value="'+myItem[i].contentid+'">';
	                    output += '</div></a>';
	                }
	        	   
	        	   var si = '${sigunguCode}';
	        	   output += '</div>';
	        	   if(si=='') {
						output += '<a class="more_info" href="citycate.do?areaCode=${areaCode}&contentTypeId=12">' + moreInfo + '</a>';
	        	   } else {
        	   			output += '<a class="more_info" href="citycate.do?areaCode=${areaCode}&sigunguCode=${sigunguCode}&contentTypeId=12">' + moreInfo + '</a>';
	        	   }
	        	   output += '</div>';
	        	   $('.contents_mid').append(output);
	        	   
	           },
	           error : function(xhr, status, error) {
	                 alert("에러발생");
	           }
	     });
		 /* ajax end */
		
		 
		$('.category_item').on('click', function() {
			var contentTypeId = $(this).attr('data-cate');
			$('.content_city_list').remove();
			$('.page').remove();
			$('.more_info').remove();
			cp = 1;
			
			$.ajax({
		    	   
    	 		//기본 베이스는 관광지(contenttypeid = 12)
				url:"areaBasedList.do?areaCode=${areaCode}&cp="+cp+"&arrange=B&row=10&contentTypeId="+contentTypeId,
				type:"GET",
	           dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
	           success : function(msg) {
	        	  // console.log(msg.response.body.items.item);
	        	   var myItem = msg.response.body.items.item;
	        	   //page(String pageName, int totalCnt, int listSize, int pageSize, int cp, String queryStr) {
	        	   
	        	   var totalCnt =msg.response.body.totalCount;
	        	   
	        	   var moreInfo = totalCnt +'개의 정보 모두보기';
	        	   var pageName = 'city.do?areaCode='+ ${areaCode};
	        	   var listSize = 10;
	        	   var pageSize = 5;
	        	   
	        	   var queryStr = '${pageContext.request.queryString}';
	        	   //alert(queryStr);
	        	   var pageStr = paging(pageName, totalCnt, listSize, pageSize, cp, queryStr);

	        	   //총 게시물 수 myItem.length + 페이징처리 
                   var output = '';
                   var chkImg = '';

                   output += '<div class="content_city_list">';
                   var iterator = 0;
	        	   for(var i=1; i<=listSize; i++){
	                    output += '<a class="item" href="tourDetail.do?contentTypeId='+myItem[i].contenttypeid+'&contentId='+myItem[i].contentid+'">';
                   		
                   		output += '<div class="item_img_box">';
	                    if(myItem[i].firstimage==undefined) {
	                    	output += '<img src="img/notimage.png" alt class="item_img">';             	
	                    } else {
	                    	output += '<img src="'+myItem[i].firstimage+'" alt class="item_img">';
	                    }
	                    output += '<div class="item_name">' +myItem[i].title+ '</div>' ;
	                    output += '<input type="hidden" name="contentid" value="'+myItem[i].contentid+'">';
	                    output += '</div></a>';
	                }
	        	   
	        	   output += '</div>';
	        	   output += '<a class="more_info" href="citycate.do?areaCode=1&contentTypeId='+contentTypeId+'">' + moreInfo + '</a>';
	        	   $('.wrap_content_city_list').append(output);
	        	   $('.more_info').html(moreInfo);
	           },
	           error : function(xhr, status, error) {
	                 alert("에러발생");
	           }
	     });
	  });
}); 
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<div id="contents">
	<div class="contents_top">
		<div class="city_title"></div>
		<div class="menu"></a>
			<%-- <a href="attraction.do">관광명소</a>
			<a href="foodList.do?areaCode=${areaCode }">음식점</a>
			<a href="shopping.do">쇼핑</a>
			<a href="plan.do">여행일정 </a> --%>
		
		</div>
	</div>
	
	<div class="contents_mid">
		<div class="popular"><b>${cityName } ${sigunguName } 인기장소</b></div>
		<div class="category">
			<div class="category_item" data-cate="12">관광명소</div>
			<div class="category_item" data-cate="39">음식</div>
			<div class="category_item" data-cate="38">쇼핑</div>
		</div>
	</div>
	
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>