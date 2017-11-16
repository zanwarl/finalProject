<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel='stylesheet' href='calendar/fullcalendar.css' />
<script src='calendar/jquery.min.js'></script>
<script src='calendar/moment.min.js'></script>
<script src='calendar/fullcalendar.js'></script>

<script type="text/javascript">


$(document).ready(function() {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
        // put your options and callbacks here
    })

});
</script>

</head>
<body>

<div id="calendar" ></div>

</body>
</html>