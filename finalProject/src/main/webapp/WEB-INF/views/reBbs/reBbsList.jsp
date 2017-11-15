<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>리뷰게시판</h2>
<table border="1" cellspacing="0" width="450">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="3" align="center">
				${pageStr }
			</td>
			<td>
				<a href="reBbsWrite.do">글쓰기</a>
			</td>
		</tr>
	</tfoot>
	<tbody>
	<c:if test="${empty list }">
		<tr>
			<td colspan="4"	align="center">
				등록된 게시글이 없습니다.
			</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.rebbs_idx }</td>
		<c:url var="contentUrl" value="reBbsContent.do">
			<c:param name="idx">${dto.rebbs_idx }</c:param>
		</c:url>
		<td><a href="${contentUrl }">${dto.subject }</a></td>	
		<td>${dto.writer }</td>
		<td>${dto.readnum }</td>
	</tr>
	</c:forEach>	
	</tbody>

</table>
</body>
</html>











