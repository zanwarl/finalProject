<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html >
<html>
<head>


<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

${param.receiver}
<form action="sendMsg.do" method="post">
sender	<input type="text" name="sender" value="${sender}" readonly="readonly">

<br>
receiver
	<input type="text" name="receiver" value="${param.receiver}">
	
	<br>
	<textarea rows="5" cols="10" name="content">
	
		
	</textarea>
	
	<input type="submit" value="보내기">


</form>

</body>
</html>