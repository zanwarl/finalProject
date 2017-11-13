<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<meta  charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<!-- Sidebar -->

<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">

<jsp:include page="/adminMenu.do"></jsp:include>

</div>

<!-- Page Content -->
<div style="margin-left:25%">

<div class="w3-container w3-teal">
  <h1>voc관리</h1>
</div>



<div class="w3-container">
<table border="1" cellspacing = "0" width = "450" >
		<thead>
			<tr>
				<th>idx</th>
				<th>writer</th>
				<th>subject</th>
				<th>writeDate</th>
			
				<th>ref</th>
				<th>lev</th>
				<th>sunbun</th>

			
			</tr>
		</thead>
		
		
			
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td>no data</td>
				</tr>
			
			</c:if>
			
			<c:forEach var="dto" items="${list}" >
				<tr>
					<td>${dto.idx }</td>
					<td>${dto.writer }</td>
					<td>
					
					<c:forEach var="i" step="1" begin="0" end="${dto.lev }">
						&nbsp;
						
					
					</c:forEach>
					

					<c:url value ="vocConAdmin.do" var="contentURL">
						<c:param name="idx" value="${dto.idx }"></c:param>
					
					</c:url>
					
					<a href="${contentURL}">${dto.subject } </a></td>
					<td>${dto.writeDate }</td>
				
					<td>${dto.ref }</td>
					<td>${dto.lev }</td>
					<td>${dto.sunbun }</td>
			
				
				</tr>
			</c:forEach>
		</tbody>
	
	
 		<tfoot>
		
		<tr>
		<td colspan="8">
			${pageStr}
				
			
		</td>
		</tr>
		</tfoot>  
	</table>
	


</div>

</div>
      



</body>
</html>