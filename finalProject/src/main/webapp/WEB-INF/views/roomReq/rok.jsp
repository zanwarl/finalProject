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
			<th>�����ο���</th>
			<th>${arr.count}</th>
		</tr>
		<tr>
			<th>���೯¥</th>
			<th>${arr.reqDate}</th>
		</tr>
		<tr>
			<th>üũ��</th>
			<th>${arr.checkindate}</th>
		</tr>
		<tr>
			<th>üũ�ƿ�</th>
			<th>${arr.checkoutdate}</th>
		</tr>
	</table>
</section>
</body>
</html>