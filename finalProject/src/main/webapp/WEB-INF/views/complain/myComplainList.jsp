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




<!-- Page Content -->

  <h1>신고관리</h1>



<table id="hor-minimalist-b">
	<thead>
	
		<tr>
			<th>idx</th>
			<th>대상</th>
			<th>타입</th>
			<th>날짜</th>
			<th>상태</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty list}">
      <tr>
         <td colspan="7" align="center">
         등록된 신고가 없습니다.
                  </td>
      </tr>
   </c:if>
   <c:forEach var="dto" items="${list}">
      
      <c:url value ="myComplainContent.do" var ="contentURL">
      	<c:param name="idx" value="${dto.idx }"></c:param>
       </c:url>
      
      <tr>
      
         <td><a href="${contentURL}">${dto.idx}</a></td>
       
         <td>${dto.receiver}</td>
         <td>${dto.type}</td>
         <td>${dto.writedate}</td>
     		<td><c:if test="${dto.res==0 }">
	처리중
	</c:if> <c:if test="${dto.res!=0 }">
	처리완료
	</c:if></td>
    
      </tr>
   </c:forEach>
	
	</tbody>
	
	<tfoot>
		<c:if test="${not empty list}">
		
		
		<tr>
			<td colspan="7" align="center">
				${pageStr }
			
			</td>
		</tr>
		
		
		
		</c:if>
		
	
	</tfoot>

</table>











 


</body>
</html>