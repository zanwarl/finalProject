<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function loginPopup (){
	window.open ('adminLogin.do', 'admin login', 'width= 300, height = 300');
	
}


</script>

</head>
<body>






<c:if test="${empty sId }">
	
	<a href="#" onclick="loginPopup(); return false; ">로그인</a>

</c:if>
<c:if test="${!empty sId }">
	${sId }님 로그인중 ...<a href="adminLogout.do">로그아웃</a>
</c:if>



</body>
</html>