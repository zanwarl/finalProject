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







  <h1>공지사항수정</h1>
<form action="noticeUpdate.do" method="post">


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
      
         <td><input type="text" name="noticeIdx" value="${dto.noticeIdx}" readonly="readonly"> </td>
         <td><input type="text" name="title" value="${dto.title}"> </td>
         <td>${dto.writer}</td>
         <td><input type="text" name="content" value="${dto.content}"> </td>
         <td>${dto.writedate}</td>
      </tr>

	</tbody>
	
	<tfoot>
	
		<tr>
			<td>
			<input type="submit" value="수정하기">
			</td>
		</tr>
	</tfoot>	


</table>
</form>







 


</body>
</html>