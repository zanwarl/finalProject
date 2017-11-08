<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta  charset=UTF-8">
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
  <h1>신고 내역</h1>
</div>



<div class="w3-container">

신고 한 내용 <br>
<%-- 
	<c:forEach var ="dto" items="${writeList}">
		<table>
			<tr></tr>
		</table>
	</c:forEach> --%>
	
	
	<c:forEach var= "dto" items ="${writeList}">
	

	<table border="1">




<tr>
	<th>신고자</th>
	<c:url value="userInfo_noPenaltyBt.do" var= "userInfoURL">
		<c:param name="idx" value="${dto.sender }"></c:param>
	
	</c:url>
	
	
	<td> <a href="${userInfoURL }" onclick="window.open(this.href, 'userInfoPopup', 'width=300, height =500'); return false", target="_blank"> ${dto.sender } </a>
	<%-- <input type="button" value="메일" onclick="mailPopup(${dto.sender})">  --%> </td>
		<th>피신고자</th> 
		
		
	<td>
		<c:url value="userInfo_noPenaltyBt.do" var= "userInfoURL">
		<c:param name="idx" value="${dto.receiver }"></c:param>
	
	</c:url>
	
	<a href="${userInfoURL }" onclick="window.open(this.href, 'userInfoPopup', 'width=300, height =500'); return false", target="_blank"> ${dto.receiver } </a>
<%-- 	<input type="button" value="메일" onclick="mailPopup(${dto.receiver})">   --%></td>
		<th>상태</th>
	<td>${dto.res }</td>

</tr>
<tr>	
		<th>담당자</th>
	<td>
		<c:if test="${empty dto.incharge }">
		
		<input type="text" name="incharge" value ="${sId}" readonly="readonly">
		
		</c:if>
		<c:if test="${not empty dto.incharge }">
			${dto.incharge }
		
		</c:if>
	
</td>
		<th>날짜</th>
	<td>${dto.writedate }</td>
		<th>타입</th>
	<td>${dto.type }</td>


</tr>
<tr>
	<th colspan="6">
	신고내용
	</th>

</tr>
<tr>
<td>
${dto.content }
</td>
</tr>

<tr>
	<th colspan="6">
	처리결과
	</th>

</tr>

	<tr>
		<td>
		
	
			${dto.resContent }
	
		
		</td>
		
	</tr>
	


</table>
		</c:forEach>
	
	
	<br>
	신고당한내용<br>
		<c:forEach var= "dto" items ="${receiveList}">
	

	<table border="1">




<tr>
	<th>신고자</th>
	<c:url value="userInfo_noPenaltyBt.do" var= "userInfoURL">
		<c:param name="idx" value="${dto.sender }"></c:param>
	
	</c:url>
	
	
	<td> <a href="${userInfoURL }" onclick="window.open(this.href, 'userInfoPopup', 'width=300, height =500'); return false", target="_blank"> ${dto.sender } </a>
	<%-- <input type="button" value="메일" onclick="mailPopup(${dto.sender})">   --%></td>
		<th>피신고자</th> 
		
		
	<td>
		<c:url value="userInfo_noPenaltyBt.do" var= "userInfoURL">
		<c:param name="idx" value="${dto.receiver }"></c:param>
	
	</c:url>
	
	<a href="${userInfoURL }" onclick="window.open(this.href, 'userInfoPopup', 'width=300, height =500'); return false", target="_blank"> ${dto.receiver } </a>
	<%-- <input type="button" value="메일" onclick="mailPopup(${dto.receiver})">  --%> </td>
		<th>상태</th>
	<td>${dto.res }</td>

</tr>
<tr>	
		<th>담당자</th>
	<td>
	
	
		<c:if test="${not empty dto.incharge }">
			${dto.incharge }
		
		</c:if>
	
</td>
		<th>날짜</th>
	<td>${dto.writedate }</td>
		<th>타입</th>
	<td>${dto.type }</td>


</tr>
<tr>
	<th colspan="6">
	신고내용
	</th>

</tr>
<tr>
<td>
${dto.content }
</td>
</tr>
<tr>
	<th colspan="6">
	처리결과
	</th>

</tr>

	<tr>
		<td>
		
	
			${dto.resContent }
	
		
		</td>
		
	</tr>
	

</table>
		</c:forEach>
	
	

</div>

</div>
      










</body>
</html>