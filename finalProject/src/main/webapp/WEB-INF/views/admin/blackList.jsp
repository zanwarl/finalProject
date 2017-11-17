<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<style type="text/css">
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 8px;
	text-align: center
	;
	border-bottom: 1px solid #ddd;
}

tr:hover {
	background-color: #f5f5f5
}

tfoot td {
	text-align: center;
}
</style>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<meta  charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- Sidebar -->

<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
<%@include file="adminMenu.jsp" %>

</div>

<!-- Page Content -->
<div style="margin-left:25%">

<div class="w3-container w3-teal">
  <h1>블랙리스트</h1>
</div>



<div class="w3-container">
<table>

	<thead>
		<tr>
			<th>회원번호</th>
			<th>아이디</th>
		</tr>
	</thead>
		
	
	<tbody>
		
		<c:if test="${empty list }">
		
			<tr>
				<td>블랙리스트인 회원이 없습니다. </td>
			</tr>
		</c:if>
			<c:forEach var ="dto" items ="${list }">
				<tr>
				
					<c:url value="blackListInfo.do" var ="blackListInfoURL">
						<!-- blackListInfo -->
						<c:param name="userIdx" value="${dto.IDX }"></c:param>
					</c:url>
				
					<td><a href="${blackListInfoURL}">${dto.IDX }</a> </td>
					<td>${dto.ID}</td>	
				</tr>
			</c:forEach>
		
	</tbody>	

	<tfoot>
		<tr  >
			<td colspan="2">${pageStr}</td>
		</tr><tr>
			<td colspan="2"><form action="blackSearchList.do">
			ID	<input type="text" name="id">
				<input type="submit" value="검색" style="border: none;">
			</form> </td>
		</tr>
	
	</tfoot>

</table>



</div>

</div>
      








</body>
</html>