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



${partner}님과의 대화입니다.



<table>
	<thead>
	
	
		<tr>
			<th>idx</th>
			<th>보낸사람</th>
			<th>받는사람</th>
			<th>내용</th>
			<th>날짜</th>
			
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty list}">
      <tr>
         <td colspan="5" align="center">
         메시지가 없습니다. 
 		 </td>
      </tr>
   </c:if>
   <c:forEach var="dto" items="${list}">
      
 
      
      <tr>
      
       
         <td>${dto.idx}</td>
         <td>${dto.sender }</td>
         <td>${dto.receiver }</td>
         


         <td>${dto.content}</td>
         <td>${dto.writedate}</td>
       
      </tr>
   </c:forEach>
	
	</tbody>

</table>








</body>
</html>