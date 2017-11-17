<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html >
<html>
<head>

<style>


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




<jsp:include page="/header.do"></jsp:include>



	<div id="contents">

<!-- ---------본문내용---------------  -->

<table>

	<thead>
		<tr>
		
			<th>방번호 </th>
			<th>방이름 </th>
		
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
				<%-- 
					<td><c:out value="${dto.roomidx }"></c:out></td>
					<td><c:out value="${dto.roomname }"></c:out></td> --%>
				
				
					<td>${dto.ROOMIDX}</td>
					<c:url value="roomReqInfo.do" var="roomReqInfoURL" >
						<c:param name="roomIdx" value="${dto.ROOMIDX }"></c:param>
					</c:url>
					
					<td><a href="${roomReqInfoURL }">${dto.ROOMNAME}</a></td> 
				
				

				</tr>
				
			</c:forEach>
		
	</tbody>	

</table>



</div>

<jsp:include page="/footer.do"></jsp:include>
</body>
