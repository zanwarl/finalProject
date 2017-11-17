<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html >
<html>
<head>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<meta charset=UTF-8">
<style>
table, td, th {
	margin-top: 50px; border : 1px solid #ddd;
	text-align: left;
	border: 1px solid #ddd;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 15px;
}

textarea {
	width: 100% ; 
}
input {
	border: none;
}
</style>
<title>Insert title here</title>
<script type="text/javascript">


function mailPopup(receiver){
	window.open ('sendMail.do?receiver='+receiver, 'sendMail', 'width= 500, height= 500');
}
 
 
</script>

</head>
<body>


	<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 25%">
		<jsp:include page="/adminMenu.do"></jsp:include>


	</div>

	<!-- Page Content -->
	<div style="margin-left: 25%">

		<div class="w3-container w3-teal">
			<h1>신고관리</h1>
		</div>



		<div class="w3-container">

			<form action="complainAns.do" method="post">

				<table>

					<c:set var="dto" value="${con}"></c:set>
					<tr>
						<th>신고자</th>
						<c:url value="userInfo.do" var="userInfoURL">
							<c:param name="idx" value="${dto.sender }"></c:param>

						</c:url>


						<td><a href="${userInfoURL }"
							onclick="window.open(this.href, 'userInfoPopup', 'width=600, height =400'); return false"
							, target="_blank"> ${dto.sender } </a> <input type="button"
							value="메일" onclick="mailPopup(${dto.sender})"></td>
						<th>신고대상</th>


						<td><c:url value="userInfo.do" var="userInfoURL">
								<c:param name="idx" value="${dto.receiver }"></c:param>

							</c:url> <a href="${userInfoURL }"
							onclick="window.open(this.href, 'userInfoPopup', 'width=600, height =400'); return false"
							, target="_blank"> ${dto.receiver } </a> <input type="button"
							value="메일" onclick="mailPopup(${dto.receiver})"></td>
						<th>상태</th>
						<td><c:if test="${dto.res ==1}">
		처리완료
	</c:if> <c:if test="${dto.res==0 }">
	미처리
	</c:if></td>

					</tr>
					<tr>
						<th>담당자</th>
						<td><c:if test="${empty dto.incharge }">

								<input type="text" name="incharge" value="${adminIdx}"
									readonly="readonly">

							</c:if> <c:if test="${not empty dto.incharge }">
			${dto.incharge }
		
		</c:if></td>
						<th>날짜</th>
						<td>${dto.writedate }</td>
						<th>타입</th>
						<td><c:choose>
								<c:when test="${dto.type==1 }">
			호스트-&gt;게스트
		</c:when>
								<c:when test="${dto.type==2 }">
			게스트-&gt;호스트
		</c:when>
								<c:when test="${dto.type==3 }">
			기타
		</c:when>

							</c:choose></td>


					</tr>
					<tr>
						<th colspan="6">신고내용</th>

					</tr>
					<tr>
						<td colspan="6">${dto.content }</td>
					</tr>

				</table>


				<table>

					<c:if test="${dto.res eq 0  }">
						<tr>
							<th>처리내용</th>
						</tr>
						<tr>
							<td><textarea rows="6" cols="50" name="resContent"></textarea>
							</td>
						</tr>
						
					<tr>
						<td align="center" style="text-align: center;"><c:if test="${dto.res eq 0  }">
								<input type="submit" value="확인">
							</c:if></td>
					</tr>
					</c:if>

					<c:if test="${dto.res != 0   }">
						<tr>
							<th>처리결과</th>

						</tr>
						<tr>
							<td>${dto.resContent }</td>
						</tr>
					</c:if>



				</table>

				<input type="hidden" name="idx" value="${dto.idx }">






			</form>




		</div>

	</div>















</body>
</html>