<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form name="memberPwdSeach" action="memberPwdSeach.do" method="post">
<fieldset>
	<legend>비밀번호 찾기</legend>
	<table>
	<tr><td>
	아이디 : <input type="text" name="member_id" >
	</td></tr>
	<tr><td>
	이메일 : <input type="text" name="member_email">
	</td></tr>
	<tr><td>
	<input type="submit" value="찾기">
	</td></tr>
	
	</table>
</fieldset>
</form>
</body>
</html>