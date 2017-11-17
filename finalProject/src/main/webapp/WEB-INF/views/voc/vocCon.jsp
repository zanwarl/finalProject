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



<jsp:include page="/loginCk.do"></jsp:include>

<jsp:include page="/header.do"></jsp:include>



	<div id="contents">

<!-- ---------본문내용---------------  -->


<h2>vocCon.jsp</h2>
<table>

<c:set var="dto" value="${con}" ></c:set>

		<tr>
			<th>글번호</th>
			<td>${dto.idx }  </td>
		
		</tr>
		
		<tr>
			<th>글쓴이</th>
			<td>${dto.writer }  </td>
		
		</tr>
		
		
		<tr>
			<th>제목</th>
			<td>${dto.subject } </td>
		
		</tr>
		<tr>
			<th>날짜</th>
			<td>${dto.writeDate } </td>
		
		</tr>
		<tr>
			<th>내용</th>
			<td>${dto.content } </td>
		
		</tr>

		
	</table>
	<c:url var="reWriteURL" value = "vocReWrite.do" >
		<c:param name="idx">${dto.idx }</c:param>
		<c:param name="ref">${dto.ref}</c:param>
		<c:param name="lev">${dto.lev }</c:param>
		<c:param name="sunbun">${dto.sunbun }</c:param>
		<c:param name="subject">${dto.subject }</c:param>
	
	</c:url>
	
	<c:url var="delURL" value = "vocDel.do"  >
		<c:param name="idx">${dto.idx }</c:param>
	
	
	</c:url>
	
	
	<a href="${delURL }">삭제하기</a>|<a href="vocList.do">목록으로</a> 

</div>

<jsp:include page="/footer.do"></jsp:include>



</body>
</html>