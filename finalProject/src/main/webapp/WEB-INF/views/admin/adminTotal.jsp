<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

input button {
	border: none;
}

tr:hover {
	background-color: #f5f5f5
}
</style>


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- Sidebar -->

	<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 25%">
		<jsp:include page="/adminMenu.do"></jsp:include>


	</div>
	<!-- Page Content -->
	<div style="margin-left: 25%">
 
		<div class="w3-container w3-teal">
			<h1>매출통계</h1>
		</div>
<form name="total" method="post" action="total.do">

<table>	
	<tr>
		<td> 
		<input type="text" name="roomIdx">
		<input type="submit" value="숙소검색">		
		</td>
	</tr>
	<tr><td>
		${listt }
		</td></tr>
	<c:forEach var ="dto" items ="${list }">
	
				
	<tr>
		
		<td>${dto.userid}</td>
		<td>${dto.count}</td>
		<td>${dto.reqDate}</td>
		<td>${dto.checkindate}</td>
		<td>${dto.checkoutdate}</td>
		<td>${dto.total_pay}</td>
	</tr>	
	</c:forEach>
</table>
</form>
</div>
</body>
</html>