
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>

<style type="text/css">
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

tfoot td {
	text-align: center;
}

tr:hover {
	background-color: #f5f5f5
}
</style>



<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>




<jsp:include page="/header.do"></jsp:include>



	<div id="contents">

<!-- ---------본문내용---------------  -->

  <h1>${sId }님의 신고 내역입니다.</h1>



<table id="hor-minimalist-b">
	<thead>
	
		<tr>
			<th>신고번호</th>
			<th>신고대상</th>
			<th>타입</th>
			<th>신고일</th>
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
         <td>
<c:choose>
									<c:when test="${dto.type == 1 }">
    									호스트-&gt;게스트
    								</c:when>
									<c:when test="${dto.type == 2 }">
    									게스트-&gt;호스트
    								</c:when>
									<c:when test="${dto.type == 3 }">
    									기타
    								</c:when>
								</c:choose>

</td>
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


</div>

<jsp:include page="/footer.do"></jsp:include>
</body>
</html>





<%-- 


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html >
<html>
<head>



<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- Sidebar -->




<!-- Page Content -->











 


</body>
</html> --%>