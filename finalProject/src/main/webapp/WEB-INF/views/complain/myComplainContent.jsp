<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html >
<html>
<head>

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

<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>




<jsp:include page="/header.do"></jsp:include>



	<div id="contents">
<h1>신고 내용입니다. </h1>
<!-- ---------본문내용---------------  -->

<table>

					<c:set var="dto" value="${con}"></c:set>
					<tr>
						<th width="10%">신고자</th>
						

						<td width="15%"> ${dto.sender }</td>
						<th width="10%">신고대상</th>


						<td width="15%">${dto.receiver }</td>
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
						<th colspan="6"style="text-align: center;" >신고내용</th>

					</tr>
					<tr>
						<td colspan="6">${dto.content }</td>
					</tr>

				</table>


				<table>

					<c:if test="${dto.res eq 0  }">
						<tr>
							<th style="text-align: center;">처리결과</th>
						</tr>
						<tr>
							<td>처리중입니다..</td>
						</tr>
						
					
					</c:if>

					<c:if test="${dto.res != 0   }">
						<tr>
							<th style="text-align: center;">처리결과</th>

						</tr>
						<tr>
							<td>${dto.resContent }</td>
						</tr>
					</c:if>



				</table>
</div>

<jsp:include page="/footer.do"></jsp:include>
</body>
</html>






<%-- 


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html >
<html>
<head>

<meta charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

	<table>

		<c:set var="dto" value="${con}"></c:set>
		<tr>
			<th>신고자</th>


			<td>${dto.sender }</td>
			<th>피신고자</th>


			<td>${dto.receiver }</td>
			<th>상태</th>
			<td><c:if test="${dto.res==0 }">
	처리중
	</c:if> <c:if test="${dto.res!=0 }">
	처리완료
	</c:if></td>

		</tr>
		<tr>
			<th>담당자</th>
			<td>
				<c:if test="${empty dto.incharge }">
		
		<input type="text" name="incharge" value ="${sId}" readonly="readonly">
		
		</c:if> <c:if test="${not empty dto.incharge }">
			${dto.incharge }
		
		</c:if>

			</td>
			<th>날짜</th>
			<td>${dto.writedate }</td>
			<th>타입</th>
			<td>${dto.type }</td>


		</tr>
		<tr>
			<th colspan="6">신고내용</th>

		</tr>
		<tr>
			<td>${dto.content }</td>
		</tr>

	</table>


	<table>
		<tr>
			<th>처리결과</th>

		</tr>
		<tr>
			<td><c:if test="${dto.res != 0   }">
			${dto.resContent }
			</c:if></td>

		</tr>

	</table>














</body>
</html> --%>