<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>리뷰게시판 글쓰기</h2>
<form name="reBbsWrite" action="reBbsWrite.do" method="post">
<table>
	<tr>
		<th>작성자</th>
		<td><input type="text" name="writer"></td>
		<th>비밀번호</th>
		<td><input type="password" name="pwd"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="3"><input type="text" name="subject"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="4"><textarea rows="15" cols="45" name="content"></textarea></td>
	</tr>
	<tr>
		<td colspan="4">
		<input type="submit" value="글쓰기">
		<input type="reset" value="다시작성">
		</td>
	</tr>
</table>
</form>
</body>
</html>