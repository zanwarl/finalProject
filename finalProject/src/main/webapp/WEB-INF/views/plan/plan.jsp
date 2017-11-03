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
${list.plan_idx }
<a href="planContent.do?idx=${list.plan_idx}">${list.plan_explain }</a> <br>
${list.plan_subject }
조회수 : ${list.plan_readnum } <br>
${list.plan_name }
<br><br>
</c:forEach>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>