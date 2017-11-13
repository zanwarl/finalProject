<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


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
  <h1>신고관리</h1>
</div>



<div class="w3-container">
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
      
         <td><a href="${contentURL}">${dto.idx}</a></td>
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
		<c:if test="${not empty list}">
		
		
		<tr>
			<td colspan="7" align="center">
				${pageStr }
			
			</td>
		</tr>
		
		
		
		</c:if>
		
		<tr>
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
			
		</tr>
	
	</tfoot>

</table>




</div>

</div>
      








 


</body>
</html>