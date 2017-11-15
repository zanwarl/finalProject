<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>리뷰게시판 본문보기</h2>
<table border="1" cellspacing="0" width="450">
	<tr>
		<th>번호</th>
		<td>${dto.idx }</td>
		<th>작성날짜</th>
		<td>${dto.writedate }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${dto.writer }</td>
		<th>조회수</th>
		<td>${dto.readnum }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="3">
		${dto.subject }
		</td>
	</tr>
	<tr height="250">
		<td colspan="4" align="left" valign="top">
			${dto.content }
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center">
			<a href="reBbsList.do">목록으로</a>
		</td>
	</tr>
</table>
</body>
</html>