
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>


<style type="text/css">

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 8px;
    text-align: center
    ;
    border-bottom: 1px solid #ddd;
}

tfoot td{
text-align: center;
}

tr:hover{background-color:#f5f5f5}
</style>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/header.do"></jsp:include>



	<div id="contents">
	
	<h1>공지사항</h1>

		<table>

				<tr>
					<th>글번호</th>
					<th style="text-align: letter-spacing: ;" width="70%">제목</th>
					<th>날짜</th>
				</tr>
		

				<c:if test="${empty list }">

					<tr>
						<td colspan="3">등록된 공지사항이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${list }">
					<tr>

						<td>${dto.noticeIdx }</td>
						<c:url value="noticeContent.do" var="contentURL">
							<c:param name="idx" value="${dto.noticeIdx }"></c:param>

						</c:url>



						<td width="70%" style="text-align: left;"><a href="${contentURL}">${dto.title }</a></td>
						<td>${dto.writedate }</td>
					</tr>
				</c:forEach>

		
			<tfoot>
				
				<c:if test="${not empty list }">
				<tr>
				
					<td colspan="3" style="text-align: center;">${pageStr}</td>
				</tr>
				</c:if>
				

				<!-- 	<tr>
			<td><a href="noticeWrite.do">글쓰기</a></td>
		</tr>
	 -->
			</tfoot>

		</table>








	</div>





	<jsp:include page="/footer.do"></jsp:include>

</body>
</html>