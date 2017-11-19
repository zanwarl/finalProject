<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html >
<html>
<head>


<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<c:if test="${empty sId }">

	<script type="text/javascript">
	window.alert ('로그인 하세요');
	 location.href='main.do';
	
	</script>

</c:if>



<jsp:include page="/header.do"></jsp:include>



	<div id="contents">

<!-- ---------본문내용---------------  -->
<ul>
	<li><a href="memberUpdate.do" >회원정보수정</a></li>
	<li><a href="myComplainList.do" >나의 신고 내역</a></li>
	<li><a href="vocList.do" >1:1문의 내역</a></li>
	<c:url value="userProfile.do" var="userInfoURL">
		<c:param name="userId" value="${sId }"></c:param>
	</c:url>
	<li><a href="${userInfoURL }" >내 프로필</a></li>
	


</ul>
<h1>게스트메뉴</h1>
<ul>


	<li><a href="roomReqList.do" >예약내역</a></li>
</ul>

<h1>호스트메뉴</h1>
<ul>
	<li> <a href="myRoomReqList.do"> 나의 방 예약 현황 보기</a> </li>

</ul>

</div>

<jsp:include page="/footer.do"></jsp:include>
</body>
</html>






