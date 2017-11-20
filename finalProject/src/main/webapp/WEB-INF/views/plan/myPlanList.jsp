<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.plan_list {
	width: 1500px;
	margin: 0 auto;
}
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<div id="contents">

<c:set var="i" value="0" />
<c:set var="j" value="4" />
<table width="600" height="auto" border="1" cellspacing="0" class="plan_list">
<c:url value="${contextPath }/img/city/thumb/" var="src"/> 
	<thead>
	<!-- 분류 영역 -->
		<tr>
			<td colspan="4"><a href="plan.do?sort=f">인기</a> | <a href="plan.do?sort=n">신규</a></td>
		</tr>
	</thead>
	<!-- 본문 영역 -->
	<tbody>
	<c:forEach var="list" items="${list }">
	<c:if test="${i%j == 0 }">
	<tr>
	</c:if>
		<td>
		<a href="planContent.do?pidx=${list.plan_idx}">
		<img src="${src}${list.plan_file}" width="350" height="150"><br>
		${list.plan_explain }</a> <br>
		<a href="planContent.do?pidx=${list.plan_idx}">${list.plan_subject }</a>
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
			<td colspan="3">${page }</td>
			<td><a href="planMake.do">일정 만들기</a></td>
		</tr>
	</tfoot>
</table>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>