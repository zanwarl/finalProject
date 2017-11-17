
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

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
text-align: center;
}

tr:hover{background-color:#f5f5f5}
</style>
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
  <h1>공지사항 리스트</h1>
</div>



<div class="w3-container">





<table>

	<thead>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>날짜</th>
		</tr>
	</thead>
		
	
	<tbody>
		
		<c:if test="${empty list }">
		
			<tr>
				<td colspan="4">등록된 공지사항이 없습니다. </td>
			</tr>
		</c:if>
			<c:forEach var ="dto" items ="${list }">
				<tr>
				
					<td>${dto.noticeIdx }</td>
					<c:url  value = "noticeContentAdmin.do" var ="contentURL">
						<c:param name="idx" value = "${dto.noticeIdx }"></c:param>
						
					</c:url>
					
				
					
					<td><a href="${contentURL}">${dto.title }</a></td>
					<td>${dto.writer }</td>
					<td>${dto.writedate }</td>
				</tr>
			</c:forEach>
		
	</tbody>	

	<tfoot>
	
			<c:if test="${not empty list }">
		
				<tr>
			<td colspan="4">${pageStr}</td>
		</tr>
	
		</c:if>

		<tr>
			<td colspan="4"><a href="noticeWrite.do">글쓰기</a></td>
		</tr>
	
	</tfoot>

</table>



</div>

</div>
      

















</body>
</html>