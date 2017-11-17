<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
tfoot td{
	
	
	text-align: center;
	
}

</style>

<meta charset=UTF-8">
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
  <h1>공지사항내용</h1>
</div>



<div class="w3-container">
<table>
<c:set var ="dto" value="${con}"></c:set>

	<thead>
	
		<tr>
			<th>글번호</th>
			
         <td>${dto.noticeIdx}</td>
			
		
			<th>글쓴이</th>
         <td>${dto.writer}</td>
	
			<th>날짜</th>
         <td>${dto.writedate}</td>

		
        		</tr>
	</thead>
	<tbody>
	<tr>
	      	<th>제목</th>
         <td colspan="5">${dto.title}</td>
	</tr>

      
      <tr>
      		<th colspan="6">내용</th>
      		


      </tr>
      
      <tr>
      		         <td colspan="6">${dto.content}</td>
      		


      </tr>

	</tbody>
	
	<tfoot>
	
		<tr>
			<td colspan="6">
			<c:url var ="noticeUpdateURL" value="noticeUpdate.do">
				<c:param name="idx" value="${dto.noticeIdx }"></c:param>
			</c:url>
			
			<c:url var ="noticeDeleteURL" value="noticeDeleteConfirm.do">
				<c:param name="idx" value="${dto.noticeIdx }"></c:param>
			</c:url>
			
			
			<a href="${noticeUpdateURL }">수정</a>|
			<a href="${noticeDeleteURL }">삭제</a>
			</td>
		</tr>
	</tfoot>	


</table>




</div>

</div>
      







  





 


</body>
</html>