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
	<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="js/min/flickerplate.min.js" type="text/javascript"></script>
	<script src="js/script.js" type="text/javascript"></script>
	
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
	<div id="main_menu">
	<ul>
  	 	<li class='has-sub'><a href='tour.do'><span>여행지</span></a>
   			<!-- <ul>
		         <li><a href='#'><span>서울경기</span></a></li>
		         <li><a href='#'><span>강원도</span></a></li>
		         <li><a href='#'><span>충청도</span></a></li>
		         <li><a href='#'><span>전라도</span></a></li>
		         <li><a href='#'><span>경상도</span></a></li>
		         <li class='last'><a href='#'><span>제주도</span></a></li>
      		</ul> -->
  		</li>
 	<li class='has-sub'><a href='home.do'><span>숙소</span></a>
   		<ul>
	         <li><a href='#'><span>홈쉐어</span></a></li>
	         <li><a href='#'><span>한옥스테이</span></a></li>
	         <li><a href='#'><span>템플스테이</span></a></li>
	         <li class='last'><a href='#'><span>게스트하우스</span></a></li>
     	 </ul>
   </li>
   <!-- <li class='has-sub'><a href='#'><span>음식점</span></a>
   		<ul>
	         <li><a href='#'><span>한식</span></a></li>
	         <li><a href='#'><span>일식</span></a></li>
	         <li><a href='#'><span>양식</span></a></li>
	         <li><a href='#'><span>중식</span></a></li>
	         <li class='last'><a href='#'><span>그외</span></a></li>
      </ul>
   </li>
   <li class='has-sub'><a href='#'><span>문화/체험</span></a>
	   <ul>
	         <li><a href='#'><span>역사</span></a></li>
	         <li><a href='#'><span>스포츠</span></a></li>
	         <li class='last'><a href='#'><span>그외</span></a></li>
	  	</ul>
   </li>  -->
   <li class='has-sub'><a href="plan.do"><span>여행일지</span></a>
	   <ul>
	     	<li><a href='plan.do'><span>공유일정보기</span></a></li>
	     	<c:if test="${sId ne null }">
	     		<li class='last'><a href='myPlan.do'><span>내가 만든 일정</span></a></li>
	     	</c:if>
	     	
	   </ul>
   </li>
   <li class='has-sub'><a href='#'><span>고객센터</span></a>
   	  <ul>
         <li><a href='noticeList.do'><span>공지사항</span></a></li>
         <li class='last'><a href='vocWrite.do'><span>질문답변</span></a></li>
      </ul>
   </li>
</ul>
	</div>
</div>
</body>
</html>