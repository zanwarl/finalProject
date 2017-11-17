<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html >
<html>
<head>
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
text-align: center;
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

<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="/header.do"></jsp:include>



	<div id="contents">





  <h1>공지사항내용</h1>


<table>
<c:set var ="dto" value=  "${con}"></c:set>


		<tr>
			<th>제목</th>
			
         <td width="70%">${dto.title}</td>
         <th>날짜</th>
			
         <td>${dto.writedate}</td>
         
        </tr>
		
		<tr>
			<th>내용</th>
			
         <td colspan="3">${dto.title}</td>
        </tr>

      

	
	
	<tfoot>

	</tfoot>	


</table>








  


</div>

<jsp:include page="/footer.do"></jsp:include>


 


</body>
</html>