<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html >
<html>
<head>


<script type="text/javascript">
	function two() {
		var elements = document.getElementsByClassName("column");
		var i;
		for (i = 0; i < elements.length; i++) {
			elements[i].style.width = "50%";
		}
	}
</script>
<style>





* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: Arial;
}

.header {
	text-align: center;
	padding: 32px;
}

/* Create four equal columns that floats next to each other */
.column {
	float: left;
	width: 25%;
	padding: 10px;
}

.column img {
	margin-top: 12px;
	/* 
  opacity: 1;
  display: block;
  width: 100%;
  height: auto;
  transition: .5s ease;
  backface-visibility: hidden; */
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive layout - makes a two column-layout instead of four columns */
@media ( max-width : 800px) {
	.column {
		width: 50%;
	}
}

/* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
@media ( max-width : 600px) {
	.column {
		width: 100%;
	}
}

/*dddddddddddddddddddddddddddddddddddddddddddddd */
.container1 {
	position: relative;
}

.middle {
	transition: .5s ease;
	opacity: 0;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%)
}

.container1:hover .image {
	opacity: 0.3;
}

.container1:hover .middle {
	opacity: 1;
}

.text {
	background-color: gray;
	color: white;
	font-size: 16px;
	padding: 16px 32px;
}
</style>


<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Lato:300,400,700);

body {
	background: #c4e8e9;
	color: #000;
	font-weight: 400;
	font-size: 1em;
	font-family: 'Lato', Arial, sans-serif;
	margin: 0;
	padding: 0;
	padding-bottom: 40px;
}

a {
	color: #4f4d4d;
	text-decoration: none;
}

a:hover, a:focus {
	color: #000;
}

