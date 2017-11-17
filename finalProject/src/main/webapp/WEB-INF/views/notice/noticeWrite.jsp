<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>


<style type="text/css">
table, td, th {
	margin-top: 50px;
	border: 1px solid #ddd;
	text-align: left;
	border: 1px solid #ddd;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 15px;
}

textarea {
	height: 100% ; 
	width: 100%;
}

input button {
	border: none;
}

tfoot td {
	text-align: center;
}
</style>

</head>
<body>
	<!-- Sidebar -->

	<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 25%">
		<jsp:include page="/adminMenu.do"></jsp:include>





	</div>





	<!-- Page Content -->
	<div style="margin-left: 25%">

		<div class="w3-container w3-teal">
			<h1>공지사항 작성</h1>
		</div>



		<div class="w3-container">

			<form action="noticeWrite.do" method="post">
				<table>
					<thead>
					</thead>

					<tbody>
						<tr>
							<th>글쓴이</th>
							<td>
							<input style="border: none;" type="text" value="${adminIdx }" readonly="readonly" name="writer">
							</td>
						</tr>

						<tr>
							<th>제목</th>
							<td><input type="text" name="title" required="required" style="width: 100%; "></td>
						</tr>

						<tr>
							<th>내용</th>
							<td><textarea rows="10" cols="" name="content" required="required"></textarea></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2"><input type="submit" value="글쓰기" style="border: none;"></td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</div>
</body>
</html>