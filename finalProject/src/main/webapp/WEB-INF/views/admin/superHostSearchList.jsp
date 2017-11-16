<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

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
			<a href="superHostUpdate.do">수정</a>
		</div>



		<div class="w3-container">


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

							<td>${pageStr }</td>
						</tr>
					</c:if>
					
					<tr>
						<td>
							<form action="superHostSearch.do">
							ID	<input type="text" name="id" >
								<input type="submit" value="검색">
							</form>
						</td>
					</tr>
		
				</tfoot>




			</table>



		</div>

	</div>



	<%-- <jsp:include page="loginInfo.jsp"></jsp:include>
 <c:if test="${empty sId }">
	
	<a href="adminLogin.do">로그인</a>

</c:if>
<c:if test="${!empty sId }">
	${sId }님 로그인중 ...<a href="adminLogout.do">로그아웃</a>
</c:if>
  
	<a href="adminLogin.do">관리자로그인</a>
	
 --%>







</body>
</html>