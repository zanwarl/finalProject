<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>

<head>
<style type="text/css">
.rokImage {width:80px; display:block; float:left; margin-left:10px;}

.reqWrap {
  margin: 20px auto;
  width:400px; 
  height: 400px; 
  -webkit-border-radius: 8px/7px; 
  -moz-border-radius: 8px/7px; 
  border-radius: 8px/7px; 
  background-color: #ebebeb; 
  -webkit-box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
  -moz-box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
  box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
  border: solid 1px #cbc9c9;
}

.req {text-align:center; margin:20px;}

h2 {
  font-size: 32px;
  font-weight: 300;
  color: #4c4c4c;
  text-align: center;
  padding-top: 10px;
  margin-bottom: 10px;
}

#payMent label {float:left; width:100px; margin-left:20px; font-size:20px;}

.text {
width:200px;
font-size:20px;
font-weight:bold;
text-align:center;
}

.reqBtn{
	display: inline-block;
    text-decoration: none;
    color: #fff;
    font-weight: bold;
    background-color: #538fbe;
    padding: 10px 10px;
    font-size: 15px;
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
<script>

function paid (reqIdx){
	location.href ="paidOk.do?reqIdx="+reqIdx; 
}
function ok(reqIdx, amt){
	var IMP = window.IMP; 
	IMP.init('imp23082100');  // 가맹점 식별 코드

	IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:'+reqIdx,
    amount : amt,
    buyer_email : 'iamport@siot.do',
    buyer_name : '${sId}',
    buyer_tel : '010-3043-2881',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456'
}, function(rsp) {
    if ( rsp.success ) {
 	       var msg = '결제가 완료되었습니다.';
 	       paid(reqIdx);      	
        	
        	
 	       
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }

    alert(msg);
});
	
}

	
</script>
<title></title>
</head>


<body>
<%@ include file="../header.jsp" %>
<div id="contents">
	<div class="reqWrap">
	<form name="payMent" id="payMent" action="payMent.do">
	<img src="img/reser.PNG" class="rokImage"><h2>예약 확인 및 결제</h2>
	<hr>
	<c:set var="arr" value="${rdto}"/>	
		<p class="req">
		<label>예약인원수</label>
			<span class="text">${arr.count}</span>
		</p>
		
		<p class="req">
		<label>예약일시 </label>
		<span class="text">${arr.reqDate}</span>
		</p>
		
		<p class="req">
		<label>체크인</label>
		<span class="text">${arr.checkindate}</span>
		</p>
	
		<p class="req">
		<label>체크아웃 </label>
		<span class="text">${arr.checkoutdate}</span>
		</p>
	
		<p class="req">
		<label>총 합계</label>
		<span class="text">${total_pay}</span>
		</p>
		
		<p class="req">
		<input type="button" class="reqBtn" value="결제" onclick="ok('${param.reqidx }', ${total_pay})"> 
		</p>
		</form>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>