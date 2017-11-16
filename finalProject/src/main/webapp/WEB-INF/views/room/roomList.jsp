<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<script type="text/javascript">
function roomadd() {
	location.href="loginCk.do";
	location.href="roomadd.do";
}
	<jsp:include page="/loginCk.do"></jsp:include>
</script>
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>숙소이름</th>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td colspan="4" align="center">등록된 글이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="rdto" items="${list}" varStatus="status">
			<c:if test="${status.index%4==0}">
				<tr></tr>
			</c:if>
			<c:url var="Url" value="roomContent.do">
				<c:param name="roomidx" value="${rdto.roomidx}"></c:param>
			</c:url>
			<td><a href="${Url}">${rdto.roomname}</a></td>
		</c:forEach>
	</table>
		<input type="button" value="숙소등록" onclick="roomadd()">
</body>
</html>