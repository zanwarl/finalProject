<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
.reqBtn {
	/*General*/
	display: inline-block;
	text-decoration: none;
	/*Text*/
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size:13px;
	font-weight:bold;
	line-height:240%;
	color:rgb(81,123,135);
	text-align:center;
	text-shadow:0px 1px 0px rgba(255,255,255,0.5);
	
	/*Button*/
	background-color: #CEE7EE;
	background-image:-moz-linear-gradient(53% 100% 90deg,rgb(206,231,238) 0%,rgb(246,246,255) 100%); 
	background-image:-webkit-gradient(linear,53% 100%,53% 3%,color-stop(0, rgb(206,231,238)),color-stop(1, rgb(246,246,255)));
	background-image:-webkit-linear-gradient(90deg,rgb(206,231,238) 0%,rgb(246,246,255) 100%);
	background-image:-o-linear-gradient(90deg,rgb(206,231,238) 0%,rgb(246,246,255) 100%);
	background-image:-ms-linear-gradient(90deg,rgb(206,231,238) 0%,rgb(246,246,255) 100%);
	background-image:linear-gradient(90deg,rgb(206,231,238) 0%,rgb(246,246,255) 100%);
	width:120px;
	height:30px;
	border-color:rgb(158,185,194);
	border-width:1px;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
	border-style:solid;
	-moz-box-shadow:0px 0px 0px 3px rgba(0,0,0,0.05) ,inset 0px 1px 0px rgba(255,255,255,0.5);
	-webkit-box-shadow:0px 0px 0px 3px rgba(0,0,0,0.05) ,inset 0px 1px 0px rgba(255,255,255,0.5);
	box-shadow:0px 0px 0px 3px rgba(0,0,0,0.05) ,inset 0px 1px 0px rgba(255,255,255,0.5);
	-ms-filter:"progid:DXImageTransform.Microsoft.gradient(startColorstr=#fff6f6ff,endColorstr=#ffcee7ee,GradientType=0)
		progid:DXImageTransform.Microsoft.Glow(Color=#ff000000,Strength=3)";
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#fff6f6ff,endColorstr=#ffcee7ee,GradientType=0)
		progid:DXImageTransform.Microsoft.Glow(Color=#ff000000,Strength=3);
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script language='javascript'>
	$( function() {
	$( "#datepicker" ).datepicker({ minDate:0});
	});
	
	$( function() {
		$( "#datepicker1" ).datepicker({ minDate:0});
		});

	window.onload = function TimeBtn(){
		var timediv = document.getElementById("button");
		for(var i=0;i<10;i++){
			timediv.innerHTML += '<input type="button" name="t_btn'+i+'" value="'+i+'"> ';
		}	
	}

	 /* function change(num){
	  var max=10;
	  var p_num= document.getElementById("p_num");
	  var pas_num = Number(p_num.innerHTML);
	  var result = pas_num+num;
	  p_num.innerHTML = result;
	  
	  if(result<1){
		  alert('최소 1명이상 예약해야합니다.');
		  p_num.innerHTML=1;
	  }else if(result>max){
		  alert('최대 수용인원수를 벗어났습니다.');
		  result--;
		  p_num.innerHTML=result;
	  }
  } */
  



  


/* function call(rp)
{

 if(document.getElementById("num").value && document.getElementById("roomp").value){
  document.getElementById('roomp').value =parseInt(document.getElementById('num').value) * parseInt('rp');
 }
} */

	var date = 1;
	function call() {
		
		var day1 = $('#datepicker').val();
		day1 = day1.substring(3,5);
		
		(day1.charAt(0));
		
		if(day1.charAt(0)==0) {
			day1 = day1.charAt(1);
		} 
		
		var day2 = $('#datepicker1').val();
		day2 = day2.substring(3,5);
		
		(day2.charAt(0));
		
		if(day2.charAt(0)==0) {
			day2 = day2.charAt(1);
		} 
		
		date = day2 - day1;
		
		var num = $('#num').val();
		var sum = price*num*date;
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


</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<div id="contents">
<form name="roomReqFm" id="roomReqFm" action="roomReqFm.do" method="post">
<input type="hidden" value="${roomIdx }" name="roomidx">
<c:set var="arr" value="${rdto}"/>   
             
       	<p class="req">
       		<label>예약인원</label> 
         	<input type="button" id="SUB_NUM" value="-" onclick="subNum()">
 			<input type="text" name="count" id="num" value="1" onchange="call()" style="width:30px;">
  			<input type="button" id="ADD_NUM" value="+" onclick="addNum()">
  		</p>
   		<p class="req">
            <label>check in</label>
            <input type="text" name="checkindate" id="datepicker"> 
  		</p>
     	<p class="req">
            <label>check out </label>
            <input type="text" name="checkoutdate" id="datepicker1">          	
		</p>
		<p class="req">
			<label>가격</label>
			<input type="text" name="roomprice" id="roomp" value="${arr.roomprice}" onkeyup="call()" readonly>
		</p>
		<p class="req">
            <input type="submit" class="reqBtn" value="예약하기">
        </p>   

<script>
var price = document.getElementById('roomp').value;
</script>
</form>
</div>

<%@ include file="../footer.jsp" %>

</body>
</html>