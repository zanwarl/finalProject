<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>adminLoginFm.jsp</h2>

<form action="adminLogin.do" method="post">
	id: <input type="text" name="idx" value="${cookie.saveId.value }" >
	 id save <input type="checkbox" name="saveId" value="on" checked="${empty cookie.saveId.value?'':'checked' }"> <br>
	pw: <input type="password" name="pwd"><br>
	<input type="submit" value="ok">
</form>

</body>
</html>