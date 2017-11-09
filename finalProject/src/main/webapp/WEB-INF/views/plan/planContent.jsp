<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<div id="contents">
<c:forEach var="list" items="${list }">
${list.pland_day }
${list.pland_order } &nbsp;
<a href="tourDetail.do?contentTypeId=${list.pland_typeid }&contentId=${list.pland_code }">
<img src="${list.pland_img}" width="100"></a>${list.pland_subject } <br>
</c:forEach>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>