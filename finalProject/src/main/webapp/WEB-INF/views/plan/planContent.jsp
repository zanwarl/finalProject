<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


.content_top {
	width: 1000px;
	margin: 0 auto;
	padding-bottom: 30px;
}
.img {
	width: 1000px;
	margin: 0 auto;
}
.title_img {
	width: 1000px;
	margin: 0 auto;
}
#content{
	height: auto;
	margin: 0 auto;
}
.wrap_content_plan {
	width: 1000px;
	height: auto;
    position: relative;
    margin: 0 auto;
    padding-top: 20px;
} 
.content_plan {
	width: 1000px;
	height: auto;
    position: relative;
    margin: 0 auto;
}
.wrap_item {
 position: relative;

}
.day {
	width: 100px;
	height: 30px;
	background: #759be1;
	color: white;
	font-weight: bold;
}
.order {
	float: left;
	width: 30px;
	height: 30px;
}
.order {
width: 30px;
height: 30px;
border-radius: 50%;
color: white;
background: #759be1;
margin-top: 0px;
font-size: 18px;
font-weight: bold;
line-height: 32px;
text-align: center;
margin-top: 35px;
}
.item {
    width: 1000px;
    height: 130px;
    border: 1px solid #dfdfdf;
    margin-right: 16px;
    margin-bottom: 16px;
    display: block;
    cursor: pointer;
    position: relative;
}
.bot {
	width: 1200px;
	margin: 0 auto;
	padding-left: 140px;
}
.title_img {
	position: relative;
    background-size: cover;
}
.title_img .img_subject {
	position: absolute;
	top:50%;
	left:50%;
	transform: translate(-50%, -50%);                                                                   
	font-size:5rem;
	color: white;
	z-index: 2;
	text-align: center;
}
.title_img {
    left: 0px;
    top: 0px;
    width: 100%;
    height: 350px;
    z-index: 1;
}
.cover_bot {
    z-index: 55;
    width: 950px;
    left: 0px;
    bottom: 50px;
    padding-top: 30px;
    padding-left: 25px;
    padding-right: 25px;
    position: absolute;
    color: white;
    font-size: 24px;
    font-weight: bold;
    height: 30px;
	background-color: rgba(0, 0, 0, 0.5); 
}
.cover_explain {
    z-index: 55;
    width: 700px;
    height: 50px;
    left: 0px;
    bottom: 0px;
    padding-top: 0px;
    padding-left: 25px;
    padding-right: 25px;
    position: absolute;
    color: white;
    font-size: 24px;
    font-weight: bold;
    background-color: rgba(0, 0, 0, 0.5); 
    float: left;
}
.cover_writer {
	z-index: 55;
    width: 200px;
    height: 50px;
    left: 750px;
    bottom: 0px;
    padding-top: 0px;
    padding-left: 25px;
    padding-right: 25px;
    position: absolute;
    color: white;
    font-size: 24px;
    font-weight: bold;
    background-color: rgba(0, 0, 0, 0.5); 
    float: left;
}
.cover_name {
	height: 30px;
}	
.img_cover {
    
   	width: 100%;
    height: 350px;
    position: relative;
}
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<c:url value="${contextPath }/img/city/thumb/" var="src"/> 
<div id="content">

<div class="content_top">
<div class="title"></div>
<div class="img_cover">
	<img class="title_img" src="${src}${pdto.plan_file}" width="960">
	<div class="cover_bot">
		${pdto.plan_subject }
	</div>
	<div class="cover_explain">
		${pdto.plan_explain }
	</div>
	<div class="cover_name">
		${pdto.name }
	</div>
	<div class="cover_writer">
	
<c:url var="profileURL" value="userProfile.do">
		<c:param name="userId" value="${pId }"></c:param>
</c:url>
	
	<a style="color: white;" href="${profileURL }">${pdto.plan_name}</a>님의 일정
	</div>
</div>


<!-- 


	<a href="${profileURL }">${receiver }님의 프로필 보기</a>

 -->


</div>
<div id="wrap_content_plan">
	<div class="content_plan">
		<c:forEach var="list" items="${list }">
		
		<div class="wrap_item">
			<div class="day">Day ${list.pland_day }</div>
			<div class="order">${list.pland_order }</div> &nbsp;
			<a class="item" href="tourDetail.do?contentTypeId=${list.pland_typeid }&contentId=${list.pland_code }" target="_blank">
				<div class="img">	
				<c:choose>
					<c:when test="${list.pland_img eq 'undefined' }">
						<img src="img/notimage.png" width="150" height="120">${list.pland_subject } <br>
					</c:when>
					<c:otherwise>
						<img src="${list.pland_img}" width="150" height="120">${list.pland_subject } <br>
					</c:otherwise>
				</c:choose>
				</div>
			</a>
		</div>
		</c:forEach>
	</div>
</div>
<c:if test="${pdto.plan_writer eq sIdx }">
<div class="bot"><a href="planEdit.do?plan_idx=${pdto.plan_idx }">[수정하기] </a>
|| <a href="planDel.do?plan_idx=${pdto.plan_idx }">[삭제하기]</a></div>
</c:if>
</div>
<%@ include file="../footer.jsp" %>
</body>	
</html>