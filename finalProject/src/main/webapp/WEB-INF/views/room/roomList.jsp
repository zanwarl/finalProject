<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE>
<html>
<head>
<meta content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<style>
table {width:900px; margin:0 auto; margin-bottom:20px;}

td {text-align:center; }

.title {width:100px; margin:0 auto;}

img {
  	max-width: 100%;
  	height: auto;
}

.roomName {text-align:center; font-weight:bold;}

.roomName:hover {color:#000fff;}

.raddBtn {
	display: inline-block;
    text-decoration: none;
    color: #fff;
    font-weight: bold;
    background-color: #538fbe;
    padding: 10px 10px;
    font-size: 15px;
    border: 1px solid #2d6898;
    background-image: linear-gradient(bottom, rgb(73,132,180) 0%, rgb(97,155,203) 100%);
    background-image: -o-linear-gradient(bottom, rgb(73,132,180) 0%, rgb(97,155,203) 100%);
    background-image: -moz-linear-gradient(bottom, rgb(73,132,180) 0%, rgb(97,155,203) 100%);
    background-image: -webkit-linear-gradient(bottom, rgb(73,132,180) 0%, rgb(97,155,203) 100%);
    background-image: -ms-linear-gradient(bottom, rgb(73,132,180) 0%, rgb(97,155,203) 100%);
 
    background-image: -webkit-gradient(
        linear,
        left bottom,
        left top,
        color-stop(0, rgb(73,132,180)),
        color-stop(1, rgb(97,155,203))
    );
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    text-shadow: 0px -1px 0px rgba(0,0,0,.5);
    -webkit-box-shadow: 0px 6px 0px #2b638f, 0px 3px 15px rgba(0,0,0,.4), inset 0px 1px 0px rgba(255,255,255,.3), inset 0px 0px 3px rgba(255,255,255,.5);
    -moz-box-shadow: 0px 6px 0px #2b638f, 0px 3px 15px rgba(0,0,0,.4), inset 0px 1px 0px rgba(255,255,255,.3), inset 0px 0px 3px rgba(255,255,255,.5);
    box-shadow: 0px 6px 0px #2b638f, 0px 3px 15px rgba(0,0,0,.4), inset 0px 1px 0px rgba(255,255,255,.3), inset 0px 0px 3px rgba(255,255,255,.5);}


.rBtn {text-align:right;}

</style>


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
	location.href="roomadd.do";
}
</script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<div id="contents">
<h2 class="title">숙소목록</h2>
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
			<a href="${Url}" class="roomName">${rdto.roomname}</a>
			</div>
			</td>
		</c:forEach>
		<tr>
			<td colspan="4" class="rBtn">
				<c:if test="${not empty sId }">
				<input type="button" class="raddBtn" value="숙소등록" onclick="roomadd()">
				</c:if>
			</td>
		</tr>
	</table>

</div>
<%@ include file="../footer.jsp" %>
</body>
</html>