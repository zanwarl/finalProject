<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>

<meta charset=UTF-8">
<title>Insert title here</title>

<style>
table, td, th {
	margin-top: 50px; border : 1px solid #ddd;
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
th{
	width: 30%; 
}

textarea {
	width: 100% ; 
}
input {
	border: none;
}
tfoot td{
	
	
	text-align: center;
	
}

</style>

</head>

<body>



<jsp:include page="/loginCk.do"></jsp:include>

<jsp:include page="/header.do"></jsp:include>



	<div id="contents">

<!-- ---------본문내용---------------  -->


<h1>문의내용입니다.</h1><table>

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
			<th colspan="2" style="text-align: center;">내용</th>
			
		
		</tr>
		<tr>
	
			<td colspan="2">${dto.content } </td>
		
		</tr>

<tfoot>
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
	
	<tr><td colspan="2" style="text-align: center;">	<a href="${delURL }">삭제하기</a>|<a href="vocList.do">목록으로</a> 
	</td></tr>
</tfoot>
		
	</table>
	
	

</div>

<jsp:include page="/footer.do"></jsp:include>



</body>
</html>