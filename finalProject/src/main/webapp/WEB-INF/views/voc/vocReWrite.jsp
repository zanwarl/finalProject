<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<meta charset=UTF-8">

<style type="text/css">
table, td, th {
	margin-top: 50px;
	border: 1px solid #ddd;
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
	height: 100% ; 
	width: 100%;
}

input button {
	border: none;
}

tfoot td {
	text-align: center;
}
</style>

<title>Insert title here</title>
</head>
<body>


<!-- Sidebar -->

<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
<jsp:include page="/adminMenu.do"></jsp:include>
</div>

<!-- Page Content -->
<div style="margin-left:25%">

<div class="w3-container w3-teal">
  <h1>voc content</h1>
</div>



<div class="w3-container">

<form action="vocReWrite.do" method="post">

	<input type="hidden" name="ref" value="${param.ref }"> 
	<input type="hidden" name="lev" value="${param.lev }">
	 <input	type="hidden" name="sunbun" value="${param.sunbun }">


	<table>
		<tr>
			<th>이름</th>
			<td><input type="text" name="writer" value="${adminIdx }" style="border: none;"> </td>
		
		</tr>

		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" style="width: 100%" value="re:) ${param.subject }"> </td>
		
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="" name="content" required="required"></textarea> </td>
		
		</tr>
		<tr>
			<td colspan="2"style="text-align: center;"> <input style="border: none;" type="submit" value="딥글쓰기"> </td>
		
		</tr>
	</table>


</form>



	


</div>

</div>
      



</body>
</html>