<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
<title>Insert title here</title>
</head>


<body>	

<form name="payMent" action="payMent.do">
	<table>
	<c:set var="arr" value="${rdto}"/>

	<h2> 선택한 예약내역</h2>
		<tr>
			<th>예약인원수</th>
			<th>${arr.count}</th>
		</tr>
		<tr>
			<th>예약일시</th>
			<th>${arr.reqDate}</th>
		</tr>
		<tr>
			<th>체크인</th>
			<th>${arr.checkindate}</th>
		</tr>
		<tr>
			<th>체크아웃</th>
			<th>${arr.checkoutdate}</th>
		</tr>
		<tr>
			<th>총 합계</th>
			<th>${total_pay}</th>
		</tr>
		<tr>
			<td colspan="2" align="center">	 
				<input type="button" value="결제" onclick="ok('26', ${total_pay})"> 
			</td>
			<td>	 </td>
		</tr>	 	   
	</table>
	</form>
</div>
</body>
</html>