<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
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

<h2>vocWrite.jsp</h2>
<form action="vocWrite.do" method="post">

	<table>

		<tr>
			<th>제목</th>
			<td><input type="text" name="subject"> </td>
		
		</tr>
		<tr>
			<th>내용</th>
			<td>
			<textarea rows="25" cols="35" name="content"></textarea>
			</td>
		
		</tr>
		<tr>
			<td colspan="2"> <input type="submit" value="submit"> </td>
		
		</tr>
	</table>



</form>
</div>

<jsp:include page="/footer.do"></jsp:include>


</body>
</html>