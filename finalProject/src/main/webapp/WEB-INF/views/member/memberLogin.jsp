<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
function openIdSeach(){
	window.open('memberIdSeachForm.do','memberIdSeach','width=450,height=200');
}
function openPwdSeach(){
	window.open('memberPwdSeachForm.do','memberPwdSeach','width=450,height=200');
}
</script>
</head>
<body>
<h3>�� �� ��</h3>



<form class="memberLogin" id="memberLoginForm" action="memberLogin.do" method="post">
   <table>
   <tr>
   	<td>
   <input name="member_id" type="text" placeholder="���̵�" value ="${cookie.saveId.value }" autofocus required  >
   	</td>
   </tr>
   <tr>
   	<td>
   <input name ="member_pwd" type="password" placeholder="��й�ȣ" required  >
   </td>
  </tr>
  <tr>
 	 <td>
  ���̵� ���� <input type="checkbox" name="saveId" value="on" checked="${empty cookie.saveId.value?'':'checked' }">
 	 </td>
  </tr>
  <tr>
  	<td>
  <input type="submit" value="�α���">
  	</td>
  </tr>
  <tr>
  	<td><input type="button" value="���̵�ã��" onclick="openIdSeach()"></td>
  	<td><input type="button" value="��й�ȣã��" onclick="openPwdSeach()"></td>
  </tr>
    
</table>
</form>
</body>
</html>