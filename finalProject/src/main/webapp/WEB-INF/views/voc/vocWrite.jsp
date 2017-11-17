<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>


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

</head>
<body>


<c:if test="${empty sId }">
	<script type="text/javascript">
	
	window.alert ('로그인 하세요');
	location.href ='main.do';
	
	
	</script>
	
</c:if>

<jsp:include page="/header.do"></jsp:include>



	<div id="contents">

<!-- ---------본문내용---------------  -->

<h2>1:1 문의하기</h2>
<form action="vocWrite.do" method="post">

	<table>

		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" style="width: 100%"> </td>
		
		</tr>
		<tr>
			<th>내용</th>
			<td>
			<textarea  name="content" rows="10"></textarea>
			</td>
		
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;" > 
			<input type="submit" value="문의하기" style="border: none;"> </td>
		
		</tr>
	</table>



</form>
</div>

<jsp:include page="/footer.do"></jsp:include>


</body>
</html>