
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>


<meta  charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

  <h1>예약내역</h1>


<table>

	<thead>
		<tr>
			<th>예약번호</th>
			<th>회원아이디</th>
			<th>방번호</th>
			<th>인원수</th>
			<th>신청일</th>
			<th>체크인</th>
			<th>체크아웃</th>
			<th>상태</th>
		</tr>
	</thead>
		
	
	<tbody>
		
		<c:if test="${empty list }">
		
			<tr>
				<td>예약내역이 없습니다 </td>
			</tr>
		</c:if>
			<c:forEach var ="dto" items ="${list }">
				<tr>
				
					<td>${dto.reqidx }</td>
				
					
				
					
					<td>${dto.userid }</td>
					<td>${dto.roomidx }</td>
					<td>${dto.count }</td>
					<td>${dto.reqDate }</td>
					<td>${dto.checkindate }</td>
					<td>${dto.checkoutdate }</td>
					<td>${dto.paid }</td>

				</tr>
				<tr>
					
					<!--	@RequestMapping (value = "/roomCancel.do")
	public ModelAndView roomCancel(@RequestParam("reqIdx") int reqIdx) {  -->
					<c:url value="roomCancel.do" var="roomCancelURL" >
						<c:param name="reqIdx" value="${dto.reqidx}"></c:param>
					
					</c:url>
					<c:if test="${dto.paid !=-1 }">
					<td colspan="6">
					<a href="${roomCancelURL }">취소하기</a>
					</td>
				
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







</body>
</html>