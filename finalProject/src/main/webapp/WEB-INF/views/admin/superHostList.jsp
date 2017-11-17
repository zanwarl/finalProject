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

tr:hover {
	background-color: #f5f5f5
}

tfoot td {
	text-align: center;
}
</style>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<!-- Sidebar -->

	<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 25%">
		<%@include file="adminMenu.jsp"%>

	</div>

	<!-- Page Content -->
	<div style="margin-left: 25%">

		<div class="w3-container w3-teal">
			<h1>슈퍼호스트</h1>
		</div>



		<div class="w3-container">


<br>

			<form action="superHostUpdate.do" method="post">
				<input type="text" name="point" style="width: 50px">포인트 이상 보유했을 시,
				슈퍼호스트 자격을 얻게 됩니다. <input type="submit" value="ok" style="border: none;">
			</form>
			<br>
			<table>

				<thead>
					<tr>
						<th>순위</th>
						<th>id</th>
						<th>점수</th>
					</tr>
				</thead>


				<tbody>

					<c:if test="${empty list }">

						<tr>
							<td>회원이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${list }">
						<tr>

							<td>${dto.rank }</td>
							<td>${dto.member_id }</td>
							<td>${dto.member_host_grade }</td>
						</tr>
					</c:forEach>

				</tbody>

				<tfoot>

					<c:if test="${not empty list }">

						<tr>

							<td colspan="3">${pageStr }</td>
						</tr>
					</c:if>
					
					<tr>
						<td colspan="3">
							<form action="superHostSearch.do">
								ID <input type="text" name="id" >
								<input type="submit" value="검색" style="border: none;">
							</form>
						</td>
					</tr>
		
				</tfoot>




			</table>



		</div>

	</div>





</body>
</html>