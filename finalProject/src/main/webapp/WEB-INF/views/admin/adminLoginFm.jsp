<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!doctype html>
<html lang="kr">
	<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	
	<title>title </title>

<style >
body {
  
   font: 13px/20px 'Helvetica Neue', Helvetica, Arial, sans-serif;
   color: #333333;

}

.signUp {
   position: relative;
   margin: 50px auto;
   width: 280px;
   padding: 33px 25px 29px;
   background: #FFFFFF;
   border-bottom: 1px solid #C4C4C4;
   border-radius: 5px;
   -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
   box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
}

.signUp:before,
.signUp:after {
   content: '';
   position: absolute;
   bottom: 1px;
   left: 0;
   right: 0;
   height: 10px;
   background: inherit;
   border-bottom: 1px solid #D2D2D2;
   border-radius: 4px;
}

.signUp:after {
   bottom: 3px;
   border-color: #DCDCDC;
}

.signUpTitle {
   margin: -25px -25px 25px;
   padding: 15px 25px;
   line-height: 35px;
   font-size: 26px;
   font-weight: 300;
   color: #777;
   text-align: center;
   text-shadow: 0 1px rgba(255, 255, 255, 0.75);
   background: #F7F7F7;
}

.signUpTitle:before {
   content: '';
   position: absolute;
   top: 0;
   left: 0;
   right: 0;
   height: 8px;
   background: #009788;
   border-radius: 5px 5px 0 0;

}

input {
   font-family: inherit;
   color: inherit;
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
}

.signUpInput {
   width: 100%;
   height: 50px;
   margin-bottom: 25px;
   padding: 0 15px 2px;
   font-size: 17px;
   background: white;
   border: 2px solid #EBEBEB;
   border-radius: 4px;
   -webkit-box-shadow: inset 0 -2px #EBEBEB;
   box-shadow: inset 0 -2px #EBEBEB;
}

.signUpInput:focus {
   border-color: #62C2E4;
   outline: none;
   -webkit-box-shadow: inset 0 -2px #62C2E4;
   box-shadow: inset 0 -2px #62C2E4;
}

.lt-ie9 .signUpInput {
   line-height: 48px;
}

.signUpButton {
   position: relative;
   vertical-align: top;
   width: 100%;
   height: 54px;
   padding: 0;
   font-size: 22px;
   color: white;
   text-align: center;
   text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
   background: #F0776C;
   border: 0;
   border-bottom: 2px solid #D76B60;
   border-radius: 5px;
   cursor: pointer;
   -webkit-box-shadow: inset 0 -2px #D76B60;
   box-shadow: inset 0 -2px #D76B60;
}

.signUpButton:active {
   top: 1px;
   outline: none;
   -webkit-box-shadow: none;
   box-shadow: none;
}

:-moz-placeholder {
   color: #AAAAAA;
   font-weight: 300;
}

::-moz-placeholder {
   color: #AAAAAA;
   opacity: 1;
   font-weight: 300;
}

::-webkit-input-placeholder {
   color: #AAAAAA;
   font-weight: 300;
}

:-ms-input-placeholder {
   color: #AAAAAA;
   font-weight: 300;
}

::-moz-focus-inner {
   border: 0;
   padding: 0;
}
</style>
</head>
<body>

<div class="w3-container w3-teal">
<h3>관리자 페이지</h3>

</div>

<form class="signUp" id="signupForm" action="adminLogin.do" method="post">
   <h1 class="signUpTitle">관리자 로그인</h1>
   <input name="idx" type="text" class="signUpInput" placeholder="사번" value ="${cookie.saveId.value }" autofocus required  >
   <input name ="pwd" type="password" class="signUpInput" placeholder="비밀번호" required  >
  <input type="submit" value="로그인" class="signUpButton">
    사번 저장 <input type="checkbox" name="saveId" value="on" checked="${empty cookie.saveId.value?'':'checked' }">
</form>

</body>
</html>
    
    
    
<%-- <!DOCTYPE html>
<html>
<head>
<meta  charset=UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>


<div class="w3-container w3-teal">
<h3>관리자 페이지</h3>

</div>





<form action="adminLogin.do" method="post">

<table >

	<tr>
		<th>사번</th>
		<td colspan="2"><input type="text" name="idx" value="${cookie.saveId.value }" ></td>
		<td rowspan="2" align="center" >	<input type="submit" value ="로그인"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td colspan="2"><input type="password" name="pwd"></td>
	</tr>
	
	<tr>
	<td colspan="4" align="right"> 사번 저장 <input type="checkbox" name="saveId" value="on" checked="${empty cookie.saveId.value?'':'checked' }"> </td>
	</tr>
	
</table>

</form>

</body>
</html> --%>