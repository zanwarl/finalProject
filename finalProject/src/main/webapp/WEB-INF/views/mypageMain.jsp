<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html >
<html>
<head>
<style>
body {
	background-size: 100px, 100px
	margin:0;
	padding:0;
	font-family:Quicksand;
	font-weight:700;
}

ul.form {

	position:relative;
	background:#fff;
	width:250px;
	margin:auto;
	padding:0;
	list-style: none;
	overflow:hidden;
	
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;	
	
	-webkit-box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.1);
	-moz-box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.1);
	box-shadow:  1px 1px 10px rgba(0, 0, 0, 0.1);	
}

.form li a {
	width:225px;
	padding-left:20px;
	height:50px;
	line-height:50px;
	display:block;
	overflow:hidden;
	position:relative;
	text-decoration:none;
	text-transform:uppercase;
	font-size:14px;
	color:#686868;
	
	-webkit-transition:all 0.2s linear;
	-moz-transition:all 0.2s linear;
	-o-transition:all 0.2s linear;
	transition:all 0.2s linear;			
}

.form li a:hover {
	background:#efefef;
}

.form li a.profile {
	border-left:5px solid #008747;
}

.form li a.messages {
		border-left:5px solid #fecf54;
}
	
.form li a.settings {
		border-left:5px solid #cf2130;
}

.form li a.logout {
		border-left:5px solid #dde2d5;
}	

.form li:first-child a:hover, .form li:first-child a {
	-webkit-border-radius: 5px 5px 0 0;
	-moz-border-radius: 5px 5px 0 0;
	border-radius: 5px 5px 0 0;
}

.form li:last-child a:hover, .form li:last-child a {
	-webkit-border-radius: 0 0 5px 5px;
	-moz-border-radius: 0 0 5px 5px;
	border-radius: 0 0 5px 5px;
}

.form li a:hover i {
	color:#ea4f35;
}

.form i {
	margin-right:15px;
	
	-webkit-transition:all 0.2s linear;
	-moz-transition:all 0.2s linear;
	-o-transition:all 0.2s linear;
	transition:all 0.2s linear;	
}

.form em {
	font-size: 10px;
	background: #ea4f35;
	padding: 3px 5px;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;		
	font-style: normal;
	color: #fff;
	margin-top: 17px;
	margin-right: 15px;
	line-height: 10px;
	height: 10px;		
	float:right;
}

.form li.selected a {
	background:#efefef;
}

h1 {
	color:black;
	margin:0 auto;
	margin-top:60px;
	margin-bottom:40px;
	font-size:30px;
	width:300px;
	text-align:center;
}

h2{
	color:black;
	margin:0 auto;
	margin-top:60px;
	margin-bottom:40px;
	font-size:30px;
	width:300px;
	
}
p {
	text-align:center;
	position:absolute;
	width:100%;
	bottom:0;
	font-size:12px;
	font-family:Arial, Helvetica;
	color:#fff;
	text-transform:uppercase;
}
p a {
	color:#fff;
	text-decoration:none;
}

</style>


<link href='http://fonts.googleapis.com/css?family=Quicksand:400,700' rel='stylesheet' type='text/css' />
<script type="text/javascript" src="http://code.jquery.com/jquery-2.0.0.min.js" /></script>
	
<link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.min.css" rel="stylesheet" />
<!--[if IE 7]>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome-ie7.min.css" rel="stylesheet" />
	<![endif]-->

<meta charset=UTF-8">

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
	<h1>My page</h1>
<!-- ---------본문내용---------------  -->
<ul class="form">

	<li><a class="profile" href="memberUpdate.do" >회원정보수정</a></li>
	<li><a class="messages" href="myComplainList.do" >나의 신고 내역</a></li>
	<li><a class="settings" href="vocList.do" >1:1문의 내역</a></li>
	<c:url value="userProfile.do" var="userInfoURL">
		<c:param name="userId" value="${sId }"></c:param>
	</c:url>
	<li><a class="logout" href="${userInfoURL }" >내 프로필</a></li>
	
	<br>
<h2> guest menu </h2>
	<ui class="form2">
	<li><a class="profile" href="roomReqList.do" >예약내역</a></li>

<br>
<h2> host menu</h2>
	<ui class="form3">
	<li> <a class="messages" href="myRoomReqList.do"> 나의 방 예약 현황 보기</a> </li>
	</ul>
</div>

<br>
<br>

<jsp:include page="/footer.do"></jsp:include>
</body>
</html>






