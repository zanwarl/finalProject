<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<div id="contents"><!-- contents -->
내가만든~~리스트
<br>
완성된 일정 / 작성중인 일정 /
<table width="600" height="auto" border="1" cellspacing="0">
	<thead>
	<!-- 분류 영역 -->
		<tr>
			<td>인기 | 신규</td>
		</tr>
	</thead>
	<!-- 본문 영역 -->
	<tbody>
	<c:set var="i" value="0" />
	<c:set var="j" value="4" />
	<c:forEach var="list" items="${list }">
	<c:if test="${i%j == 0 }">
	<tr>
	</c:if>
		<td>
		${list.plan_idx }
		<a href="planContent.do?pidx=${list.plan_idx}">${list.plan_explain }</a> <br>
		${list.plan_subject }
		조회수 : ${list.plan_readnum } <br>
		${list.plan_name }
		</td>
	<c:if test="${i%j == j-1}">
	<tr>
	</c:if> 
	<c:set var="i" value="${i+1}" />
	</c:forEach>
	</tbody>
	<!-- 페이징, 글쓰기 영역 -->
	<tfoot>
		<tr>
			<td colspan="3">1 2 3 </td>
			<td><a href="planMake.do">일정 만들기</a></td>
		</tr>
	</tfoot>
</table>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>