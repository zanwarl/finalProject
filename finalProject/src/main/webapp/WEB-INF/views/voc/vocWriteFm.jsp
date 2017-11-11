<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html >
<html>
<head>


<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>




<jsp:include page="/header.do"></jsp:include>



	<div id="contents">

<!-- ---------본문내용---------------  -->
<form action="vocWrite.do" method="post" name="vocWriteFm">

title <input type="text" name="title"><br>
content <input type="text" name="content">
<input type="submit" value="문의하기">


</form>

</div>

<jsp:include page="/footer.do"></jsp:include>
</body>
</html>