<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

tr:hover{background-color:#f5f5f5}
</style>


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Sidebar -->

	<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 25%">
		<jsp:include page="/adminMenu.do"></jsp:include>


	</div>




	<!-- Page Content -->
	<div style="margin-left: 25%">

		<div class="w3-container w3-teal">
			<h1>신고관리</h1>
		</div>



		<div class="w3-container">
			<table id="hor-minimalist-b">
				<thead>

					<tr>
						<th>신고번호</th>
						<th>From</th>
						<th>To</th>
						<th>타입</th>
						<!-- 1: from host to guest 2: from guest to host  -->
						<th>날짜</th>
						<th>상태</th>
						<th>담당자</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="7" align="center">등록된 신고가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${list}">

						<c:url value="complainContent.do" var="contentURL">
							<c:param name="idx" value="${dto.idx }"></c:param>
						</c:url>

			
						<tr>
								<td><a href="${contentURL}">${dto.idx}</a></td>
							<td>${dto.sender}</td>
							<td>${dto.receiver}</td>
							<td><c:choose>
									<c:when test="${dto.type == 1 }">
    									호스트-&gt;게스트
    								</c:when>
									<c:when test="${dto.type == 2 }">
    									게스트-&gt;호스트
    								</c:when>
									<c:when test="${dto.type == 3 }">
    									기타
    								</c:when>
								</c:choose></td>
							<td>${dto.writedate}</td>
							<td>
							<c:choose>
								<c:when test="${dto.res==1 }">
									처리완료
								</c:when>
								<c:when test="${dto.res==0 }">
									미처리
								</c:when>
							</c:choose>
							</td>
							<td>${dto.incharge}</td>
							
						</tr>
					</c:forEach>

				</tbody>

				<tfoot >
					<c:if test="${not empty list}">


						<tr>
							<td colspan="7" align="center" style="text-align: center;">${pageStr }</td>
						</tr>



					</c:if>

					<tr>
						<td colspan="7" align="center" style="text-align: center;">
							<form action="complainSearch.do" method="get">
								<select name="key">
									<option value="1">idx</option>
									<option value="2">신고자</option>
									<option value="3">피신고자</option>
									<option value="4">담당자</option>

								</select> <input type="text" name="val"> <input type="submit"
									value="검색"> <a href="noAnsComplainList.do">미처리신고</a>

							</form>
						</td>

					</tr>

				</tfoot>

			</table>




		</div>

	</div>












</body>
</html>