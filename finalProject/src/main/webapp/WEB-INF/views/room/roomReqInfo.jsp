
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html >
<html>
<head>
<link rel='stylesheet' href='calendar/fullcalendar.css' />
<script src='calendar/jquery.min.js'></script>
<script src='calendar/moment.min.js'></script>
<script src='calendar/fullcalendar.js'></script>


<script>
//header에 있는 js와 충돌나서 noConflict설정
var jq = $.noConflict();

jq(document).ready(function() {
	jq("#calendar").fullCalendar({})
	
	
/* 	
	jq("#datepicker").datepicker({
		dateFormat: 'yy-mm-dd' //데이터포멧(ex - 2012.12.13)
  	});
	
	jq(".modal_content #datepicker").datepicker({
		dateFormat: 'yy-mm-dd'
	}); */
});
</script>
<!-- 
<script type="text/javascript">


$(document).ready(function() {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
        // put your options and callbacks here
    })

});
</script> -->
<meta charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
/* =========
   Get Fonts */
/*@import url(https://fonts.googleapis.com/css?family=Quicksand);*/
/* ================
   Assign Variables */
/* ===========================
   Setup Mixins/Helper Classes */
.clearfix:after, .calendar ol:after {
	content: ".";
	display: block;
	height: 0;
	clear: both;
	visibility: hidden;
}
/* ==========
   Setup Page */
*, *:before, *:after {
	box-sizing: border-box;
}

body {
	padding: 3em;
	color: grey;
	font-family: 'Quicksand', sans-serif;
}
/* ================
   Calendar Styling */
.calendar {
	background: white;
	padding: 3em;
	border-radius: 10px;
}

.calendar .month {
	margin-top: 0;
	font-weight: normal;
	font-size: 3em;
	color: #6EB590;
}

.calendar ol {
	list-style: none;
	margin: 0;
	padding: 0;
}

.calendar ol li {
	float: left;
	width: 14.28571%;
}

.calendar .day-names {
	border-bottom: 1px solid #eee;
}

.calendar .day-names li {
	text-transform: uppercase;
	margin-bottom: .5em;
}

.calendar .days li {
	border-bottom: 1px solid #eee;
	min-height: 8em;
}

.calendar .days li .date {
	margin: .5em 0;
}

.calendar .days li .event {
	background: black;
	font-size: .75em;
	padding: 0 .75em;
	line-height: 2em;
	color: white;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	margin-bottom: 1px;
}

/* .calendar .days li .event.span-2 {
	width: 200%;
}

.calendar .days li .event.begin {
	border-radius: 1em 0 0 1em;
}

.calendar .days li .event.end {
	border-radius: 0 1em 1em 0;
}

.calendar .days li .event.all-day {
	background: #9987B5;
} */
.calendar .days li .event.clear {
	background: none;
}

.calendar .days li:nth-child(n+29) {
	border-bottom: none;
}

.calendar .days li.outside .date {
	color: #ddd;
}
</style>

</head>
<body>


 
	<jsp:include page="/header.do"></jsp:include>

