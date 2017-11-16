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
function ok(reqIdx, amt ){
	var IMP = window.IMP; // ��������	
	IMP.init('imp23082100');  // ������ �ĺ� �ڵ�

	IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '�ֹ���:'+reqIdx,
    amount : amt,
    buyer_email : 'iamport@siot.do',
    buyer_name : '${sId}',
    buyer_tel : '010-3043-2881',
    buyer_addr : '����Ư���� ������ �Ｚ��',
    buyer_postcode : '123-456'
}, function(rsp) {
    if ( rsp.success ) {
 	       var msg = '������ �Ϸ�Ǿ����ϴ�.';
 	       paid(reqIdx);
 	       
        	
        	
        	
 	       
    } else {
        var msg = '������ �����Ͽ����ϴ�.';
        msg += '�������� : ' + rsp.error_msg;
    }

    alert(msg);
});
	
}
</script>
<title>Insert title here</title>
</head>
<form name="payMent" action="payMent.do">
<body>
<section>
	<table>
	<c:set var="arr" value="${rdto}"/>

		<tr>
			<th>�����ο���</th>
			<th>${arr.count}</th>
		</tr>
		<tr>
			<th>�����Ͻ�</th>
			<th>${arr.reqDate}</th>
		</tr>
		<tr>
			<th>üũ��</th>
			<th>${arr.checkindate}</th>
		</tr>
		<tr>
			<th>üũ�ƿ�</th>
			<th>${arr.checkoutdate}</th>
		</tr>
		<tr>
			<th>�� �հ�</th>
			<th>${rprice}</th>
		</tr>
		<tr>
			<td colspan="2" align="center">	 
				<input type="button" value="����" onclick="ok('26', 100)"> 
			</td>
			<td>	 </td>
		</tr>	 	   
	</table>
</section>
</body>
</form>
</html>