<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<div> 
	<c:forEach var="list" items="${list }"> 
	<a href="city.do?areaCode=${list.areaCode }&sigunguCode=${list.sigunguCode }">${list.name }</a> <br>
	</c:forEach>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>