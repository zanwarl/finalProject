<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
    
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
		<td>${dto.rebbs_idx }</td>
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
			<c:url var="contentUrl" value="bbsReWriteForm.yong">
				<c:param name="subject">${dto.subject }</c:param>
				<c:param name="ref">${dto.ref }</c:param>
				<c:param name="lev">${dto.lev }</c:param>
				<c:param name="sunbun">${dto.sunbun }</c:param>
			</c:url>
			<a href=${contentUrl }>답변글쓰기</a>
		</td>
	</tr>
</table>
</body>
</html>