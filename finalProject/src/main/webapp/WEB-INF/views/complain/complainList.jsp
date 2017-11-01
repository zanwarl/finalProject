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

complainList 

<table>
	<thead>
	
		<tr>
			<th>idx</th>
			<th>신고자</th>
			<th>피신고자</th>
			<th>타입</th>
			<th>날짜</th>
			<th>상태</th>
			<th>담당자</th>
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
      
      <c:url value ="complainContent.do" var ="contentURL">
      	<c:param name="idx" value="${dto.idx }"></c:param>
       </c:url>
      
      <tr>
      
         <td><a href="${contentURL }"> ${dto.idx}</a></td>
         <td>${dto.sender}</td>
         <td>${dto.receiver}</td>
         <td>${dto.type}</td>
         <td>${dto.writedate}</td>
         <td>${dto.res}</td>
         <td>${dto.incharge}</td>
      </tr>
   </c:forEach>
	
	</tbody>
	
	<tfoot>
		<tr>
		
			<td colspan="7">
				${pageStr }
			
			</td>
		</tr>
	
	</tfoot>

</table>

</body>
</html>