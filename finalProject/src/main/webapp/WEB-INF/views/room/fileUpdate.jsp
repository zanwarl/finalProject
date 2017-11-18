<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<head>

</head>
<body>
<%@ include file="../header.jsp"%>
	<form id="frm" name="frm" enctype="multipart/form-data">
	<table>
		<tr>
			<th scope="row">첨부파일</th>
			<td colspan="3">
				<div id="fileDiv">
					<c:forEach var="row" items="${list}" varStatus="var">
						<p>
							<input type="hidden" id="imgaeidx" name="imgaeidx_${var.index }" value="${row.imgaeidx}"> 
							<a href="#this" id="name_${var.index }" name="name_${var.index }">${row.oname }</a>
							<input type="file" id="file_${var.index }" name="file_${var.index }"> (${row.filesize}kb) 
							<a href="#this" class="btn" id="delete_${var.index }" name="delete_${var.index }">삭제</a>
						</p>
					</c:forEach>
				</div>
			</td>
		</tr>
	</table>
	</form>
	<a href="#this" class="btn" id="addFile">파일 추가</a>
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">저장하기</a>
	
	<script type="text/javascript">
		var gfv_count = '${fn:length(list)+1}';
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#update").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				fn_updateBoard();
			});
			
			$("#addFile").on("click", function(e){ //파일 추가 버튼
				e.preventDefault();
				fn_addFile();
			});
			
			$("a[name^='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='home.do'/>");
			comSubmit.submit();
		}
		
		function fn_updateBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='imageUpdate.do'/>");
			comSubmit.addParam("roomidx",${idx});
			comSubmit.submit();
		}
		
		
		function fn_addFile(){
			var str = "<p>" +
					"<input type='file' id='file_"+(gfv_count)+"' name='file_"+(gfv_count)+"'>"+
					"<a href='#this' class='btn' id='delete_"+(gfv_count)+"' name='delete_"+(gfv_count)+"'>삭제</a>" +
				"</p>";
			$("#fileDiv").append(str);
			$("#delete_"+(gfv_count++)).on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		}
		
		function fn_deleteFile(obj){
			obj.parent().remove();
		}
	</script>
	<%@ include file="../footer.jsp"%>
</body>
</html>