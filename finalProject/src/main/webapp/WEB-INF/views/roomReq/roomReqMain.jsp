<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

#roomReqFm {width:340px; margin:0 auto; margin-top:20px;}
.req {text-align:center; margin:20px;}
#roomReqFm label {float:left; width:90px; margin-left:20px; font-size:20px;}
#datepicker,#datepicker1,#roomp {width:150px; height:30px; border:1px solid #e9e9e9;}
#SUB_NUM,#ADD_NUM {
	width:40px;
	background-color: #59B2E0;
	outline: none;
	color: #fff;
	font-size: 20px;
	height: 40px;
	font-weight: normal;
	line-height:30px;
	text-transform: uppercase;
	border:none;}
	
#SUB_NUM:hover,#ADD_NUM:hover{
	color: #fff;
	background-color: #53A3CD;
	border-color: #53A3CD;
}	
	
	
#num {
font-size:20px;
font-weight:bold;
background:none;
border:none;
text-align:center;
}	
	
.reqBtn{
 display: inline-block;
    text-decoration: none;
    color: #fff;
    font-weight: bold;
    background-color: #538fbe;
    padding: 10px 30px;
    font-size: 20px;
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
    box-shadow: 0px 6px 0px #2b638f, 0px 3px 15px rgba(0,0,0,.4), inset 0px 1px 0px rgba(255,255,255,.3), inset 0px 0px 3px rgba(255,255,255,.5);
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script language='javascript'>
	
	var jq = $.noConflict();
	
		
	jq(document).ready( function() {
		
			
	      	jq( "#datepicker" ).datepicker({ minDate:0, numberOfMonths:2 , beforeShowDay: disableAllTheseDays,
				onSelect: function(selected) {
				jq("#datepicker1").datepicker("option","minDate", selected)
				}
			});
			
			jq("#datepicker1").datepicker({ minDate:0, numberOfMonths:2 , beforeShowDay: disableAllTheseDays,
				onSelect: function(selected) {
				jq("#datepicker").datepicker("option","maxDate", selected)
				call();
				} 
			
				});
			});	
		
	
/* 	$( ".selector" ).datepicker({
	    altField: ".selecter"
	}); */
	
	function disableAllTheseDays(date) {
	/* 	var test = ["2017-11-28" ,"2017-11-29"]; */
		var test2 = document.roomReqFm.NO_DATE.value;
		test2 = test2.replace(/\//g , "-");
		test2 = test2.replace(/(\s*)/g, "");
		var noDate = [test2]; 
		
		var disabledDays = noDate;
		
	   	var m = date.getMonth(), d = date.getDate(), y = date.getFullYear(); 
	   	for (i = 0; i < disabledDays.length; i++) { 
	       	if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) { 
	           	return [false]; 
	       	} 
	   	} 
	   	return [true]; 
	}



	/* window.onload = function TimeBtn(){
		var timediv = document.getElementById("button");
		for(var i=0;i<10;i++){
			timediv.innerHTML += '<input type="button" name="t_btn'+i+'" value="'+i+'"> ';
		}	
	} */
	

	var date = 1;
	var gSum = 1;
	function call() {
		
		var frm = document.roomReqFm;
			
		 var test2 = document.roomReqFm.NO_DATE.value;
	      test2 = test2.replace(/\//g , "-");
	      test2 = test2.replace(/(\s*)/g, "");
	      var noDate = [test2]; 
	      alert(noDate);
		
		var day1 = $('#datepicker').val();
		
		day1 = day1.replace(/\//g , "-");
		var day1M = day1.substring(0,2);
		var day1D = day1.substring(3,5);
		var day1Y = day1.substring(6,10);
		
		var day1Date = new Date(day1Y, day1M, day1D);
		
		/* day1 = day1.substring(3,5);
		
		(day1.charAt(0));
		
		if(day1.charAt(0)==0) {
			day1 = day1.charAt(1);
		}  */
		
		var day2 = $('#datepicker1').val();
		day2 = day2.replace(/\//g , "-");
		var day2M = day2.substring(0,2);
		var day2D = day2.substring(3,5);
		var day2Y = day2.substring(6,10);
		
		var day2Date = new Date(day2Y, day2M, day2D);
		
		/* day2 = day2.substring(3,5);
		
		(day2.charAt(0));
		
		if(day2.charAt(0)==0) {
			day2 = day2.charAt(1);
		} */ 
		
		date = day2Date - day1Date;
		date = date/(24*60*60*1000);
		
		var num = frm.count.value;
		price = price.replace(/,/g , "");
		var sum = price*num*date;
		gSum = sum;
		sum = String(sum);
		sum = sum.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$('#roomp').val(sum);
	}
	
	function addNum(){
		var frm = document.roomReqFm;
		var count = frm.count.value;
		
		if(Number(count) > 9){
			alert("최대 10명까지 예약할 수 있습니다.");
		}else{
			frm.count.value = Number(count) + 1;
			call();
		}
	}		
	  
	function subNum(){
		var frm = document.roomReqFm;
		var count = frm.count.value;
		
		if(Number(count) < 2){
			alert("최소 1명 이상 선택해야 합니다.");
		}else{
			frm.count.value = Number(count) - 1;  
			call();
		}
	}

	function fnSubmit(){
		$('#roomp').val(gSum);
		document.roomReqFm.action = "roomReqFm.do";
		document.roomReqFm.submit();
	}

</script>
</head>
<body>
	<c:if test="${empty sId }">
	<script type="text/javascript">

		 window.alert ('로그인 하세요');
		 location.href ='memberLogin.do';
	
	</script>
	</c:if>	
	
<%@ include file="../header.jsp" %>
<div id="contents">
<img src="img/reser.PNG" width="350" height="300" style="margin-left: auto; margin-right: auto; display: block;">
<form name="roomReqFm" id="roomReqFm" action="roomReqFm.do" method="post">
<input type="hidden" value="${roomIdx }" name="roomidx">

<c:set var="arr" value="${rdto}"/>   
<input type="hidden" name="NO_DATE" value="${arr.nodate}" />
             
       	<p class="req">
            <label>체크인</label>
            <input type="text" name="checkindate" id="datepicker"> 
  		</p>
     	<p class="req">
            <label>체크아웃 </label>
            <input type="text" name="checkoutdate" id="datepicker1">    	
		</p>
		<p class="req">
       		<label>예약인원</label> 
         	<input type="button" id="SUB_NUM" value="-" onclick="subNum()">
 			<input type="text" name="count" id="num" value="1" onchange="call()" style="width:30px;">
  			<input type="button" id="ADD_NUM" value="+" onclick="addNum()">
  		</p>
		<p class="req">
			<label>가격</label>
			<input type="text" style="border:0;" name="total_pay" id="roomp" value=<fmt:formatNumber value="${arr.roomprice}" pattern="#,###,###" /> onkeyup="call()" readonly>
		</p>
		<p class="req">
            <input type="button" class="reqBtn" value="예약하기" onclick="fnSubmit();">
        </p>   
<script>
var price = document.getElementById('roomp').value;
</script>
</form>
</div>

<%@ include file="../footer.jsp" %>

</body>
</html>