<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	$( function() {
	$( "#datepicker" ).datepicker();
	});
	
	$( function() {
		$( "#datepicker1" ).datepicker();
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
  

function addNum(){
	var frm = document.roomReqFm;
	var count = frm.count.value;
	
	if(Number(count) > 9){
		alert("최대 10명까지 예약할 수 있습니다.");
	}else{
		frm.count.value = Number(count) + 1;
	}
}
  
function subNum(){
	var frm = document.roomReqFm;
	var count = frm.count.value;
	
	if(Number(count) < 2){
		alert("최소 1명 이상 선택해야 합니다.");
	}else{
		frm.count.value = Number(count) - 1;  
	}
}
</script>
</head>
<body>

<form name="roomReqFm" action="roomReqFm.do" method="post">
<input type="hidden" value="${roomIdx }" name="roomidx">
   

   
   <table>
     <tr>          
       	<td>
       		<label>예약인원</label> 
         	<input type="button" id="SUB_NUM" value="-" onclick="subNum()">
 			<input type="number" name="count" value="1" style="width:17px;">
  			<input type="button" id="ADD_NUM" value="+" onclick="addNum()">
  		</td>
  	</tr> 
   	<tr>
   		<td>
            <label>check in</label>
            <input type="text" name="checkindate" id="datepicker"> 
  		</td>
     </tr>   
     <tr>
     	<td>
            <label>check out </label>
            <input type="text" name="checkoutdate" id="datepicker1">          	
		</td>
	</tr>
			<td colspan="2" align="center">
            <input type="submit" value="예약하기">  
           
    </td>   
 </table>
</form>



</body>
</html>