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







  <h1>공지사항내용</h1>




<table>
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
      
         <td>${list.noticeIdx}</td>
         <td>${list.title}</td>
         <td>${list.writer}</td>
         <td>${list.content}</td>
         <td>${dto.writedate}</td>
      </tr>

	</tbody>
	
	

</table>






 


</body>
</html>