*, *:after, *:before {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

a, button {
	outline: none;
}

.clearfix:before, .clearfix:after {
	content: " ";
	display: table;
}

.clearfix:after {
	clear: both;
}

/* To Navigation Style */
.cctop {
	background: #08cbd2;
	width: 100%;
	text-transform: uppercase;
	font-weight: 700;
	font-size: 0.75em;
	line-height: 3.2;
}

.cctop a {
	display: inline-block;
	padding: 0 1.5em;
	text-decoration: none;
	letter-spacing: 1px;
}

.cctop span.right {
	float: right;
}

.cctop span.right a {
	display: block;
	float: left;
}

/* Header Style */
.ccheader {
	margin: 0 auto;
	padding: 2em;
	text-align: center;
}

.ccheader h1 {
	font-size: 2.625em;
	font-weight: 300;
	line-height: 1.3;
	margin: 0;
}

.ccheader h1 span {
	display: block;
	padding: 0 0 0.6em 0.1em;
	font-size: 60%;
	opacity: 0.7;
}

/* Demo Buttons Style */
.codeconvey-demo {
	padding-top: 1em;
	font-size: 0.8em;
}

.codeconvey-demo a {
	display: inline-block;
	margin: 0.5em;
	padding: 0.7em 1.1em;
	outline: none;
	border: 2px solid #fff;
	color: #fff;
	text-decoration: none;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 700;
}

.codeconvey-demo a:hover, .codeconvey-demo a.current-demo,
	.codeconvey-demo a.current-demo:hover {
	border-color: #333;
	color: #333;
}

/* Wrapper Style */
.wrapper {
	margin: 0 auto;
	padding-left: 12%;
	padding-right: 12%;
}

section {
	float: left;
	width: 100%;
}

.opt {
	background: url(../images/bg.jpg) repeat-x;
	padding: 3%;
}

@import
	url(https://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,600)
	;

@font-face {
	font-family: 'FontAwesome';
	src: url('../fonts/fontawesome-webfont.eot?v=4.0.3');
	src: url('../fonts/fontawesome-webfont.eot?#iefix&v=4.0.3')
		format('embedded-opentype'),
		url('../fonts/fontawesome-webfont.woff?v=4.0.3') format('woff'),
		url('../fonts/fontawesome-webfont.ttf?v=4.0.3') format('truetype'),
		url('../fonts/fontawesome-webfont.svg?v=4.0.3#fontawesomeregular')
		format('svg');
	font-weight: normal;
	font-style: normal;
}

.cctabs {
	width: 100%;
	margin: 100px auto;
}

.cctabs input[type="radio"] {
	opacity: 0;
}

.cctabs .fa {
	margin-right: 10px;
}

.cctabs label {
	color: #000;
	cursor: pointer;
	float: left;
	margin-right: 2px;
	padding: 0.5% 2%;
	font-size: 16px;
	font-weight: bold;
}

.cctabs label:hover {
	background: -webkit-linear-gradient(#777, #666);
}

.cctabs input:checked+label { /* 

여기!!!!!!!!!!!
 */
	background: #f2f2f2;
	color: black;
	border-top: solid 2px black;
}

.cctabs input:nth-of-type(1):checked ~ .panels .panel:first-child,
	.cctabs input:nth-of-type(2):checked ~ .panels .panel:nth-child(2),
	.cctabs input:nth-of-type(3):checked ~ .panels .panel:nth-child(3),
	.cctabs input:nth-of-type(4):checked ~ .panels .panel:last-child {
	opacity: 1;
	-webkit-transition: .3s;
	/*position:relative;*/
	z-index: 999;
}

.cctabs .panels {
	float: left;
	clear: both;
	position: relative;
	width: 100%;
	background: #fff;
}

.cctabs .panel {
	width: 100%;
	opacity: 0;
	position: absolute;
	background: #f2f2f2;
	padding: 4%;
	box-sizing: border-box;
}

.cctabs .panel h2 {
	margin: 0;
	font-family: Arial;
}

.cctabs .panel i {
	color: #ebb704;
	cursor: pointer;
}

.cctabs .panel i:hover {
	color: #f4cc42;
}

.cctabs .headline h1 {
	font-size: 30px;
	font-weight: bold;
	letter-spacing: 0.6px;
	padding-bottom: 0;
	text-align: center;
	text-rendering: optimizespeed;
	margin: 10px 0;
}

.cctabs .headline hr {
	background: none repeat scroll 0 0 #ebb704;
	border: 2px solid;
	color: #ebb704;
	margin-bottom: 0;
	margin-top: 0;
	width: 30px;
}

.cctabs .headline .lead {
	font-family: "Lato", sans-serif;
	font-weight: 300;
	line-height: 1.9;
	margin: 5px 0;
	text-align: center;
}

#map-canvas {
	height: 366px;
	width: 462px;
}

#cc-contact input[type="text"], #cc-contact input[type="email"],
	#cc-contact input[type="tel"], #cc-contact input[type="password"],
	#cc-contact textarea {
	width: 100%;
	border: 1px solid #ebb704;
	margin: 0 0 5px;
	padding: 10px;
	font-family: "Lato", sans-serif;
	font-size: 14px;
}

#cc-contact textarea {
	height: 147px;
	max-width: 100%;
}

#cc-contact button[type="submit"] {
	cursor: pointer;
	width: 100%;
	border: none;
	background: #ebb704;
	color: #FFF;
	margin: 0 0 5px;
	padding: 10px;
	font-size: 15px;
}

#cc-contact button[type="submit"]:hover {
	background: #f4cc42;
	-webkit-transition: background 0.3s ease-in-out;
	-moz-transition: background 0.3s ease-in-out;
	transition: background-color 0.3s ease-in-out;
}

/* GRID*/
.grid {
	display: block;
	margin-left: -10px;
}

.cc-text-center {
	text-align: center;
}

.cc-mt-20 {
	margin-top: 50px;
}

.unit-2, .unit-3, .unit-4 {
	float: left;
	border-left: 10px solid transparent;
	box-sizing: border-box;
	background-clip: padding-box;
}

