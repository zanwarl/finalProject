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

<jsp:include page="/header.do"></jsp:include>



	<div id="contents">





  <h1>공지사항내용</h1>


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

	</tfoot>	


</table>








  


</div>

<jsp:include page="/footer.do"></jsp:include>


 


</body>
</html>