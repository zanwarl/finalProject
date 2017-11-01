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

  } );

  </script>

  <script>
	window.onload = function TimeBtn(){
		var timediv = document.getElementById("reqTime");
		for(var i=0;i<10;i++){
			timediv.innerHTML += '<input type="button" name="t_btn'+i+'" value="'+i+'"> ';
		}
	}

  function change(num){
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
  }
  </script>
<title>Insert title here</title>
</head>
<body>
<h2>예약내역</h2>
<form name="culreq" action="culreqList.do">
   <fieldset>
      <table>
         <tr>
            <th>숙소</th>
         </tr>
         
         <tr>
         	<th>예약인원</th>
         	<td>
         	<input type="button" id="minus" value="－" onclick="change(-1)">
 			<span id="p_num">1</span>
  			<input type="button" id="plus" value="＋" onclick="change(1)">
  			</td>
         </tr>
         
         <tr>
            <th>예약날짜</th>
            <td><input type="text" name="c_reqDate" id="datepicker"></td>
         </tr>
         <tr>
            <th>예약시간</th>
            <td><input type="text" name="c_reqTime"></td>
         </tr>
         <tr>
            <td colspan="2" align="center">
               <input type="submit" value="예약확인">            
            </td>
         </tr>
      </table>
   </fieldset>
</form>
</body>
</html>