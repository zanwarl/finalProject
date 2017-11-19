
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!--Title-->
    <title>대한민국 길잡이</title>
<style>
#main_contents {
	width: 1500px;
	height: 750px;
}
.wrap_content_plan_list {
	width: 1500px;
	height: 600px;
    position: relative;
} 
.content_plan_list {
	width: 1500px;
	height: 500px;
    position: relative;
} 
.writer {
	height: 30px;
	float: left;
}
.bg .plan_img {
	width: 350px;
	height: 150px;
}
.plan_list .bg:hover .plan_img {
	transform: scale(1.2);
	-webkit-transform: scale(1.2);
	-moz-transform: scale(1.2);
	-ms-transform: scale(1.2);
	-o-transform: scale(1.2);
	transition: all 1s ease-in-out; 
	
}
.bg {
	overflow:hidden 
}
.plan_list {
    width: 350px;
    height: 220px;
    border: 1px solid #dfdfdf;
    float: left;
    margin-right: 16px;
    margin-bottom: 16px;
    display: block;
    cursor: pointer;
    position: relative;
}
.header_plan_list {
	height: 50px;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
	<div class="flicker-example" data-block-text="false">
		
		<ul>
			
			<li data-background="img/slide1.jpg">
				<div class="flick-title">명동, 외국인 관광객으로 붐비는 서울의 대표 관광지구</div>
				<div class="flick-sub-text">모두가 즐겨찾는 서울 강북의 중심지! 꼭 가보아야 할 탐방지!</div>
			</li>
			
			<li data-background="img/slide2.jpg">
				<div class="flick-title">일제 향한 저항정신 위에 한옥들 ‘전주한옥마을’</div>
				<div class="flick-sub-text">처마밑으로 전해오는 전통의 향기</div>
			</li>
			
			<li data-background="img/slide3.jpg">
				<div class="flick-title">양평에서의 패러글라이딩 체험비행</div>
				<div class="flick-sub-text">양평군 · 하늘위에서 느껴보는 아름다운 한국의 산하!</div>
			</li>
			
		</ul>
		
	</div>
	<div id="main_contents"> <!-- 본문 영역 -->
	
	<!-- 인기 여행일지 정보 게시판 영역 start-->
	<div class="wrap_content_plan_list">
		<div class="header_plan_list">인기 여행일정</div>
		<div class="content_plan_list">
		<c:url value="${contextPath }/img/city/thumb/" var="src"/> 
		<c:forEach var="list" items="${list }">
			<a class="plan_list" href="planContent.do?pidx=${list.plan_idx}">
		        <div class="bg">
	        	<img class="plan_img" src="${src }${list.plan_file}"></div>
	        	<div class="name">${list.plan_subject }</div>
	        	<div class="explain">${list.plan_explain }</div>
	        	<div class="bottom">
		        	<div class="writer">${list.plan_name }</div>
	        		<div class="readnum">조회수 ${list.plan_readnum }</div>
	        	</div>
	        </a>
		</c:forEach>	
		</div>
		<div class="bot_plan_list"><a href="plan.do">${count }개의 모든 일정 보기</a></div>
	</div>
	<!-- 인기 여행일지 정보 게시판 영역 end-->
	
	<div class="wrap_content_room_list">
		인기 숙소 영역?
	</div>
	</div>

<%@ include file="footer.jsp" %>
</body>
</html>