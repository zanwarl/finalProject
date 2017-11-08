<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function choiceTime(){
	opener.document.foodreq.frtime.value='aa';
	window.self.close();
}
</script>
</head>
<body>
<h2>예약시간 선택</h2>
<c:forEach var="list" items="${list}">
<input type="button" value="${list.ftime}" onclick="choiceTime()">
</c:forEach>
</body>
</html>