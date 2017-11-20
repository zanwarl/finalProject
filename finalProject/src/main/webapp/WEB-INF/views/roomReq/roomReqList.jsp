
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<style>
table, td, th {
	margin-top: 50px;
	border: 1px solid #ddd;
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


<script type="text/javascript">
	function cancelRoom(x) {
		if (confirm("예약을 취소하시겠습니까?") == true) { //확인
			window.open(x, 'givePenalty', 'width =300, height=100');

		} else {
			return;
		}
		window.self.close();
	}
</script>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../header.jsp"%>

	<div id="contents">
		<h1>예약내역</h1>


		<c:if test="${empty list }">
	등록된 예약이 없습니다. 
</c:if>


		<c:forEach var="dto" items="${list }">
			<br>
			
			<c:url value="${contextPath }/img/room/" var="src"/>
	

			<c:url value="roomCancel.do" var="roomCancelURL">
				<c:param name="reqIdx" value="${dto.REQIDX}"></c:param>

			</c:url>

			<c:if test="${dto.PAID==-1 }">
				<table style="opacity: 0.2;">
			</c:if>

			<c:if test="${dto.PAID!=-1 }">
				<table>
			</c:if>



			<tr>
				<th colspan="5">[예약번호: ${dto.REQIDX }]</th>
			</tr>
			<tr>
				<td rowspan="5" >
				<img src="${src }${dto.FILENAME}" width="100%">
				</td>
			</tr>
			<tr>
				<th st>방 이름</th>
				<c:url value="roomContent.do" var="roomInfoURL">
					<c:param name="roomidx" value="${dto.ROOMIDX }"></c:param>
				</c:url>
				<td colspan="2"><a href="${roomInfoURL }">${dto.ROOMNAME }</a></td>
				<c:choose>


					<c:when test="${dto.PAID==-1 }">
						<td>취소된 예약</td>
					</c:when>

					<c:when test="${dto.CANCELDATE>=3 }">
						<td><input type="button" value="취소하기" style="border: none;"
							onclick="cancelRoom('${roomCancelURL}')"></td>
					</c:when>
					<c:otherwise>
						<td>취소불가</td>
					</c:otherwise>
				</c:choose>
				

			</tr>
			<tr>
				<th>여행 기간</th>
				<td >${dto.CHECKINDATE }~${dto.CHECKOUTDATE }</td>
				<th>예약신청일</th>
				<td>${dto.REQDATE }</td>
			</tr>
			<tr>
				<th>인원수</th>

				<td>${dto.COUNT }</td>
				<th>가격</th>
				<td>${dto.TOTAL_PAY }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td colspan="4">${dto.ADDR }</td>
			</tr>

			</table>
			<br>
		</c:forEach>


		<c:if test="${not empty list }">
		<table>
			<tr>
			
			
				<td style="text-align: center;">${pageStr}</td>
			</tr>
		</table>
		</c:if>
		
		<%-- 	<table>

			<thead>
				<tr>
					<th>예약번호</th>

					<th>방번호</th>
					<th>인원수</th>
					<th>신청일</th>
					<th>체크인</th>
					<th>체크아웃</th>
					<th>가격</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>


			<tbody>

				<c:if test="${empty list }">

					<tr>
						<td>예약내역이 없습니다</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${list }">
					<tr>

						<td>${dto.REQIDX }</td>


						<td>${dto.ROOMIDX }</td>
						<td>${dto.REQDATE }</td>
						<td>${dto.CHECKINDATE }</td>
						<td>${dto.CHECKOUTDATE }</td>


						<c:choose>

							<c:when test="${dto.PAID==-1 }">
								<td>취소된 예약</td>
							</c:when>

							<c:when test="${dto.CANCELDATE>=3 }">
								<td><a href="${roomCancelURL }">취소하기</a></td>
							</c:when>
							<c:otherwise>
								<td>취소불가</td>
							</c:otherwise>
						</c:choose>

											<c:if test="${dto.CANCELDATE>=3 and dto.PAID !=-1 }">
				
					</c:if>
					<td>
					<c:if test="${dto.CANCELDATE<3 and dto.CANCELDATE>0 }">
					취소불가
					</c:if>
					<c:if test="${dto.PAID ==-1 }">
					예약취소
					</c:if>

					</tr>

				</c:forEach>

			</tbody>

			<tfoot>
				<tr>
					<td>${pageStr}</td>
				</tr>
				<!-- 	
		<tr>
			<td><a href="">글쓰기</a></td>
		</tr> -->

			</tfoot>

		</table>
 --%>

	</div>
	<%@ include file="../footer.jsp"%>




</body>
</html>