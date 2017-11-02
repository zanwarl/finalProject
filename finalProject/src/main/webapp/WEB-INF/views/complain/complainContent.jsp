<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html >
<html>
<head>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


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



<!-- Sidebar -->

<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
  <h3 class="w3-bar-item">


<c:if test="${empty sId }">
	
	<a href="#" onclick="loginPopup(); return false; ">로그인</a>

</c:if>
<c:if test="${!empty sId }">
	${sId }님 로그인중 ...<h5><a href="adminLogout.do">로그아웃</a></h5>
</c:if>


</h3>
  <a href="complainList.do" class="w3-bar-item w3-button">신고관리</a>
  <a href="blackList.do" class="w3-bar-item w3-button">블랙리스트</a>
  <a href="superHostList.do" class="w3-bar-item w3-button">슈퍼호스트</a>
</div>



<!-- Page Content -->
<div style="margin-left:25%">

<div class="w3-container w3-teal">
  <h1>신고관리</h1>
</div>



<div class="w3-container">

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

<input type="hidden" name="idx" value="${dto.idx }">

			<c:if test="${dto.res eq 0  }">
			<input type="submit" value="ok">
			</c:if>





</form>




</div>

</div>
      














</body>
</html>