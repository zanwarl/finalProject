<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html >
<html>
<head>
<!-- <script type="text/javascript">

	function givePenalty(x) {
		if (confirm("패널티 주기") == true) { //확인
			window.open(x, 'givePenalty', 'width =300, height=100');


		} else {
			return;

		}


		window.self.close();



	}
</script>
 -->

<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	${param.idx }



	<%-- <c:url value="givePenalty.do" var="givePenaltyURL">
		<c:param name="idx" value="${param.idx }"></c:param>


	</c:url>

	<input type="button" value="패널티주기"
		onclick="givePenalty('${givePenaltyURL}')"> --%>
	<%-- 
<a href="${givePenaltyURL }">패널티주기</a> --%>

	<c:set var="dto" value="${userInfo }"></c:set>



	<table align="center" style="text-align: left;">
		<tr>
			<th>아이디</th>
			<td>${dto.member_id}</td>
		</tr>


		<tr>
			<th>이름</th>
			<td>${dto.member_name}</td>
		</tr>
		<tr>
			<th>성별</th>
			<td><c:if test="${dto.member_sex==1 }">
					M
		</c:if>
			<td><c:if test="${dto.member_sex==2 }">
					F
		</c:if></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${dto.member_birth}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${dto.member_tel }</td>
		</tr>
		<tr>
			<th>E-mail</th>
			<td>${dto.member_email }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${dto.member_addr }</td>
		</tr>
		<tr>
			<th>누적패널티</th>
			<td>${dto.member_host_grade }</td>
		</tr>
	</table>

</body>
</html>