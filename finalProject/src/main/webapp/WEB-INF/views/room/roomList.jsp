<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE>
<html>
<head>
<style>
div{
	width: 400px;
}
img {
  	max-width: 100%;
  	height: auto;
}
</style>
<meta content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script>
  
  var jq = $.noConflict();
  jq(document).ready(function() {
    jq(document).ready(function(){
      jq('.slider').bxSlider({
    	  adaptiveHeight: true,
    	  slideWidth: 200, 
    	  minSlides:1,
    	  maxSlides:1,
    	  slideMargin:100
      });
    });
  });
  
</script>
<script type="text/javascript">
function roomadd() {
	location.href="loginCk.do";
	location.href="roomadd.do";
}
	<jsp:include page="/loginCk.do"></jsp:include>
</script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<c:url value="${contextPath }/img/room/" var="src"/> 
	<table>
		<c:if test="${empty list}">
			<tr>
				<td colspan="4" align="center">등록된 글이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="rdto" items="${list}" varStatus="status">
			<c:if test="${status.index%4==0}">
				<tr></tr>
			</c:if>
			<td>
			<div>
			<c:url var="Url" value="roomContent.do">
				<c:param name="roomidx" value="${rdto.roomidx}"></c:param>
			</c:url>
			<ul class="slider">
				<c:forTokens items="${rdto.filename}" delims="," var="item">
					<li><a href="${Url}"><img src="${src}${item}"></a></li> 
				</c:forTokens>
			</ul>
			<a href="${Url}">${rdto.roomname}</a>
			</div>
			</td>
		</c:forEach>
	</table>
	<c:if test="${not empty sId }">
	
		<input type="button" value="숙소등록" onclick="roomadd()">
	</c:if>
<%@ include file="../footer.jsp" %>
</body>
</html>