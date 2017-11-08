<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#p_num {border:0px;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
function showTime(){
	window.open('foodTime.do','dateForm','width=350,height=200');
}
  function change(num){
	  var max=10;
	  var p_num=  parseInt(document.getElementById('p_num').value);
	  var result= num+p_num;
	  document.getElementById('p_num').value=result;


	  if(result<1){
		  alert('최소 1명이상 예약해야합니다.');
		  p_num.innerHTML=1;
	  }else if(result>max){
		  alert('최대 수용인원수를 벗어났습니다.');
		  result--;
		  p_num.innerHTML=result;
	  }
  }
  </script>
  </head>
<body>
<h2>식당정보</h2>
<form name="foodreq" action="foodreqWrite.do">
   <fieldset>
     
         	<label>예약인원</label>
         	
         	<input type="button" id="minus" value="－" onclick="change(-1)">
 			<input type="text" id="p_num" value="1" readonly>
  			<input type="button" id="plus" value="＋" onclick="change(1)">
  			
         
            <label>예약날짜</label>
            <input type="text" name="frdate"> 
         	
            <input type="button" name="frtime_btn" onclick="showTime()" value="예약시간">
            <input type="text" name="frtime">
         
            <input type="submit" value="예약하기">           
            
   </fieldset>
</form>
</body>
</html>