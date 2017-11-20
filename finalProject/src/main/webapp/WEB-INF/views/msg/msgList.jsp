<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html >
<html>
<head>
<style>
table, td, th {
	margin: auto; margin-bottom : 10px;
	border: 1px solid #ddd;
	text-align: left;
	border: 1px solid #ddd;
	margin-bottom: 10px;
	word-break:break-all;
	
}

table {
	border-collapse: collapse;
	width: 70%;
}

th, td {
	padding: 15px;
	
}

th {
	width: 30%;
}

textarea {
	width: 100%;
}

tfoot td {
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<c:if test="${empty sId }">

		<script type="text/javascript">
			window.alert('로그인하세요');
			location.href = 'index.do';
		</script>
	</c:if>



	<jsp:include page="/header.do"></jsp:include>



	<div id="contents">
		<!-- ---------본문내용---------------  -->

		<c:forEach var="dto" items="${list}">

			<table>
				<tr>

					<c:if test="${dto.sender == sId }">
						<td width="10%" style="border-right-color: white; text-align: center;"><b>${dto.receiver }</b></td>
					</c:if>
					<c:if test="${dto.sender != sId }">
						<td width="10%" style="border-right-color: white; text-align: center;"><b>${dto.sender }</b></td>
					</c:if>
					<c:url value="msgContent.do" var="msgContentURL">
						<c:param name="msgIdx" value="${dto.msgIdx}"></c:param>

					</c:url>


					<td width="60%" style="border-right-color: white;"><a href="${msgContentURL}">${dto.content}</a></td>
					<td width="20%" style="border-right-color: white; text-align: left; ">${dto.writedate}</td>

					<td width="10%" style=" text-align:center;   border-left-color: white;">
					<c:if test="${dto.isRead == 0 && dto.sender != sId}"><font color="red">new</font>	
	</c:if></td>
				</tr>
			</table>
		</c:forEach>
		<%-- <hr>

		<table>
			<thead>

				<tr>
					<th>idx</th>
					<th>대화상대</th>
					<th>내용</th>
					<th>날짜</th>
					<th></th>

				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="4" align="center">메시지가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${list}">



					<tr>


						<td>${dto.idx}</td>
						<c:if test="${dto.sender == sId }">
							<td>${dto.receiver }</td>
						</c:if>
						<c:if test="${dto.sender != sId }">
							<td>${dto.sender }</td>
						</c:if>

						<c:url value="msgContent.do" var="msgContentURL">
							<c:param name="msgIdx" value="${dto.msgIdx}"></c:param>

						</c:url>


						<td><a href="${msgContentURL}">${dto.content}</a></td>
						<td>${dto.writedate}</td>
						<td>
						<td><c:if test="${dto.isRead == 0 && dto.sender != sId}">
		new ! 		
	</c:if></td>

					</tr>
				</c:forEach>

			</tbody>

			<tfoot>
				<c:if test="${not empty list}">


					<tr>
						<td colspan="4" align="center">${pageStr }</td>
					</tr>



				</c:if>

				<!-- <tr>
			<td colspan="7" align="center">
				<form action="complainSearch.do" method="get">
					<select name="key">
						<option value="1">idx</option>
						<option value="2">신고자</option>
						<option value="3">피신고자</option>
						<option value="4">담당자</option>

					</select>
					
					
					<input type="text" name="val">
					<input type="submit" value="검색">
				
				</form>
				<a href="noAnsComplainList.do">미처리신고</a>
			</td>
			
		</tr> -->

			</tfoot>

		</table>
 --%>

	</div>

	<jsp:include page="/footer.do"></jsp:include>

</body>
</html>