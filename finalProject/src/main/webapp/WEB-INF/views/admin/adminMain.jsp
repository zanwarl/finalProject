<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<meta charset=UTF-8">
<title>Insert title here</title>




</head>
<body>

<!-- Sidebar -->

<%-- <jsp:include page="sideBar.do"></jsp:include>
 --%>
 <div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
  <h3 class="w3-bar-item">Menu</h3>
  <a href="complainList.do" class="w3-bar-item w3-button">신고관리</a>
  <a href="blackList.do" class="w3-bar-item w3-button">블랙리스트</a>
  <a href="superHostList.do" class="w3-bar-item w3-button">슈퍼호스트</a>
</div> 



<!-- Page Content -->
<div style="margin-left:25%">

<div class="w3-container w3-teal">
  <h1>슈퍼호스트</h1>
</div>



<div class="w3-container">


<form action="superHostList.do">
	

	<input type="radio" name="type" value="1">숙박
	<input type="radio" name="type" value="2">레스토랑
	<input type="radio" name="type" value="3">문화체험
	<input type="submit" value="ok">
</form>

<hr>

<c:choose>
	<c:when test="${param.type==1 }">
	숙박 부문 슈퍼호스트
	</c:when>
	<c:when test="${param.type==2 }">
	레스토랑 부문 슈퍼호스트
	</c:when>
	<c:when test="${param.type==3 }">
	문화체험 부문 슈퍼호스트
	</c:when>
	<c:otherwise>
	숙박 부문 슈퍼호스트 
	</c:otherwise>


</c:choose>
<table>

		<thead>
		<tr>
			<th>회원번호</th>
		</tr>
	</thead>
		
	
	<tbody>
		
		<c:if test="${empty list }">
		
			<tr>
				<td> 회원이 없습니다. </td>
			</tr>
		</c:if>
			<c:forEach var ="dto" items ="${list }">
				<tr>
				
					<td>${dto.userIdx }</td>
				</tr>
			</c:forEach>
		
	</tbody>	

	<tfoot>
		<tr>
			<td>${pateStr }</td>
		</tr>
	
	</tfoot>
	
	


</table>



</div>

</div>
      


<%-- <jsp:include page="loginInfo.jsp"></jsp:include>
 <c:if test="${empty sId }">
	
	<a href="adminLogin.do">로그인</a>

</c:if>
<c:if test="${!empty sId }">
	${sId }님 로그인중 ...<a href="adminLogout.do">로그아웃</a>
</c:if>

	<a href="adminLogin.do">관리자로그인</a> --%>
	








</body>
</html>