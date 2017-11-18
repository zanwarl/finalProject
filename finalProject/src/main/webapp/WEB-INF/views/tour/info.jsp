<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.wrap_content_city_list {
	width: 1500px;
	height: 1500px;
    position: relative;
} 
.content_city_list {
	width: 1500px;
	height: 1450px;
    position: relative;
} 
.item_img_box {
	width: 230px;
    height: 160px;
    float: left;
}

.item_img {
	width: 200px;
    height: 150px;
}
.item1{
    width: 1000px;
    height: 200px;
    border: 1px solid #dfdfdf;
    margin-right: 16px;
    margin-bottom: 16px;
    display: block;
    cursor: pointer;
    position: relative;
}
.item2{
    width: 1000px;
    height: 200px;
    border: 1px solid #dfdfdf;
    margin-right: 16px;
    margin-bottom: 16px;
    display: block;
    cursor: pointer;
    position: relative;
}
.item3{
    width: 1000px;
    height: 200px;
    border: 1px solid #dfdfdf;
    margin-right: 16px;
    margin-bottom: 16px;
    display: block;
    cursor: pointer;
    position: relative;
}
.item4{
    width: 1000px;
    height: 200px;
    border: 1px solid #dfdfdf;
    margin-right: 16px;
    margin-bottom: 16px;
    display: block;
    cursor: pointer;
    position: relative;
}
.item5{
    width: 1000px;
    height: 200px;
    border: 1px solid #dfdfdf;
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
</style>

<script type="text/JavaScript"
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/jsPaging.js" type="text/javascript"></script>    
<script type="text/javascript">
var contentTypeId =  [];
var contentId = [];
var itemAddr = [];
var itemOverView = [];
var itemTel = [];


var cp = ${cp};
	$(document).ready(function() {
	     $.ajax({
	    	 	url:"areaBasedList.do?areaCode=${areaCode}&arrange=B&contentTypeId=${contentTypeId}&cp="+cp,
	           type:"POST",
	           dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
	           success : function(msg) {
 					var myItem = msg.response.body.items.item;
	        	   
	        	   //page(String pageName, int totalCnt, int listSize, int pageSize, int cp, String queryStr) {
	        	   
	        	   var totalCnt =msg.response.body.totalCount;
	        	   var pageName = 'citycate.do?areaCode='+ ${areaCode} +"&contentTypeId=${contentTypeId}";
	        	   var listSize = 5;
	        	   var pageSize = 5;
	        	   
	        	   var queryStr = '${pageContext.request.queryString}';
	        	   //alert(queryStr);
	        	   var pageStr = paging(pageName, totalCnt, listSize, pageSize, cp, queryStr);
	        	   var moreInfo = totalCnt +'개의 정보 모두보기';

	        	   //총 게시물 수 myItem.length + 페이징처리 
                   var output = '<div class="wrap_content_city_list">';
                   output += '<div class="content_city_list">';
                   var chkImg = '';

                   var iterator = 0;
	        	   for(var i=1; i<=listSize; i++){
	        		   output += '<a data="'+i+'" class="item'+i+'" href="tourDetail.do?contentTypeId='+myItem[i].contenttypeid+'&contentId='+myItem[i].contentid+'">';
                   		output += '<div class="item_name">' +myItem[i].title+ '</div>' ;
                   		output += '<div class="item_img_box">';
	                    if(myItem[i].firstimage==undefined) {
	                    	output += '<img src="img/notimage.png" alt class="item_img">';             	
	                    } else {
	                    	output += '<img src="'+myItem[i].firstimage+'" alt class="item_img">';
	                    }
	                   
	                    output += '<input type="hidden" name="contentid" value="'+myItem[i].contentid+'">';
	                    output += '</div>';
	                    output += '</a>';
	                    //var contentTypeId = myItem[i].contenttypeid;
	                    //var contentId = myItem[i].contentid;
	                    contentTypeId[i] =  myItem[i].contenttypeid;
	                    contentId[i] = myItem[i].contentid;
	                    
	                    
	                }
	        	   output += '</div>';
	        	   output += '</div>';
	        	   $('#contents').append(output);
	        	   for(var i=1; i<=listSize; i++){
		        	   $.ajax({
	                   	url:"tourDetailJSON.do?contentTypeId="+contentTypeId[i] + "&contentId=" + contentId[i],
	        	           type:"GET",
	        	           dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
	        	           async:false, // 이 한줄만 추가해주시면 됩니다.
	        	           success : function(msg2) {
	        	        	  // console.log(msg.response.body.items.item);
	        	        	  var myItem2 = msg2.response.body.items.item;
	        	        	   //내용 작성 추후 한 div에 담기
	        						var img = '';
	        						var map = '';
	        						
	        						itemOverView[i] = '<div class="item_detail">' + myItem2.overview.substring(0,200) +"..." + '</div>';	
	        						itemAddr[i] = '<div class="item_addr" data="'+i+'">' + myItem2.addr1 +'</div>';	
	        						itemTel[i] = '<div class="item_tel" data="'+i+'">' + myItem2.tel +'</div>';	
	    							//document.body.innerHTML += output;
	        	        	   
	        	           },
	        	           error : function(xhr, status, error) {
	        	                 alert("에러발생");
	        	           }
	        	     });
	        	   }
      			
	        	   var str = '';
	        	   var i = 1;
	        	   for(var i=1;i<=listSize;i++) {
		        	   str = $('.item').attr('data');
		        	   
	        	   }
	        	   for(var i=1;i<=listSize;i++) {
	        		   $('#contents .item'+i).append(itemOverView[i]);
	        		   $('#contents .item'+i).append(itemAddr[i]);
	        		   //$('#contents .item'+i).append(itemTel[i]);
	        	   }
	        	   $('#contents').append(pageStr);
	        	
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
			<a href="tour.do">홈</a>
			<a href="area.do">호텔</a>
			<a href="attraction.do">관광명소</a>
			<a href="shopping.do">음식점</a>
			<a href="shopping.do">쇼핑</a>
			<a href="plan.do">여행일정 </a>
		
		</div>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>