<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html >
<html>
<head>
<script type="text/javascript">

function givePenalty(x){
	if (confirm("패널티 주기") == true){    //확인
		window.open(x, 'givePenalty', 'width =300, height=100');
	
	
	}else{   
	    return;
	
	}
	

	window.self.close(); 
	
	
	
}
</script>


<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

${param.idx }



<c:url value="givePenalty.do" var="givePenaltyURL">
<c:param name="idx" value="${param.idx }"></c:param>


</c:url>

<input type="button" value="패널티주기" onclick="givePenalty('${givePenaltyURL }')">

<a href="${givePenaltyURL }">패널티주기</a>
</body>
</html>