
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html >
<html>
<head>

<link rel='stylesheet' href='calendar/fullcalendar.print.css'
	media="print" />
<link rel='stylesheet' href='calendar/fullcalendar.css' />
<script src='calendar/moment.min.js'></script>
<script src='calendar/jquery.min.js'></script>


<script src='calendar/fullcalendar.js'></script>


<script>



//header에 있는 js와 충돌나서 noConflict설정
var jq = $.noConflict();

jq(document).ready(function() {
	
	jq("#calendar").fullCalendar({
		
/* 	 	header: { 	left: 'prev,next today',
					center: 'title', 
				
				}, */
		defaultDate: new Date(),
		navLinks: false, // can click day/week names to navigate views 
		editable: false, 
		eventLimit: true, // allow "more" link when too many events
	
		
		events:
			
			[
				
				${event}
		
		]  , 
		eventClick: function (event){
			if (event.reqidx){
				//alert (event.reqidx);

				window.open("roomReqInfo2.do?reqidx="+event.reqidx,"", "width=500, height=500");
				return;  
				
				
/* 
				window.open("/roomReqInfo2.do?reqidx="+reqidx);
				return ;  */
				
			}
		} 
		
		
		
		
	});
	
	

});
</script>

<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#calender_wrap {width:900px; margin:0 auto;  margin-bottom:20px;}

#calendar{width:900px; height:auto; margin:0 auto; margin-bottom:10px;}

.listBtn {text-align:right;}

.listBtn input {width:100px; height:35px; background:#fff; border:1px solid #999;}

</style>


</head>

<body>



	<jsp:include page="/header.do"></jsp:include>



	<div id="contents">


<h1 align="center">${roomName }의 예약 현황입니다.</h1>
		<!-- ---------본문내용---------------  -->
		<div id="calender_wrap">
		<div id="calendar"></div>
			<p class="listBtn">
			<input type="button" onclick="location.href ='myRoomReqList.do'" value="목록으로">
			</p>
		</div>
		</div>


	<jsp:include page="/footer.do"></jsp:include>


</body>