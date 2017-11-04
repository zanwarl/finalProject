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





<table>
	<thead>
	
		<tr>
			<th>idx</th>
			<th>대화상대</th>
			<th>내용</th>
			<th>날짜</th>
			
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty list}">
      <tr>
         <td colspan="4" align="center">
         메시지가 없습니다. 
 		 </td>
      </tr>
   </c:if>
   <c:forEach var="dto" items="${list}">
      
 
      
      <tr>
      
       
         <td>${dto.idx}</td>
         <c:if test="${dto.sender == 1 }">
         	<td>${dto.receiver } </td>
         </c:if>
         <c:if test="${dto.sender != 1 }">
         	<td>${dto.sender } </td>
         </c:if>
         

         <td>${dto.content}</td>
         <td>${dto.writedate}</td>
       
      </tr>
   </c:forEach>
	
	</tbody>
	
	<tfoot>
		<c:if test="${not empty list}">
		
		
		<tr>
			<td colspan="4" align="center">
				${pageStr }
			
			</td>
		</tr>
		
		
		
		</c:if>
		
		<!-- <tr>
			<td colspan="7" align="center">
				<form action="complainSearch.do" method="get">
					<select name="key">
						<option value="1">idx</option>
						<option value="2">신고자</option>
						<option value="3">피신고자</option>
						<option value="4">담당자</option>

					</select>
					
					
					<input type="text" name="val">
					<input type="submit" value="검색">
				
				</form>
				<a href="noAnsComplainList.do">미처리신고</a>
			</td>
			
		</tr> -->
	
	</tfoot>

</table>








</body>
</html>