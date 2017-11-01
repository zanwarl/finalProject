<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/JavaScript"
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
function areaCode() {
	
	var arr = new Array(); //Object를 배열로 저장할 Array
	var obj = new Object(); //key, value형태로 저장할 Object

		
	$(document).ready(function() {
	     jQuery.ajax({
	           type:"GET",
	           url:"areaCode.do",
	           data: JSON.stringify(arr), //Array를 JSON string형태로 변환
	           dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
	           contentType: "application/json",
	           success : function(data) {
	                 // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
	                 // TODO
					var html = '<div class="notice_more_box">더보기</div>';
					alert("통신데이터 값 : " + data);
					//$("#dataArea").html(data);
					$('#panel').html(html);
	           },
	           complete : function(data) {
	                 // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
	                 // TODO
	                 alert(JSON.stringify(arr));
	           },
	           error : function(xhr, status, error) {
	                 alert("에러발생");
	           }
	     });
	});

}
</script>
</head>
<body>
<form method="post">
	<table>
		<thead>
			<tr>
				<th><a href="tour.do">홈</a></th>
				<th><a href="area.do">주요도시</a></th>
				<th><a href="attraction.do">관광명소</a></th>
				<th><a href="shopping.do">쇼핑</a></th>
				<th><a href="plan.do">여행일정</a></th>
			</tr>
		</thead>
	</table>
	<div>
	</div>
</form>
</body>
</html>

