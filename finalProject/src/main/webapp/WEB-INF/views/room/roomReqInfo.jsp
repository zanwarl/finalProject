
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

				
		
			/* 
			
			{ title: 'All Day Event', start: '2017-11-01' },
			{ title: 'Long Event', start: '2017-11-07', end: '2017-11-10' }, 
			{ title: ' Event', start: '2017-11-10', end: '2017-11-11' }, 
			{ id: 999, title: 'Repeating Event', start: '2017-04-09T16:00:00' }
 */
		
			
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

<meta charset=UTF-8">
<title>Insert title here</title>




</head>

<body>



	<jsp:include page="/header.do"></jsp:include>



	<div id="contents">

		<!-- ---------본문내용---------------  -->

		<div id="calendar"></div>
		<input type="button" onclick="location.href ='myRoomReqList.do'" value="목록으로">
		
		</div>


	<jsp:include page="/footer.do"></jsp:include>


</body>