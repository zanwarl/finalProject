<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!--Title-->
    <title>대한민국 길잡이</title>

<style>
*{margin:0; padding:0;}
html,body {
height:100%;  
/*폰트설정*/
font-family: 'Open Sans', Helvetica, Arial, sans-serif;
font-weight: 300;
background-color: #fff;}

#contents { height:100%;}
a {text-decoration:none; color:#000;}

/*상단,메인메뉴를 감싸고 있는 영역*/
#nav{width:100%; margin:0 0 15px 0; padding:0px;}
/*메뉴 리스트스타일과 정렬설정*/
#nav ul {list-style:none;}
#nav ul li {float:left;}

/*로그인,회원가입,언어설정 상단메뉴*/
#top_menu{width:100%; height:40px; border-bottom: 1px solid #dedede;}
#top_menu ul {float:right;}
#top_menu li {margin-right:15px; line-height:40px;}
#top_menu li a{display:block;height:37px;line-height:37px; font-size:12px;}

/*로고*/
#logo{clear:both; width:100px; height:100px; margin:0 auto; margin-top:20px; background:#fff;}

/*여행지,숙소,음식점 등 메인메뉴*/
#main_menu {width:1100px;height:50px; margin:0 auto;}
#main_menu li {width:160px; background:#fff; margin-left:10px;margin-right:10px; text-align:center;}

#main_menu .main_h {font-size:19px; font-weight:700;}


/*컨텐츠영역*/
#contents {min-height:100%; margin:0; background:#B2EBF4;}

/*하단푸터영역*/
#footer {clear:both; background:#c0c0c0;color:#808080;}

#footer_menu {width:1100px; height:100px;margin:0 auto;}
#footer_menu ul {list-style:none; }
#footer_menu ul li {float:left; margin-right:20px;  line-height:50px; }
.copyright{clear:both;font-size:12px;}
.flick-title, .flick-sub-text {text-shadow:2px 2px 2px gray;}
</style>


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

</c:if>

<c:if test="${!empty sId }">
	<a href="memberLogout.do">${sId }님 로그인중 .. 로그아웃</a>
</c:if>

</li>
				<li><a href="memberJoin.do">회원가입</a></li>
				<li><a href="#">언어설정</a></li>
				<li><a href="#">환율</a></li>
				<li><input class="search" type="text" name="search"> <input type="button" value="검색" onclick="search()"></li>
			</ul>
	</div>
	<div id="logo">
	<a href="index.do"><img src="img/logo.png"></a>
	</div>
	<div id="main_menu">
	<ul>
  	 	<li class='has-sub'><a href='#'><span>여행지</span></a>
   			<ul>
		         <li><a href='#'><span>서울경기</span></a></li>
		         <li><a href='#'><span>강원도</span></a></li>
		         <li><a href='#'><span>충청도</span></a></li>
		         <li><a href='#'><span>전라도</span></a></li>
		         <li><a href='#'><span>경상도</span></a></li>
		         <li class='last'><a href='#'><span>제주도</span></a></li>
      		</ul>
  		</li>
 	<li class='has-sub'><a href='#'><span>숙소</span></a>
   		<ul>
	         <li><a href='#'><span>홈쉐어</span></a></li>
	         <li><a href='#'><span>한옥스테이</span></a></li>
	         <li><a href='#'><span>템플스테이</span></a></li>
	         <li class='last'><a href='#'><span>게스트하우스</span></a></li>
     	 </ul>
   </li>
   <li class='has-sub'><a href='#'><span>음식점</span></a>
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
   </li>
   <li class='has-sub'><a href="plan.do"><span>여행일지</span></a>
	   <ul>
	     	<li class='last'><a href='#'><span>공유된일정보기</span></a></li>
	   </ul>
   </li>
   <li class='has-sub'><a href='#'><span>고객센터</span></a>
   	  <ul>
         <li><a href='#'><span>공지사항</span></a></li>
         <li class='last'><a href='#'><span>질문답변</span></a></li>
      </ul>
   </li>
</ul>
	</div>
</div>
</body>
</html>