<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html >
<html>
<head>


<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>




<jsp:include page="/header.do"></jsp:include>



	<div id="contents">

<!-- ---------본문내용---------------  -->
<ul>
	<li><a href="memberUpdate.do" >회원정보수정</a></li>
	


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






