<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


function mailPopup(){
	window.open ('sendMail.do', 'sendMail', 'width= 500, height= 500');
}
/* 
function userInfoPopup(x){
	window.open('x', 'userInfo','width=500, height= 500');
}
 */
 
 
</script>

</head>
<body>

<c:if test="${!empty sId }">
	${sId }님 로그인중 ...<a href="adminLogout.do">로그아웃</a>
</c:if>
<br>

complain info 


<form action="complainAns.do" method="post">

<table>

<c:set var ="dto" value=  "${con}"></c:set>
<tr>
	<th>신고자</th>
	<c:url value="userInfo.do" var= "userInfoURL">
		<c:param name="idx" value="${dto.sender }"></c:param>
	
	</c:url>
	
	
	<td> <a href="${userInfoURL }" onclick="window.open(this.href, 'userInfoPopup', 'width=300, height =500'); return false", target="_blank"> ${dto.sender } </a><input type="button" value="메일" onclick="mailPopup()">  </td>
		<th>피신고자</th> 
		
		
	<td>
		<c:url value="userInfo.do" var= "userInfoURL">
		<c:param name="idx" value="${dto.receiver }"></c:param>
	
	</c:url>
	
	<a href="${userInfoURL }" onclick="window.open(this.href, 'userInfoPopup', 'width=300, height =500'); return false", target="_blank"> ${dto.receiver } </a><input type="button" value="메일" onclick="mailPopup()">  </td>
		<th>상태</th>
	<td>${dto.res }</td>

</tr>
<tr>	
		<th>담당자</th>
	<td>
		<c:if test="${empty dto.incharge }">
		
		<input type="text" name="incharge" value ="${sId }" readonly="readonly">
		
		</c:if>
		<c:if test="${not empty dto.incharge }">
			${dto.incharge }
		
		</c:if>
	
</td>
		<th>날짜</th>
	<td>${dto.writedate }</td>
		<th>타입</th>
	<td>${dto.type }</td>


</tr>
<tr>
	<th colspan="6">
	신고내용
	</th>

</tr>
<tr>
<td>
${dto.content }
</td>
</tr>

</table>


<table>
	<tr>
		<th>
			처리결과
		</th>
		
	</tr>
	<tr>
		<td>
		
			<c:if test="${dto.res eq 0  }">
			
			<textarea rows="4" cols="50" name="resContent"></textarea>
			</c:if>
			
			<c:if test="${dto.res != 0   }">
			${dto.resContent }
			</c:if>
		
		</td>
		
	</tr>

</table>

<input type="submit" value="ok">



</form>






</body>
</html>