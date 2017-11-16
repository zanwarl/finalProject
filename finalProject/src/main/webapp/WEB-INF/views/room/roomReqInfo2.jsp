<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<table>
	<tr>
		<th>예약번호</th>
		<td>${list.REQIDX }</td>
	</tr>
	
	
	<tr>
		<th>이름</th>
		<td>${list.NAME }</td>
	</tr>
	
	
	<tr>
		<th>성별</th>
		<td>${list.GENDER }</td>
	</tr>
	
	
	<tr>
		<th>전화번호</th>
		<td>${list.TEL }</td>
	</tr>
	
	
	<tr>
		<th>인원수</th>
		<td>${list.COUNT }</td>
	</tr>
	
	
	<tr>
		<th>날짜</th>
		<td>${list.CHECKINDATE }~${list.CHECKOUTDATE }</td>
	</tr>
	
	

</table>

</body>
</html>