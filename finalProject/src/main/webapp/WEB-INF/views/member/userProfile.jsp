<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html >
<html>
<head>


<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/header.do"></jsp:include>



	<div id="contents">


		${param.userId }님의 프로필 페이지입니다. <br> ${param.userId }님의 숙소 리스트

		<c:forEach var="dto" items="${list }">
			<c:url value="${contextPath }/img/room/" var="src" />


			<table>
			<c:url value="roomContent.do" var="roomConURL">
				<c:param name="roomidx" value="${dto.ROOMIDX }"></c:param>
			</c:url>
				<tr>
					<th><a href="${roomConURL }"><img src="${src }${dto.FILENAME}"></a></th>
				
				</tr>
				<tr>
						<td><a href="${roomConURL }">${dto.ROOMNAME } </a></td>
				
				</tr>
			</table>
		</c:forEach>
	</div>

	<jsp:include page="/footer.do"></jsp:include>
</body>
</html>