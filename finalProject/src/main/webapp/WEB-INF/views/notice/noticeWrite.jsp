<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
  <h1>공지사항 작성</h1>
</div>



<div class="w3-container">





<form action="noticeWrite.do" method="post">
글쓴이	<input type="text" name="writer">
<br>
제목	<input type="text" name="title">
<br>
내용	<input type="text" name="content">
<br>

<input type="submit" value="글쓰기">

</form>


</div>

</div>
      












</body>
</html>