<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
	<article>
		<h2>음식점 등록</h2>
		<form name="addFood" action="addFood.do">
		<table>
			<tr>
				<th>가게이름</th>
				<td><input type="text" name="fname"></td>
			</tr>
			<tr>
				<th>오픈시간</th>
				<td><input type="text" name="opentime"></td> 
			</tr>
			<tr>
				<th>클로즈시간</th>
				<td><input type="text" name="closetime"></td>
			</tr>
			<tr>
				<th>기본주소</th>
				<td><input type="text" name="addr1"></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input type="text" name="addr2"></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><input type="text" name="image"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="number" name="foodpay"></td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea rows="10" cols="80" name="content">
					</textarea>
				</td>
			</tr>
			<tr>
				<th>예약가능시간</th>
				<td><input type="text" name="abletime"></td>
			</tr>
			<tr>
				<th>예약가능인원</th>
				<td><input type="number" name="pcount"></td>
			</tr>
			<tr>
				<td>
				<input type="submit" value="등록">
				<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
		</form> 
	</article>
</section>
</body>
</html>