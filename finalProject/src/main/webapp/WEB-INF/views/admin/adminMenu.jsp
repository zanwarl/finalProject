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

<c:if test="${empty adminIdx }">

	<script type="text/javascript">
		window.alert ('로그인하세요');
		location.href ='adminLogin.do';
		
	
	</script>
</c:if>
  <h3 class="w3-bar-item">


<c:if test="${empty adminIdx }">
	
	<a href="#" onclick="loginPopup(); return false; ">로그인</a>

</c:if>
<c:if test="${!empty adminIdx }">
	사원번호: ${adminIdx}
	
	<h5>
	<a href="index.do">메인페이지</a>|
	<a href="adminLogout.do">로그아웃</a></h5>
</c:if>


</h3>




  <a href="complainList.do" class="w3-bar-item w3-button">신고관리</a>
  <a href="blackList.do" class="w3-bar-item w3-button">블랙리스트</a>
  <a href="superHostList.do" class="w3-bar-item w3-button">슈퍼호스트</a>
  <a href="noticeListAdmin.do" class="w3-bar-item w3-button">공지사항관리</a> 
  <a href="vocListAdmin.do" class="w3-bar-item w3-button">voc관리</a>
  <a href="total.do" class="w3-bar-item w3-button">매출통계</a>
  
</body>
</html>