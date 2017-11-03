<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/JavaScript"
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/jsPaging.js" type="text/javascript"></script>    
<script type="text/javascript">
	var cp = ${cp };
	 $(document).ready(function() {
	     $.ajax({
	    	   url:"areaBasedList.do?areaCode=${areaCode}&cp="+cp,
	           type:"GET",
	           dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
	           success : function(msg) {
	        	  // console.log(msg.response.body.items.item);
	        	   var myItem = msg.response.body.items.item;
	        	   
	        	   //page(String pageName, int totalCnt, int listSize, int pageSize, int cp, String queryStr) {
	        	   
	        	   var totalCnt =msg.response.body.totalCount;
	        	   var pageName = 'city.do?areaCode='+ ${areaCode};
	        	   var listSize = 5;
	        	   var pageSize = 5;
	        	   
	        	   var queryStr = '${pageContext.request.queryString}';
	        	   //alert(queryStr);
	        	   var pageStr = paging(pageName, totalCnt, listSize, pageSize, cp, queryStr);

	        	   //총 게시물 수 myItem.length + 페이징처리 
	        	   for(var i=1; i<=listSize; i++){
	                    var output = '';
	                    output += '<h4>'+myItem[i].title+'</h4>';
	                    output += '<a href="tourDetail.do?contentTypeId='+myItem[i].contenttypeid+
	                    		'&contentId='+myItem[i].contentid+'"><img src="'+myItem[i].firstimage+'" width="150"></a>';
	                    output += '<input type="hidden" name="contentid" value="'+myItem[i].contentid+'">';
	                    document.body.innerHTML += output;
	                }
	        	   $(".page").html(pageStr);
	           },
	           error : function(xhr, status, error) {
	                 alert("에러발생");
	           }
	     });
	}); 
</script>
</head>
<body>
<form>
	<table>
		<thead>
			<tr>
				<th><a href="tour.do">홈</a></th>
				<th><a href="area.do">주요도시</a></th>
				<th><a href="attraction.do">관광명소</a></th>
				<th><a href="shopping.do">쇼핑</a></th>
				<th><a href="plan.do">여행일정</a></th>
			</tr>
		</thead>
	</table>
	<div class="page">
	</div>
</form>
</body>
</html>