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

superHost

<form action="superHostList.do">
	

	<input type="radio" name="type" value="1">숙박
	<input type="radio" name="type" value="2">레스토랑
	<input type="radio" name="type" value="3">문화체험
	<input type="submit" value="ok">
</form>

<hr>

<c:choose>
	<c:when test="${param.type==1 }">
	숙박 부문 슈퍼호스트
	</c:when>
	<c:when test="${param.type==2 }">
	레스토랑 부문 슈퍼호스트
	</c:when>
	<c:when test="${param.type==3 }">
	문화체험 부문 슈퍼호스트
	</c:when>
	<c:otherwise>
	숙박 부문 슈퍼호스트 
	</c:otherwise>


</c:choose>
<table>

		<thead>
		<tr>
			<th>회원번호</th>
		</tr>
	</thead>
		
	
	<tbody>
		
		<c:if test="${empty list }">
		
			<tr>
				<td> 회원이 없습니다. </td>
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