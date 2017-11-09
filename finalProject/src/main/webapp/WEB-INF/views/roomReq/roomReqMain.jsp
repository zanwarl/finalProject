<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form name="roomReqFm" action="roomReq.do" method="post">
   <fieldset>
     
         	<label>예약인원</label>         	

 			<input type="number" name="count" value="1">
  			
         
            <label>check in </label>
            <input type="date" name="checkinDate"> 
  			
         
            <label>check out </label>
            <input type="date" name="checkoutDate">          	

         
            <input type="submit" value="예약하기">           
            
   </fieldset>
</form>





</body>
</html>