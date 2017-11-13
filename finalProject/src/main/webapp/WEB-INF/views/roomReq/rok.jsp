<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
			<th>예약날짜</th>
			<th>${arr.reqDate}</th>
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