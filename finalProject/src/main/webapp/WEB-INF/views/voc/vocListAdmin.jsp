<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<meta  charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

tfoot td{
text-align:center;
}

tr:hover{background-color:#f5f5f5}
</style>

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
<table  >
		<thead>
			<tr>
				<th>문의번호</th>
				<th>글쓴이</th>
				<th>제목</th>
				<th>날짜</th>
			
	
			
			</tr>
		</thead>
		
		
			
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td colspan="4">등록된 문의글이 없습니다.</td>
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
				
	
				
				</tr>
			</c:forEach>
		</tbody>
	
	
 		<tfoot>
				<c:if test="${not empty list}">
				<tr>
		<td colspan="4">
			${pageStr}
				
			
		</td>
		</tr>
			</c:if>
	
		
		<tr>
			<td colspan="4">
			<form action="vocSearchList.do" method="get">
					ID
					<input type="text" name="writer">
					<input type="submit" value="검색" style="border: none;">
						<a href="vocNoAnsList.do">미답변글보기</a>
						
				</form>
			
		</td>
		</tr>
		
		
		</tfoot>  
	</table>
	


</div>

</div>
      



</body>
</html>