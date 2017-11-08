<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<meta  charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
  <h3 class="w3-bar-item">


<c:if test="${empty sId }">
	
	<a href="#" onclick="loginPopup(); return false; ">로그인</a>

</c:if>
<c:if test="${!empty sId }">
	${sId }님 로그인중 ...<h5><a href="adminLogout.do">로그아웃</a></h5>
</c:if>


</h3>
  <a href="complainList.do" class="w3-bar-item w3-button">신고관리</a>
  <a href="blackList.do" class="w3-bar-item w3-button">블랙리스트</a>
  <a href="superHostList.do" class="w3-bar-item w3-button">슈퍼호스트</a>
</div>


<!-- Page Content -->
<div style="margin-left:25%">

<div class="w3-container w3-teal">
  <h1>블랙리스트</h1>
</div>



<div class="w3-container">
<table>

	<thead>
		<tr>
			<th>회원번호</th>
		</tr>
	</thead>
		
	
	<tbody>
		
		<c:if test="${empty list }">
		
			<tr>
				<td>블랙리스트인 회원이 없습니다. </td>
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
			<td>${pageStr}</td>
		</tr>
	
	</tfoot>

</table>



</div>

</div>
      








</body>
</html>