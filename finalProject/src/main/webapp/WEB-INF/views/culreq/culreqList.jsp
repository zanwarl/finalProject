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
	<h1>예약내역</h1>
	<c:if test="${empty list}">
		<tr>
			<td colspan="5" align="center">			
			</td>
		</tr>
	</c:if>
	<c:forEach var="crdto" items="${list}">
		<tr>
		<c:url var="Url" value="culreqCon2.do">
			<c:param name="idx" value="${crdto.creq_idx}"></c:param>
		</c:url>
			<td><a href="${goURL}">${crdto.user_id}</a></td>
		</tr>	
	</c:forEach>
</table>
<a href="culreqCon2.do">상세보기</a>
</body>
</html>