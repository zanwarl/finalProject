

<%@ page session="true" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



<c:if test="${empty sId }">

	<script type="text/javascript">
		window.alert ('로그인하세요');
		location.href ='memberLogin.do';
		
	
	</script>
</c:if>
</body>
</html>