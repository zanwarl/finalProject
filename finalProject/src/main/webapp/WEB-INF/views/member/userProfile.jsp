<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html >
<html>
<head>
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

.cctabs input:checked+label {
	background: #fff;
	color: #ebb704;
	border-top: solid 2px #ebb704;
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
	background: #fff;
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
</style>
<style type="text/css">
.homeTb td  {
	width: 40%; 
	
}

</style>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/header.do"></jsp:include>

	<!--  -->


	<div id="contents">
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
							<h1>${param.userId}님이가지고 계신 숙소</h1>
							<div class="grid cc-text-center">
							<!-- 
								<c:set value="0" var="i"></c:set>
								<c:set value="3" var="j"></c:set>
								<table border="1">
								<c:forEach items="${list }" var="dto">
										<c:url value="roomContent.do" var="roomConURL">
										<c:param name="roomidx" value="${dto.ROOMIDX }"></c:param>
									</c:url>
									<c:url value="${contextPath }/img/room/" var="src" />

									<c:if test="${i mod j==0 }">
									<tr>
									</c:if>

								
									<td><h3>${dto.ROOMNAME }</h3>
									<div style="width: 100%; height:200px;" ><a href="${roomConURL }"><img src="${src }${dto.FILENAME}" width="100%" height="100%"></a>
										</div>
										</td>
										<c:if test="${i mod j==j-1 }">
										</tr>
										
										</c:if>
									
									<c:set value="${i+1 }" var="i" ></c:set>
								</c:forEach>
							
							 -->
							
								<c:set value="0" var="i"></c:set>
								<c:set value="2" var="j"></c:set>
							<table class="homeTb">
							
							
							<c:forEach items="${list }" var="dto">
										<c:url value="roomContent.do" var="roomConURL">
										<c:param name="roomidx" value="${dto.ROOMIDX }"></c:param>
									</c:url>
									<c:url value="${contextPath }/img/room/" var="src" />

									<c:if test="${i mod j==0 }">
									<tr>
									</c:if>

								
									<td><h3>${dto.ROOMNAME }</h3>
									<div style="width: 100%; height:200px;" ><a href="${roomConURL }"><img src="${src }${dto.FILENAME}" width="100%" height="100%"></a>
										</div>
										</td>
										<c:if test="${i mod j==j-1 }">
										</tr>
										
										</c:if>
									
									<c:set value="${i+1 }" var="i" ></c:set>
								</c:forEach>
								</table>

							</div>
						</div>
		
						<div class="panel">

							<h1>${param.userId}님의일정</h1>
							<div class="grid cc-text-center">
								<c:set value="0" var="i"></c:set>
								<c:set value="3" var="j"></c:set>
								<table border="1">
								<c:forEach items="${planList }" var="dto">
									<c:url value="planContent.do" var="planConURL">
										<c:param name="pidx" value="${dto.PIDX }"></c:param>
									</c:url>
									
									<c:if test="${i mod j==0 }">
									<tr>
									</c:if>

								
									<td>
										<h3>
											<a href="${planConURL }">${dto.TITLE }</a>
										</h3>
										<p>
											<a href="${planConURL }">${dto.WRITEDATE }</a>
										</p>
										</td>
										<c:if test="${i mod j==j-1 }">
										</tr>
										
										</c:if>
									
									<c:set value="${i+1 }" var="i" ></c:set>
								</c:forEach>
</table>
	
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<%-- 
<br>
<!--  -->
		<h1>${param.userId }님의 프로필 페이지입니다.</h1>

		 <br> ${param.userId }님의 숙소 리스트
		<c:if test="${empty list  }">
			<table class="roomTb">
				<tr>
					<td>등록된 숙소가 없습니다.</td>
				</tr>
			</table>
		</c:if>

		<c:forEach var="dto" items="${list }">


			<c:url value="${contextPath }/img/room/" var="src" />


			<table class="roomTb">
				<c:url value="roomContent.do" var="roomConURL">
					<c:param name="roomidx" value="${dto.ROOMIDX }"></c:param>
				</c:url>
				<tr>
					<th><a href="${roomConURL }"><img
							src="${src }${dto.FILENAME}"></a></th>

				</tr>
				<tr>
					<td><a href="${roomConURL }">${dto.ROOMNAME } </a></td>

				</tr>
			</table>
		</c:forEach>

		<br> ${param.userId }님의 여행 일정 목록
		<c:if test="${empty planList }">
			<table class="planTb">
				<tr>
					<td>등록된 일정이 없습니다</td>
				</tr>
			</table>
		</c:if>

		<c:forEach var="dto" items="${planList }">


			<table class="planTb">


				<c:url value="planContent.do" var="planConURL">
					<c:param name="pidx" value="${dto.PIDX }"></c:param>
				</c:url>
				<tr>
					<th><a href="${planConURL }">${dto.TITLE }</a></th>


					<td>${dto.WRITEDATE }</td>

				</tr>
			</table>
		</c:forEach>


 --%>
	</div>

	<jsp:include page="/footer.do"></jsp:include>
</body>
</html>