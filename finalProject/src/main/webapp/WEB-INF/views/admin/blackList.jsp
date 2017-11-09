<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

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
						<c:param name="userIdx" value="${dto.userIdx }"></c:param>
					</c:url>
				
					<td><a href="${blackListInfoURL}">${dto.userIdx }</a> </td>
				</tr>
			</c:forEach>
		
	</tbody>	

	<tfoot>
		<tr>
			<td>${pageStr}</td>
		</tr>
	
	</tfoot>

</table>



</div>

</div>
      








</body>
</html>