<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html >
<html>
<head>

<style type="text/css">

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
input button {
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
  <h1>공지사항 수정</h1>
</div>



<div class="w3-container">






<form action="noticeUpdate.do" method="post">


<table>

<c:set var ="dto" value=  "${con}"></c:set>


	
		<tr>
			<th>글번호</th>
			<td><input type="text" style="border: none;" name="noticeIdx" value="${dto.noticeIdx}" readonly="readonly"> </td>
		
		</tr>
		<tr>
				<th>제목</th>
				
         <td><input type="text" name="title" value="${dto.title}" style="width: 100%"> </td>
		
		
		</tr>
		<tr>
			<th>글쓴이</th>
		
		
         <td>${dto.writer}</td>
		</tr>
		<tr>
			<th>내용</th>
			
			
			
         <td>
         <textarea rows="10" cols="" name="content">${dto.content}</textarea> </td>
		
		</tr>


      
 

	<tfoot>
	
		<tr>
			<td colspan="2">
			<input type="submit" value="수정하기" style="border: none;">
			</td>
		</tr>
	</tfoot>	


</table>
</form>



</div>

</div>
      











 


</body>
</html>