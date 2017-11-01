<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta  charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
blackList


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
				
					<td>${dto.userIdx }</td>
				</tr>
			</c:forEach>
		
	</tbody>	

	<tfoot>
		<tr>
			<td>${pateStr }</td>
		</tr>
	
	</tfoot>

</table>

</body>
</html>