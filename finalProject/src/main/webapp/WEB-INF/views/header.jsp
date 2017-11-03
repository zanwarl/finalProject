<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
#contents {min-height:100%; margin:0; background:#0FC;}

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
			<li><a href="#">로그인</a></li>
			<li><a href="memberJoin.do">회원가입</a></li>
			<li><a href="#">언어설정</a></li>
			<li><a href="#">환율</a></li>
			<li><input class="search" type="text" name="search"> <input type="button" value="검색" onclick="search()"></li>
		</ul>
		
	</div>
	<div id="logo">
	<p>로고</p>
	</div>
	<div id="main_menu">
		<ul>
			<li class="main_h"><a href="tour.do">여행지</a></li>
			<li class="main_h"><a href="#">숙소</a></li>
			<li class="main_h"><a href="#">음식점</a></li>
			<li class="main_h"><a href="#">문화/체험</a></li>
			<li class="main_h"><a href="plan.do">여행일지</a></li>
			<li class="main_h"><a href="#">고객센터</a></li>
		</ul>
	</div>
</div>
</body>
</html>