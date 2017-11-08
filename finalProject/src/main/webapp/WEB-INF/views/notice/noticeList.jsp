
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>


<meta  charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<table>

	<thead>
		<tr>
			<th>idx</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>날짜</th>
		</tr>
	</thead>
		
	
	<tbody>
		
		<c:if test="${empty list }">
		
			<tr>
				<td>등록된 공지사항이 없습니다. </td>
			</tr>
		</c:if>
			<c:forEach var ="dto" items ="${list }">
				<tr>
				
					<td>${dto.noticeIdx }</td>
					<c:url  value = "noticeContent.do" var ="contentURL">
						<c:param name="idx" value = "${dto.noticeIdx }"></c:param>
						
					</c:url>
					
				
					
					<td><a href="${contentURL}">${dto.title }</a></td>
					<td>${dto.writer }</td>
					<td>${dto.writedate }</td>
				</tr>
			</c:forEach>
		
	</tbody>	

	<tfoot>
		<tr>
			<td>${pageStr}</td>
		</tr>
	
		<tr>
			<td><a href="noticeWrite.do">글쓰기</a></td>
		</tr>
	
	</tfoot>

</table>








</body>
</html>