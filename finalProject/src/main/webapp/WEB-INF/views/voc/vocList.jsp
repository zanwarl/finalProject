<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>

<style type="text/css">
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

tfoot td {
	text-align: center;
}

tr:hover {
	background-color: #f5f5f5
}
</style>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>




	<jsp:include page="/loginCk.do"></jsp:include>
	<jsp:include page="/header.do"></jsp:include>



	<div id="contents">

		<!-- ---------본문내용---------------  -->

		<h2>1:1문의글</h2>

		<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>subject</th>
					<th>writeDate</th>



				</tr>
			</thead>



			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="3">문의글이 없습니다.</td>
					</tr>

				</c:if>

				<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.idx }</td>
						<td><c:forEach var="i" step="1" begin="0" end="${dto.lev }">
						&nbsp;
						
					
					</c:forEach> <c:url value="vocCon.do" var="contentURL">
								<c:param name="idx" value="${dto.idx }"></c:param>

							</c:url> <a href="${contentURL}">${dto.subject } </a></td>
						<td>${dto.writeDate }</td>

						<%-- 	<td>${dto.ref }</td>
					<td>${dto.lev }</td>
					<td>${dto.sunbun }</td>
			 --%>

					</tr>
				</c:forEach>
			</tbody>


			<tfoot>


				<c:if test="${not empty list  }">
					<tr>
						<td colspan="3">${pageStr}</td>
					</tr>

				</c:if>

				<tr>
					<td colspan="3" style="text-align: center;"><a
						href="vocWrite.do">문의하기</a></td>
				</tr>
			</tfoot>
		</table>
	</div>
	 <jsp:include page="/footer.do"></jsp:include>

	
</body>
</html>




