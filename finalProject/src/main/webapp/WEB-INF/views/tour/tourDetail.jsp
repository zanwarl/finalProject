<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
#content_wrap {width:1200px; height:auto; background:#ddd; margin:0 auto; padding:5px;}
.content {background:#fff;}
.info{background:#666;}
.map{background:skyblue;}
#map {
        height: 400px;
        width: 400px;;
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
							output += '<h4>개요</h4>';
							output += myItem.overview +'<br>';
							       
								if(myItem.contenttypeid!=25) {
								output += '<h4>주소</h4>' + myItem.addr1 + myItem.addr2;
								output += '<h4>전화번호</h4>' + myItem.tel;
								output += '<h4><a href="javascript:showMap('+myItem.mapy+','+myItem.mapx+')">[지도보기]</a></h4>';
								}
							$(".info").html(output);
							$(".content").html(img);
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
<form>
	<table>
		<thead>
			<tr>
				<th><a href="tour.do">홈</a></th>
				<th><a href="area.do">주요도시</a></th>
				<th><a href="attraction.do">관광명소</a></th>
				<th><a href="shopping.do">쇼핑</a></th>
				<th><a href="plan.do">여행일정</a></th>
			</tr>
		</thead>
	</table>
	<div id="content_wrap">


		<div class="content">
		</div>
		
		<div id="map">
		지도
		</div>
	
	</div>

	<div class="info">
	jsp 현재 주소 값
	</div>
</form>
	<hr>
	<div id="cmtform">
	<form action="tourCmtWrite.do">
		아이디 : 
		<textarea name="tour_cmt_content" cols="50" rows="10"></textarea>
		<input type="submit" value="댓글 작성">
		<input type="hidden" name="tour_cmt_pidx" value="${contentId }">
		<input type="hidden" name="queryStr" value="${pageContext.request.queryString}">
		
	</form>
	<c:if test="${empty list }">
	아직 작성된 댓글이 없습니다.
	</c:if>
	<c:forEach var="list" items="${list }">
	작성자 : ${list.tour_cmt_writer } <br>
	내용 : ${list.tour_cmt_content }
	작성일 : ${list.tour_cmt_writeDate }
	<input type="button" name="cmtDel" value="삭제" onclick="cmtDel('${list.tour_cmt_idx}','${contentId}','${contentTypeId}')"> <br>
	 </c:forEach>
	 <br>
	 ${page }
	</div>
	<!-- <div id="map">지도영역</div> -->

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDRvbbQ3ZU5pL6Q-JngNfSgfoO61PatCUw&callback=initMap">
</script>	
</body>
</html>