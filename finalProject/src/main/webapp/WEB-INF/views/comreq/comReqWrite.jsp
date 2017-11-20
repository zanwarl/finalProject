<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

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


</head>
<body>
<form name="comReq" action="comReqWrite.do" method="post">
<table>
<%-- 	<tr>
		<th>신고대상자</th>
		<td><input type="text" name="receiver" value="${receiver }"></td>
	</tr> --%>
	<tr>
		<th>분류</th>
		<td style="text-align: center;"><select name="type">
			<option value="1">호스트->게스트</option>
			<option value="2">게스트->호스트</option>
			<option value="3">일반</option>
		</select></td>
	</tr>
	<tr>
		<th>신고내용</th>
		<td style="text-align: left;" ><textarea rows="10" cols="30" name="content"></textarea></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
		<input type="submit" value="신고하기">

		</td>
	</tr>
</table>
</form>
</body>
</html>