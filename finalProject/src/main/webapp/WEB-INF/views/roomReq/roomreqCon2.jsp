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
	<c:set var="arr" value="${rdto}"/>
		<tr>
			<th>예약인원수</th>
			<th>${arr.count}</th>
		</tr>
		<tr>
			<th>예약한날짜</th>
			<th>${arr.reqdate}</th>
		</tr>
		<tr>
			<th>체크인</th>
			<th>${arr.checkindate}</th>
		</tr>
		<tr>
			<th>체크아웃</th>
			<th>${arr.checkoutdate}</th>
		</tr>
	</table>
</section>

</body>
</html>