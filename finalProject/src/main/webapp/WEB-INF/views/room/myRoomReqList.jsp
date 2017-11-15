<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html >
<html>
<head>


<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>




<jsp:include page="/header.do"></jsp:include>



	<div id="contents">

<!-- ---------본문내용---------------  -->

<table>

<!-- 	<thead>
		<tr>
			<th>방이름 </th>
		
		</tr>
	</thead> -->
		
	
	<tbody>
		
		<c:if test="${empty list }">
		
			<tr>
				<td>예약내역이 없습니다 </td>
			</tr>
		</c:if>
			<c:forEach var ="dto" items ="${list }">
				<tr>
				
					<td>${dto}</td>
				
				

				</tr>
				<%-- <tr>
					
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
					
					</tr> --%>
			</c:forEach>
		
	</tbody>	

<%-- 	<tfoot>
		<tr>
			<td>${pageStr}</td>
		</tr>
<!-- 	
		<tr>
			<td><a href="">글쓰기</a></td>
		</tr> -->
	
	</tfoot>
 --%>
</table>



</div>

<jsp:include page="/footer.do"></jsp:include>
</body>
