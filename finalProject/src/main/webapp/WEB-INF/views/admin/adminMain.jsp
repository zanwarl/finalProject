<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${empty sId }">
	
	<a href="adminLogin.do">로그인</a>

</c:if>
<c:if test="${!empty sId }">
	${sId }님 로그인중 ...<a href="adminLogout.do">로그아웃</a>
</c:if>


<ul>
	<li><a href="complainList.do">신고관리</a></li>
	<li><a href="adminLogin.do">관리자로그인</a></li>
	<li><a href="blackList.do">블랙리스트</a></li>
	<li><a href="superHost.do">슈퍼호스트</a></li>
</ul>



</body>
</html>