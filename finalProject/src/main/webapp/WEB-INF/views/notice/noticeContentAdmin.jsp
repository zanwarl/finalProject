<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html >
<html>
<head>


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
<c:set var ="dto" value=  "${con}"></c:set>

	<thead>
	
		<tr>
			<th>idx</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>내용</th>
			<th>날짜</th>
		</tr>
	</thead>
	<tbody>

      
      <tr>
      
         <td>${dto.noticeIdx}</td>
         <td>${dto.title}</td>
         <td>${dto.writer}</td>
         <td>${dto.content}</td>
         <td>${dto.writedate}</td>
      </tr>

	</tbody>
	
	<tfoot>
	
		<tr>
			<td>
			<c:url var ="noticeUpdateURL" value="noticeUpdate.do">
				<c:param name="idx" value="${dto.noticeIdx }"></c:param>
			</c:url>
			
			<c:url var ="noticeDeleteURL" value="noticeDeleteConfirm.do">
				<c:param name="idx" value="${dto.noticeIdx }"></c:param>
			</c:url>
			
			
			<a href="${noticeUpdateURL }">수정</a>|
			<a href="${noticeDeleteURL }">삭제</a>|
			</td>
		</tr>
	</tfoot>	


</table>




</div>

</div>
      







  





 


</body>
</html>