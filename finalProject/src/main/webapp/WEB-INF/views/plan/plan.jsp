<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.plan_list {
	width: 700px;
	height: 180px;
	margin: 0 auto;
}
.wrap_content_plan_list {
	width: 1100px;
	height: 600px;
    position: relative;
    margin: 0 auto;
} 
.content_plan_list {
	width: 1100px;
	height: 500px;
}
.plan_img {
	width: 250px;
	height: 120px;
}
.plan_list {
    width: 250px;
    height: 200px;
    border: 1px solid #dfdfdf;
    float: left;
    margin-right: 16px;
    margin-bottom: 16px;
    display: block;
    cursor: pointer;
    position: relative;
}
.city_name {
	z-index: 55;
    width: 245px;
    height: 25px;
    left: 0px;
    bottom: 175px;
    padding-top: 0px;
    padding-left: 2px;
    padding-right: 2px;
    position: absolute;
    color: white;
    font-size: 16px;
    font-weight: bold;
	background: linear-gradient( to top, rgba(0,0,0,0), rgba(0,0,0,0.5));
    float: left;
}
.page {
	float: left;
}
.write{
	padding-left: 900px;
}
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<div id="contents">
	<div class="wrap_content_plan_list">
	<c:url value="${contextPath }/img/city/thumb/" var="src"/> 
		<div class="sort"><a href="plan.do?sort=f">인기</a> | <a href="plan.do?sort=n">신규</a></div>
	
		<div class="content_plan_list">
			<c:url value="${contextPath }/img/city/thumb/" var="src"/> 
			<c:forEach var="list" items="${list }">
				<a class="plan_list" href="planContent.do?pidx=${list.plan_idx}">
			        <div class="bg">
		        	<img class="plan_img" src="${src }${list.plan_file}"></div>
		        	<div class="name">${list.plan_subject }</div>
		        	<div class="city_name">${list.name }</div>
		        	<%-- <div class="explain">${list.plan_explain }</div> --%>
		        	<div class="bottom">
			        	<div class="writer">${list.plan_name }</div>
		        		<div class="readnum">조회수 ${list.plan_readnum }</div>
		        	</div>
		        </a>
			</c:forEach>	
		</div>
		<div class="page">${page } </div>
		<div class="write"><a href="planMake.do">일정 만들기</a></div>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>