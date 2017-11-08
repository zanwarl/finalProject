<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function choiceTime(time){
	opener.document.foodreq.frtime.value=time.value;
	window.self.close();
}
</script>
</head>
<body>
<h2>예약시간 선택</h2>
<form name="foodTime">
<c:forEach var="list" items="${list}">
<input type="button" name="frtime" value="${list.ftime}" onclick="choiceTime(this)">
</c:forEach>
</form>
</body>
</html>