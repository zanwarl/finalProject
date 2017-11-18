<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	        	   for(var i=0; i<myItem.length; i++){
	                    output += '<h4><a href="city.do?areaCode='+myItem[i].code+'">'+myItem[i].name+'</a></h4>';
	                }
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
쉬바
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>