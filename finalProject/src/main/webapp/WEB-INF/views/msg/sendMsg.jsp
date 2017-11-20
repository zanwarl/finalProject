<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html >
<html>
<head>
<style>
table, td, th {
border : 1px solid #ddd;
	text-align: left;
	border: 1px solid #ddd;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 15px;
}

textarea {
	width: 100% ; 
}
input {
	border: none;
}
</style>



<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="sendMsg.do" method="post">
<input type="hidden" name="sender" value="${sId}" readonly="readonly" >

<table>
	<tr>
		<td>to. <input style="border: none;" type="text" name="receiver" value="${param.receiver}" readonly="readonly"></td>
	</tr>
	<tr>
		<td><textarea rows="7" cols="10" name="content"></textarea>
	</td>
	</tr>
	<tr>
	<td style="text-align: center;"><input type="submit" value="보내기">
	</td>
	</tr>

</table>

</form>

<%-- sender	

<br>
receiver
	<input type="text" name="receiver" value="${param.receiver}">
	
	<br>
	
		
	</textarea>
	 --%>


</body>
</html>