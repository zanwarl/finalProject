<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!--Title-->
    <title>대한민국 길잡이</title>

	<!--Required libraries-->
    <script src="js/min/jquery-v1.10.2.min.js" type="text/javascript"></script>
    <script src="js/min/modernizr-custom-v2.7.1.min.js" type="text/javascript"></script>
    <script src="js/min/jquery-finger-v0.1.0.min.js" type="text/javascript"></script>
    <!--Include flickerplate-->
    <link rel="stylesheet" href="css/style.css">
	<link href="css/flickerplate.css"  type="text/css" rel="stylesheet">
    <script src="js/min/flickerplate.min.js" type="text/javascript"></script>

	
	<!--Execute flickerplate-->
	<script>
	$(document).ready(function(){
		
		$('.flicker-example').flicker();
	});
	</script>

</head>
<body>

<div id="nav">
	<div id="top_menu">
			<ul>
				<li>
				<c:if test="${empty sId }">
	
	<a href="memberLogin.do" onclick="loginPopup(); return false; ">로그인</a>
	<li><a href="memberJoin.do">회원가입</a></li>
</c:if>

<c:if test="${!empty sId }">
	<a href="memberLogout.do">${sId }님 로그인중 .. 로그아웃</a>
</c:if>

</li>
				
				<li><a href="#">언어설정</a></li>
				<li><a href="#">환율</a></li>
				<li><a href="msgList.do">메세지</a></li>
				<li><a href="mypageMain.do">마이페이지</a></li>
				

				
				<li><input class="search" type="text" name="search"> <input type="button" value="검색" onclick="search()"></li>
			</ul>
	</div>
	<div id="logo">
	<a href="index.do"><img src="img/logo.png" height="100"></a>
	</div>
	<div class="menubar">
<ul>
 <li><a href="tour.do" id="current">여행지</a>
	<ul>
        <li><a href='#'>서울경기</a></li>
	<li><a href='#'>강원도</a></li>
	<li><a href='#'>충청도</a></li>
	<li><a href='#'>전라도</a></li>
	<li><a href='#'>경상도</a></li>
	<li><a href='#'>제주도</a></li>
    </ul>
 </li>
 <li><a href="#" id="current">숙소</a>
	<ul>
        <li><a href='#'>홈쉐어</a></li>
         <li><a href='#'>한옥스테이</a></li>
         <li><a href='#'>템플스테이</a></li>
         <li><a href='#'>게스트하우스</a></li>
    </ul>

</li>
 <!-- <li><a href="#" id="current">음식점</a>
	<ul>
	<li><a href='#'>한식</a></li>
         <li><a href='#'>일식</a></li>
         <li><a href='#'>양식</a></li>
         <li><a href='#'>중식</a></li>
         <li><a href='#'>그외</a></li>
	</ul>
</li>
 <li><a href="#" id="current">문화/체험</a>
   <ul>
         <li><a href='#'>역사</a></li>
         <li><a href='#'>스포츠</a></li>
         <li><a href='#'>그외</a></li>
   </ul>
</li> -->
 <li><a href="plan.do" id="current">여행일지</a>
   <ul>
         <li><a href=''>공유된일정보기</a></li>
         <c:if test="${sId ne null }">
         <li><a href="myPlan.do">내가 만든 일정</a></li>
	 </c:if>
   </ul>
</li>
  <li><a href="noticeList.do" id="current">고객센터</a>
  <ul>
  
	    <li><a href='noticeList.do'>공지사항</a></li>
         <li><a href='vocWrite.do'>질문답변</a></li>
  </ul>
  </li>
</ul>
</div>
</div>
</body>
</html>