<div id="calendar" ></div>

	<div id="contents">

		<!-- ---------본문내용---------------  -->

		<!--  -->
		<table>

			<thead>
				<tr>

					<th>REQIDX</th>
					<th>USERID</th>
					<th>ROOMIDX</th>
					<th>COUNT</th>
					<th>REQDATE</th>
					<th>CHECKINDATE</th>
					<th>CHECKOUTDATE</th>
					<th>PAID</th>

				</tr>
			</thead>


			<tbody>

				<c:if test="${empty list }">

					<tr>
						<td>예약내역이 없습니다</td>
					</tr>
				</c:if>
				<c:forEach var="DTO" items="${list }">
					<tr>
						<%-- 
					<td><c:out value="${dto.roomidx }"></c:out></td>
					<td><c:out value="${dto.roomname }"></c:out></td> --%>


						<td>${DTO.REQIDX}</td>

						<td>${DTO.USERID}</td>
						<td>${DTO.ROOMIDX}</td>
						<td>${DTO.COUNT}</td>
						<td>${DTO.REQDATE}</td>
						<td>${DTO.CHECKINDATE}</td>
						<td>${DTO.CHECKOUTDATE}</td>
						<td>${DTO.PAID}</td>



					</tr>

				</c:forEach>

			</tbody>

		</table>


		<hr>
		<hr>
		<!-- ---------- -->


		<c:url var="preURL" value="roomReqInfo.do">

			<c:if test="${param.mm==1 }">

				<c:param name="roomIdx" value="${param.roomIdx }"></c:param>
				<c:param name="mm" value="12"></c:param>
				<c:param name="yy" value="${param.yy-1}"></c:param>
			</c:if>

			<c:if test="${param.mm!=1 }">

				<c:param name="roomIdx" value="${param.roomIdx }"></c:param>
				<c:param name="mm" value="${param.mm-1 }"></c:param>
				<c:param name="yy" value="${param.yy}"></c:param>

			</c:if>



		</c:url>
		<c:url var="nextURL" value="roomReqInfo.do">

			<c:if test="${param.mm==12 }">

				<c:param name="roomIdx" value="${param.roomIdx }"></c:param>
				<c:param name="mm" value="1"></c:param>
				<c:param name="yy" value="${param.yy+1 }"></c:param>
			</c:if>

			<c:if test="${param.mm!=12 }">

				<c:param name="roomIdx" value="${param.roomIdx }"></c:param>
				<c:param name="mm" value="${param.mm+1 }"></c:param>
				<c:param name="yy" value="${param.yy}"></c:param>

			</c:if>



		</c:url>

		<div class="calendar">
			<h1 class="month">





				<a href="${preURL }">&lt;</a> ${param.yy }/${param.mm } <a
					href="${nextURL }">&gt;</a>
			</h1>
			<ol class="day-names">
				<li>Sunday</li>
				<li>Monday</li>
				<li>Tuesday</li>
				<li>Wednesday</li>
				<li>Thursday</li>
				<li>Friday</li>
				<li>Saturday</li>
			</ol>
			<ol class="days">

				<c:forEach var="i" begin="1" end="${startDay-1 }">
					<li></li>

				</c:forEach>

				<c:forEach var="i" begin="1" end="${lastDay }">

					<li>
						<div class="date">${i }</div>

						<div class="event">Event with Long Name</div>
						
						
						 <%-- 	 <c:forEach var="dto"items="${list }">
							<c:if test="${dto.CHECKINDATE==i }">
								<c:forEach var="j" begin="1" end="${dto.SPAN }">
									<div class="event">Event with Long Name</div>

								</c:forEach>


							</c:if>

						</c:forEach>
 --%>


					</li>
				</c:forEach>
				<!-- <li>
      <div class="date">
        1
      </div>
      <div class="event">
        Event with Long Name
      </div>
    </li>
    <li>
      <div class="date">
        2
      </div>
    </li>
    <li>
      <div class="date">
        3
      </div>
    </li>
    <li>
      <div class="date">
        4
      </div>
    </li>
    <li>
      <div class="date">
        5
      </div>
    </li>
    <li>
      <div class="date">
        6
      </div>
    </li>
    <li>
      <div class="date">
        7
      </div>
    </li>
    <li>
      <div class="date">
        8
      </div>
    </li>
    <li>
      <div class="date">
        9
      </div>
    </li>
    <li>
      <div class="date">
        10
      </div>
    </li>
    <li>
      <div class="date">
        11
      </div>
    </li>
    <li>
      <div class="date">
        12
      </div>
    </li>
    <li>
      <div class="date">
        13
      </div>
      <div class="event all-day begin span-2">
        Event Name
      </div>
    </li>
    <li>
      <div class="date">
        14
      </div>
    </li>
    <li>
      <div class="date">
        15
      </div>
      <div class="event all-day end">
        Event Name
      </div>
    </li>
    <li>
      <div class="date">
        16
      </div>
    </li>
    <li>
      <div class="date">
        17
      </div>
    </li>
    <li>
      <div class="date">
        18
      </div>
    </li>
    <li>
      <div class="date">
        19
      </div>
    </li>
    <li>
      <div class="date">
        20
      </div>
    </li>
    <li>
      <div class="date">
        21
      </div>
      <div class="event">
        Event Name
      </div>
      <div class="event">
        Event Name
      </div>
    </li>
    <li>
      <div class="date">
        22
      </div>
      <div class="event span-2">
        Event with Longer Name
      </div>
    </li>
    <li>
      <div class="date">
        23
      </div>
      <div class="event clear">
        &nbsp;
      </div>
      <div class="event">
        Event Name
      </div>
    </li>
    <li>
      <div class="date">
        24
      </div>
    </li>
    <li>
      <div class="date">
        25
      </div>
    </li>
    <li>
      <div class="date">
        26
      </div>
    </li>
    <li>
      <div class="date">
        27
      </div>
    </li>
    <li>
      <div class="date">
        28
      </div>
    </li>
    <li>
      <div class="date">
        29
      </div>
    </li>
    <li>
      <div class="date">
        30
      </div>
    </li>
    <li>
      <div class="date">
        31
      </div>
    </li>
    <li class="outside">
      <div class="date">
        1
      </div>
    </li>
    <li class="outside">
      <div class="date">
        2
      </div>
    </li>
    <li class="outside">
      <div class="date">
        3
      </div>
    </li>
    <li class="outside">
      <div class="date">
        4
      </div>
    </li> -->
			</ol>
		</div>

</div>


<%-- 

	<jsp:include page="/footer.do"></jsp:include>
 --%>


</body>