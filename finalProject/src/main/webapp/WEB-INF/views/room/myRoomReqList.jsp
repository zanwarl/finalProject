<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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
.top {
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




<jsp:include page="/header.do"></jsp:include>



	<div id="contents">

<!-- ---------본문내용---------------  -->

<span class="top"><h1>${sId }님의 숙소 목록입니다.</h1></span>
<table>

<!-- 	<thead>
		<tr>
		
			<th>방번호 </th>
			<th>방이름 </th>
		
		</tr>
	</thead> 
		 -->
	
	<tbody>
		
		<c:if test="${empty list }">
		
			<tr>
				<td>예약내역이 없습니다 </td>
			</tr>
		</c:if>
			<c:forEach var ="dto" items ="${list }">
						<tr>
					<td colspan="2" style="border-left-color: white; border-right-color: white; border-top-color:white; "></td>
				
				</tr>
				
				<tr>
				
				
				<%-- 	<td>${dto.ROOMIDX}</td> --%>
					<c:url value="roomReqInfo.do" var="roomReqInfoURL" >
						<c:param name="roomIdx" value="${dto.ROOMIDX }"></c:param>
					</c:url>
					
					<td ><a href="${roomReqInfoURL }">${dto.ROOMNAME}</a></td> 
					<td>${dto.ADDR}</td> 
				
				

				</tr>
		
				
			</c:forEach>
		
	</tbody>	

</table>



</div>

<jsp:include page="/footer.do"></jsp:include>
</body>
