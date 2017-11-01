<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<th>음식점 이름</th>
	</tr>
	<c:if test="${empty list}">
		<tr>
			<td colspan="4" align="center">
				등록된 글이 없습니다.
			</td>
		</tr>
	</c:if>
	<c:forEach var="fdto" items="${list}">
		<tr>
		<c:url var="Url" value="foodContent.do">
			<c:param name="idx" value="${fdto.useridx}"></c:param>
		</c:url>
			<td><a href="${Url}">${fdto.fname}</a></td>
		</tr>	
	</c:forEach>
</table>
<a href="addFoodForm.do">음식점 등록</a>
</body>
</html>