<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
</head>
<body>
<section>
	<table>
	<c:set var="arr" value="${crdto}"/>
		<tr>
			<th>예약인원수</th>
			<th>${arr.p_num}</th>
		</tr>
		<tr>
			<th>예약날짜</th>
			<th>${arr.c_reqDate}</th>
		</tr>
		<tr>
			<th>예약시간</th>
			<th>${arr.c_reqTime}</th>
		</tr>
	</table>
</section>
</body>
</html>