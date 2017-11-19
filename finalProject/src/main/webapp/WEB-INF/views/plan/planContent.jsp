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
width: 1500px;
	margin: 0 auto;
}
.img {
width: 1500px;
	margin: 0 auto;
}
#content{
	height: auto;
	margin: 0 auto;
}
.wrap_content_plan {
	width: 1500px;
	height: auto;
    position: relative;
    margin: 0 auto;
} 
.content_plan {
	width: 1500px;
	height: auto;
    position: relative;
    margin: 0 auto;
}
.wrap_item {
 position: relative;

}
.day {
	width: 50px;
	height: 30px;
}
.order {
	float: left;
	width: 30px;
	height: 30px;
}
.content_top {
	margin: 0 auto;
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
	width: 1500px;
	margin: 0 auto;
}
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<c:url value="${contextPath }/img/city/thumb/" var="src"/> 
<div id="content">

<div class="content_top">
<div class="title">${pdto.plan_name }님의 일정</div>
<div class="img"><img src="${src}${pdto.plan_file}" width="960"></div>
</div>
<div id="wrap_content_plan">
	<div class="content_plan">
		<c:forEach var="list" items="${list }">
		
		<div class="wrap_item">
			<div class="day">Day : ${list.pland_day }</div>
			<div class="order">${list.pland_order }</div> &nbsp;
			<a class="item" href="tourDetail.do?contentTypeId=${list.pland_typeid }&contentId=${list.pland_code }" target="_blank">
				<div class="img">	
				<c:choose>
					<c:when test="${list.pland_img eq 'undefined' }">
						<img src="img/notimage.png" width="100" height="90">${list.pland_subject } <br>
					</c:when>
					<c:otherwise>
						<img src="${list.pland_img}" width="100" height="90">${list.pland_subject } <br>
					</c:otherwise>
				</c:choose>
				</div>
			</a>
		</div>
		</c:forEach>
	</div>
</div>
<c:if test="${pdto.plan_writer eq sIdx }">
<div class="bot"><a href="planEdit.do?plan_idx=${pdto.plan_idx }">[수정하기] || [삭제하기]</a></div>
</c:if>
</div>
<%@ include file="../footer.jsp" %>
</body>	
</html>