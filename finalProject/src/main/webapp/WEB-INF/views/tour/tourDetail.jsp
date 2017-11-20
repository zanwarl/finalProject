<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
#content_wrap {
	width:1263px; 
	height:800px; 
	background:#ddd; 
	margin:0 auto; 
	padding:5px;
	background:white;
	border: 1px solid #dfdfdf;
	float: left;
}
.content_left {
	padding-left: 200px;
	width: 500px;
	height: 800px;
	float: left;
	padding-right: 50px;
	border-right: 1px solid #dfdfdf;
}
.content_right {
	width: 300px;
	height: 71z`0px;
	float: left;
	border: 1px solid #dfdfdf;
}
.content_block{
float: left;
width: 100px;
height: 100px;
}
#map {
height: 300px;
width: 300px;
float: left;
}
#cmtform {
	width: 1000px;
	margin: 0 auto;
	padding: 200px;
}
.cmtf {
	margin: 0 auto;
}
.wrap_info {
	width: 1000px;
	margin: 0 auto;
}
.info {
	width: 500px;
	height: 400px;
	margin: 0 auto;
	overflow:auto;	
}
.contents_top {
	width: 1000px;
	margin: 0 auto;
	padding-left: 150px;
}
.wrap_info {
	width: 500px;
	border: 1px solid #dfdfdf;
}
.title {
	font-weight: bold;
	font-size: 20px;
}
#near_info {
	position:absolute;
	top:630px;
	left:760px;
	width: 300px;
	height: 300px;
}
</style>
<title>Insert title here</title>
<script type="text/JavaScript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	
	var mapx = '';
	var mapy = '';
	
	function showMap(mapy,mapx) {
		var url = "tourMap.do?mapy="+mapy+"&mapx="+mapx;
		var winName = "tourMap";
		window.open(url,winName,'width=500,height=400');
	}
	
	function initxy() {
		$.ajax({
	   		   url:"tourDetailJSON.do?contentTypeId=${contentTypeId}&contentId=${contentId}",
	           type:"GET",
	           dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
	           async:false, // 이 한줄만 추가해주시면 됩니다.
	           success : function(msg) {
	        	  // console.log(msg.response.body.items.item);
	        	   var myItem = msg.response.body.items.item;
	        	   //내용 작성 추후 한 div에 담기
						var output = '';
						var img = '';
						var map = '';
							
							mapx = myItem.mapy;
							mapy = myItem.mapx;
							img += '<img src="'+myItem.firstimage+'" width="500">';
							title = '';
							output += '<h4>개요</h4>';
							output += myItem.overview +'<br>';
							       
								if(myItem.contenttypeid!=25) {
								title += '<span class="title">' + myItem.title + '</span>';
								output += '<h4>주소</h4>' + myItem.addr1 + myItem.addr2;
								output += '<h4>전화번호</h4>' + myItem.tel;
								output += '<h4><a href="javascript:showMap('+myItem.mapy+','+myItem.mapx+')">[지도보기]</a></h4>';
								}
							$(".info").html(output);
							$(".city_title").html(title);
							$(".content_img").html(img);
							//document.body.innerHTML += output;
	        	   
	           },
	           error : function(xhr, status, error) {
	                 alert("에러발생!!");
	           }
    	 });
	}
	
	function cmtDel(idx,contentId,contentTypeId) {
		var str = '${pageContext.request.queryString}';
		//window.alert(str);
		location.href="tourCmtDel.do?idx=" + idx + "&contentTypeId=" + contentTypeId + "&contentId=" + contentId;
	}
</script>
<script>
	function initMap() {
	
	initxy();
	
	var uluru = {lat: mapx, lng: mapy};
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom: 15,
		center: uluru
	});
	var marker = new google.maps.Marker({
		position: uluru,
		map: map
	});
  	}
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<div id="contents"><!-- contents -->
	<div class="contents_top">
		<div class="city_title"></div>
		<div class="menu">홈
			<a href="attraction.do">관광명소</a>
			<a href="foodList.do">음식점</a>
			<a href="shopping.do">쇼핑</a>
			<a href="plan.do">여행일정 </a>
		
		</div>
	</div>
	<div id="content_wrap">
		<div class="content_left">
			<div class="content_img">이미지</div>
			<div class="wrap_info">
				<div class="info">개요 들어갈 부분</div>
			</div>

		</div>
		<div class="content_right">
			<div id="near_info">근처 음식점</div>
			<div id="map"></div>
		</div>
	</div>

	<!-- <div class="wrap_info">
		<div class="info">
		</div>
	</div> -->
	<div id="cmtform">
	<form class="cmtf" action="tourCmtWrite.do">
		${sId } : 
		<textarea name="tour_cmt_content" cols="50" rows="10"></textarea>
		<input type="submit" value="댓글 작성">
		<input type="hidden" name="tour_cmt_pidx" value="${contentId}">
		<input type="hidden" name="queryStr" value="${pageContext.request.queryString}">
		<input type="hidden" name="tour_cmt_writer" value="${sId}">		
	</form>
	<c:if test="${empty list }">
	아직 작성된 댓글이 없습니다.
	</c:if>
	<c:forEach var="list" items="${list }">
	작성자 : ${list.tour_cmt_writer } <br>
	내용 : ${list.tour_cmt_content }
	작성일 : ${list.tour_cmt_writeDate } 
	
	<c:if test="${list.tour_cmt_writer == sId }">
		<input type="button" name="cmtDel" value="삭제" onclick="cmtDel('${list.tour_cmt_idx}','${contentId}','${contentTypeId}')"> <br>
	</c:if>
	 </c:forEach>
	 <br>
	 ${page }
	</div>
	<!-- <div id="map">지도영역</div> -->

</div>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDRvbbQ3ZU5pL6Q-JngNfSgfoO61PatCUw&callback=initMap">
</script>	
<%@ include file="../footer.jsp" %>
</body>
</html>