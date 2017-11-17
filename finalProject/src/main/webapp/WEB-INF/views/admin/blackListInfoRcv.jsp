<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta  charset=UTF-8">
<title>Insert title here</title>

<style>
table, td, th {
	margin-top: 50px; border : 1px solid #ddd;
	text-align: left;
	border: 1px solid gray;
}


table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 15px;.0.0
	
}



textarea {
	width: 100% ; 
}
input {
	border: none;
}
</style>

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

<c:url value="blackListInfo.do" var="sendURL">
	<c:param name="userIdx" value="${param.userIdx }"></c:param>
</c:url>
<c:url value="blackListInfoRcv.do" var="rcvURL">
	<c:param name="userIdx" value="${param.userIdx }"></c:param>
</c:url>

<a href="${sendURL }">신고 한 내용</a>|
<a href="${rcvURL }"><b>신고 받은 내용</b></a>


		<c:forEach var= "dto" items ="${receiveList}">
	

	<table border="1">




<tr>
	<th>신고자</th>
	<c:url value="userInfo_noPenaltyBt.do" var= "userInfoURL">
		<c:param name="idx" value="${dto.sender }"></c:param>
	
	</c:url>
	
	
	<td> <a href="${userInfoURL }" onclick="window.open(this.href, 'userInfoPopup', 'width=600, height =400'); return false", target="_blank"> ${dto.sender } </a>
	<%-- <input type="button" value="메일" onclick="mailPopup(${dto.sender})">   --%></td>
		<th>신고대상</th> 
		
		
	<td>
		<c:url value="userInfo_noPenaltyBt.do" var= "userInfoURL">
		<c:param name="idx" value="${dto.receiver }"></c:param>
	
	</c:url>
	
	<a href="${userInfoURL }" onclick="window.open(this.href, 'userInfoPopup', 'width=600, height =400'); return false", target="_blank"> ${dto.receiver } </a>
	<%-- <input type="button" value="메일" onclick="mailPopup(${dto.receiver})">  --%> </td>
		<th>상태</th>
						<td><c:if test="${dto.res ==1}">
		처리완료
	</c:if> <c:if test="${dto.res==0 }">
	미처리
	</c:if></td>

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
						<td><c:choose>
								<c:when test="${dto.type==1 }">
			호스트-&gt;게스트
		</c:when>
								<c:when test="${dto.type==2 }">
			게스트-&gt;호스트
		</c:when>
								<c:when test="${dto.type==3 }">
			기타
		</c:when>

							</c:choose></td>


</tr>
<tr>
	<th colspan="6">
	신고내용
	</th>

</tr>
<tr>
<td colspan="6">
${dto.content }
</td>
</tr>
<tr>
	<td colspan="6" style="border-left-color: white; border-right-color: white; height: 5px "  ></td>

</tr>

<tr>
	<th colspan="6">
	처리결과
	</th>

</tr>

	<tr>
		<td colspan="6">
		
	
			${dto.resContent }
	
		
		</td>
		
	</tr>
	

</table>
		</c:forEach>
	
	

</div>

</div>
      










</body>
</html>