.unit-1 {
	width: 100%;
	float: left;
}

.unit-2 {
	width: 50%;
}

.unit-3 {
	width: 33.3%;
}

.unit-4 {
	width: 25%;
}

#content {
	padding-top: 20px;
    height: 1200px;
    margin: 0;
}
</style>
<meta charset=UTF-8">






<title>Insert title here</title>
</head>
<body onload="two()">

	<jsp:include page="/header.do"></jsp:include>

	<!--  -->


	<div id="content">
	
		<h1 align="center">${param.userId }님의 프로필 페이지</h1>
		<div class="container">
			<!-- Top Navigation -->
			<div class="wrapper">
				<div class="cctabs">
					<input checked id="one" name="tabs" type="radio"> <label
						for="one"><i class="fa fa-pencil-square-o"></i> HOMES</label> <input
						id="two" name="tabs" type="radio" value="Two"> <label
						for="two"><i class="fa fa-magic"></i> PLAN</label> <input
						id="three" name="tabs" type="radio"> <label for="three"><i
						class="fa fa-plus-square"></i>REVIEWS</label>
					<div class="panels">
						<div class="panel">
							<div class="headline">
								<h1>${param.userId}님이 가지고계신 숙소</h1>
							</div>
							<c:if test="${empty list1  and empty list2}">
								<br>
								<h5 align="center">등록된 숙소가 없습니다.</h5>
							</c:if>

							<c:url value="${contextPath }/img/room/" var="src" />

							<div class="row">
								<div class="column">
									<c:forEach items="${list1 }" var="dto" varStatus="status">
									<c:url value="roomContent.do" var="roomConURL">
 -										<c:param name="roomidx" value="${dto.ROOMIDX }"></c:param>
 -									</c:url>
									
										<div class="container1">
											<a href="${roomConURL }"> <img class="image"
												src="${src }${dto.FILENAME}" style="width: 100%;"></a>
											<div class="middle">
												<div class="text">${dto.ROOMNAME }</div>

											</div>
										</div>


									</c:forEach>

								</div>
								<div class="column">
									<c:forEach items="${list2 }" var="dto" varStatus="status">
									<c:url value="roomContent.do" var="roomConURL">
 -										<c:param name="roomidx" value="${dto.ROOMIDX }"></c:param>
 -									</c:url>
										<div class="container1">
											<a href="${roomConURL }"> <img class="image"
												src="${src }${dto.FILENAME}" style="width: 100%;"></a>

											<div class="middle">
												<div class="text">${dto.ROOMNAME }</div>

											</div>
										</div>

									</c:forEach>

								</div>





							</div>
						</div>

						<div class="panel">

							<div class="headline">
								<h1>${param.userId}님이 작성하신 일정</h1>
								<br>
							</div>

							<c:if test="${empty planList }">
								<br>
								<h5 align="center">작성하신 일정이 없습니다.</h5>
							</c:if>


							<c:forEach items="${planList }" var="dto">
								<c:url value="planContent.do" var="planConURL">
									<c:param name="pidx" value="${dto.PIDX }"></c:param>
								</c:url>

								<table class="planTb" style=" border: 1px solid gray;  width: 100%; height: 80px; " >
									<tr>

										<th width="70%" style=" padding-left: 10%;  text-align: left;"><a href="${planConURL }">${dto.TITLE }</a></th>
										<td width="30%" ><a href="${planConURL }">${dto.WRITEDATE }</a></td>
									</tr>

								</table>
								<br>



							</c:forEach>

						</div>
						<div class="panel">
						<div class="headline">
							<h1>리뷰게시판</h1>
							<!-- 제목 -->
						</div>
						
						<!-- -------여기아래에 내용작성--------------- -->
						
						내용 
						<!-- ----------여기아래 내용작성--------- -->
						</div>

					</div>
				</div>
			</div>
		</div>

	</div>

	<jsp:include page="/footer.do"></jsp:include>
</body>
</html>