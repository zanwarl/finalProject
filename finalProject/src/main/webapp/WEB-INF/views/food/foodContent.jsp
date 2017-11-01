<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
<section>
	<table>
	<c:set var="arr" value="${fdto}"/>
		<tr>
			<th>가게이름</th>
			<th>${arr.fname}</th>
		</tr>
	</table>
</section>
</body>
</html>