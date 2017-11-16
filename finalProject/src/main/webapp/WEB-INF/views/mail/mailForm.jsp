<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src='<c:url value="/jquery/jquery-1.11.3.min.js" />'></script>
 
<title>메일 보내기</title>
</head>
<body>
<div >
  <h4>메일 보내기</h4>
  <form action="${pageContext.request.contextPath}/sendMail.do" method="post">
    <div align="center"><!-- 받는 사람 이메일 -->
      <input type="text" name="tomail" size="120" style="width:100%" placeholder="상대의 이메일" class="form-control" value ="${receiver}" >
    </div>     
    <div align="center"><!-- 제목 -->
      <input type="text" name="title" size="120" style="width:100%" placeholder="제목을 입력해주세요" class="form-control" value="안녕하세요, 고객님~! 대한민국 구석구석입니다." >
    </div>
    <p>
    <div align="center"><!-- 내용 --> 
      <textarea name="content" cols="120" rows="12" style="width:100%; resize:none" placeholder="내용#" class="form-control">안녕하세요, 고객님~! 대한민국 구석구석입니다. 
      
      </textarea>
    </div>
    <p>
    <div align="center">
      <input type="submit" value="메일 보내기" class="btn btn-warning">
    </div>
  </form>
</div>
</body>
</html> 