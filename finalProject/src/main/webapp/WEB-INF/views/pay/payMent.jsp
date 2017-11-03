<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script>
function ok(){
	var IMP = window.IMP; // 생략가능	
	IMP.init('imp23082100');  // 가맹점 식별 코드

	IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:예약결제',
    amount : 100,
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-3043-2881',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456'
}, function(rsp) {
    if ( rsp.success ) {
 	       var msg = '결제가 완료되었습니다.';
/*     	    msg += '고유ID : ' + rsp.imp_uid;
        	msg += '상점 거래ID : ' + rsp.merchant_uid;
        	msg += '결제 금액 : ' + rsp.paid_amount;
        	msg += '카드 승인번호 : ' + rsp.apply_num; */
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
<h1>결제하기</h1>
	<input type="button" value="결제" onclick="ok()">
</form>
</body>
</html>