<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<style>
#pcount {border:0; width:15px;}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->

<script>
function showTime(){
	window.open('foodTime.do','dateForm','width=350,height=200');
}
function addNum(){
	var foodreq = document.foodreq;
	var pcount = foodreq.pcount.value;
	
	if(Number(pcount) > 10){
		alert("최대 10명까지 예약할 수 있습니다.");
	}else{
		foodreq.pcount.value = Number(pcount) + 1;
	}
}
  
function subNum(){
	var foodreq = document.foodreq;
	var pcount = foodreq.pcount.value;
	
	if(Number(pcount) < 2){
		alert("최소 1명 이상 선택해야 합니다.");
	}else{
		foodreq.pcount.value = Number(pcount) - 1;  
	}
}

$(document).ready(function() {
	var fidx = 1;


	$(function() {
		$( "#datepicker" ).datepicker();
		
	});
	
    $.ajax({
   	      url:"foodndate.do?fidx=1",
	   	  dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨	
          type:"POST",
          success : function(msg) {
        	  alert(msg.time);
          },
          error : function(xhr, status, error) {
                alert("에러발생");
          }
    });
}); 


</script>
  </head>
<body>
<h2>식당정보</h2>
<form name="foodreq" action="foodreqWrite.do">
   <fieldset>
     
         	<label>예약인원</label>
         	
         	<input type="button" id="SUB_NUM" value="-" onclick="subNum()">
 			<input type="text" name="pcount" id="pcount" value="1">
  			<input type="button" id="ADD_NUM" value="＋" onclick="addNum()">
  			
         
            <label>예약날짜</label>
            <input type="text" name="frdate" id="datepicker"> 
         	
            <input type="button" name="frtime_btn" onclick="showTime()" value="예약시간">
            <input type="text" name="frtime">
         
            <input type="submit" value="예약하기">           
            
   </fieldset>
</form>
</body>
</html>