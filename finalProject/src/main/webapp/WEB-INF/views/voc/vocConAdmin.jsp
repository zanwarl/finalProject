<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<meta  charset=UTF-8">
<title>Insert title here</title>
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

</head>
<body>


<!-- Sidebar -->

<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
<jsp:include page="/adminMenu.do"></jsp:include>
</div>

<!-- Page Content -->
<div style="margin-left:25%">

<div class="w3-container w3-teal">
  <h1>voc content</h1>
</div>



<div class="w3-container">
<table>

<c:set var="dto" value="${con}" ></c:set>

		<tr>
			<th>문의번호</th>
			<td>${dto.idx }  </td>
		
		</tr>
		
		<tr>
			<th>글쓴이</th>
			<td>${dto.writer }  </td>
		
		</tr>
		
		
		<tr>
			<th>제목</th>
			<td>${dto.subject } </td>
		
		</tr>
		<tr>
			<th>날짜</th>
			<td>${dto.writeDate } </td>
		
		</tr>
		<tr>
			<th colspan="2" style="text-align: center;">내용</th>
		
		
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">${dto.content } </td>
		
		
		
		</tr>

		
		<tfoot>
		<tr>
		<td colspan="2">
		<c:url var="reWriteURL" value = "vocReWrite.do" >
		<c:param name="idx">${dto.idx }</c:param>
		<c:param name="ref">${dto.ref}</c:param>
		<c:param name="lev">${dto.lev }</c:param>
		<c:param name="sunbun">${dto.sunbun }</c:param>
		<c:param name="subject">${dto.subject }</c:param>
	
	</c:url>
	
	<c:url var="delURL" value = "vocDel.do"  >
		<c:param name="idx">${dto.idx }</c:param>
	
	
	</c:url>
	<a href="${reWriteURL }">답글쓰기</a>
	|<a href="vocListAdmin.do">목록으로</a>
		
		</td>
		</tr>
		</tfoot>
	</table>
	


	


</div>

</div>
      



</body>
</html>