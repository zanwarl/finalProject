<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html >
<html>
<head>

<script type="text/javascript">


$(window).on('load', function () {
    load('#js-load', '4');
    $("#js-btn-wrap .button").on("click", function () {
        load('#js-load', '4', '#js-btn-wrap');
    })
});
 
function load(id, cnt, btn) {
    var girls_list = id + " .js-load:not(.active)";
    var girls_length = $(girls_list).length;
    var girls_total_cnt;
    if (cnt < girls_length) {
        girls_total_cnt = cnt;
    } else {
        girls_total_cnt = girls_length;
        $(button).hide();
    }
    $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
}
</script>

<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">

*{
  font-family:'Helvetica Neue',Helvetica, sans-serif;
  font-size:14px;
  margin:0;
}

/*word-break:break-all;  */

a{
  font-weight:bold;
  color:#fff;
  text-decoration:none;
}
.container{

height : 600px; 
overflow:scroll
; 

  width:430px;
  display:block;
  margin:0 auto;
  box-shadow:0 2px 5px rgba(0,0,0,0.4);
  word-break:break-all; 
  
  
}
.header{
  padding:20px 20px 18px 20px;
  background:#5FB471;
  color:#fff;
}
.header h2{
  font-size:16px;
  line-height:15px;
  display:inline-block;
}
.header a{
  display:inline-block;
  float:right;
  background:#3d8b4e;
  font-size:25px;
  line-height:20px;
  padding:3px 6px;
  margin-top:-5px;
  border-radius:2px;
}
.chat-box, .enter-message{
  background:#ECECEC;
  padding:0 20px;
  color:#a1a1a1;
}
.chat-box .message-box{
  padding:18px 0 10px;
  clear:both;
}
.message-box .picture{
  float:left;
  width:50px;
  display:block;
  padding-right:10px;
}
.picture img{
  width:43px;
  height:48px;
  border-radius:5px;
}
.picture span{
  font-weight:bold;
  font-size:12px;
  clear:both;
  display:block;
  text-align:center;
  margin-top:3px;
}
.message{
  background:#fff;
  display:inline-block;
  padding:13px;
  width:274px;
  border-radius:2px;
  box-shadow: 0 1px 1px rgba(0,0,0,.04);
  position:relative;
}
.message:before{
  content:"";
  position:absolute;
  display:block;
  left:0;
  border-right:6px solid #fff;
  border-top: 6px solid transparent;
  border-bottom:6px solid transparent;
  top:10px;
  margin-left:-6px;
}
.message span{
  color:#555;
  font-weight:bold;
}
.message p{
  padding-top:5px;
}
.message-box.right-img .picture{
  float:right;
  padding:0;
  padding-left:10px;
}
.message-box.right-img .picture img{
  float:right;
}
.message-box.right-img .message:before{
  left:100%;
  margin-right:6px;
  margin-left:0;
  border-right:6px solid transparent;
  border-left:6px solid #fff;
  border-top: 6px solid transparent;
  border-bottom:6px solid transparent;
}
.enter-message{
  padding:13px 0px;
}
.enter-message textarea{
  border:none;
  padding:10px 12px;
  background:#d3d3d3;
  width:260px;
  border-radius:2px;
}
.enter-message a.send{
  padding:10px 15px;
  background:#6294c2;
  border-radius:2px;
  float:right;
}
</style>

</head>
<body>



<jsp:include page="/header.do"></jsp:include>



	<div id="contents">

<!-- ---------본문내용---------------  -->

<div class="container">
  <div class="header">
    <h2>${partner }님과의 대화</h2>
    
  </div>
		<div class="chat-box" >
		<!--  chat box == content  -->
		
		
     <div class="enter-message">
    <form action="sendMsg.do" method="post" name="sendMsgFm">
    	<input type="hidden" name="sender" value="${sId}" readonly="readonly">

	<input type="hidden" name="receiver" value="${partner}">
	<!-- 
	<textarea rows="" cols=""></textarea>
      <input type="text" placeholder="메세지를 입력하세요" name="content"/> -->
      	<textarea rows="2" cols="35" name="content"></textarea>
      
      <a href="javascript:document.sendMsgFm.submit()"  class="send">Send</a>
      </form>
    </div>
		

			<c:forEach var="dto" items="${list}">
			<c:set var="writedate" value="${dto.writedate }"></c:set>
				<c:if test="${sId==dto.sender }">
					
					
					
					
						<div class="message-box right-img">
				<div class="picture">
					<span>${dto.sender } </span> 
	
				</div>
				<div class="message">
					<span> ${dto.content}</span>
					<p>${fn:substring (writedate,0,4 )}년
					${fn:substring (writedate,5,7 )}월
					${fn:substring (writedate,8,10 )}일 ${ fn:substring (writedate,11,13 )}시${ fn:substring (writedate,14,16 )}분</p>
					</div>
			</div>
					
					
				</c:if>
				<c:if test="${partner == dto.sender}">
					


			<div class="message-box left-img">
				<div class="picture">
					<span>${dto.sender }</span> 
							</div>
				<div class="message">
					<span>${dto.content }</span>
					<p>${fn:substring (writedate,0,4 )}년
					${fn:substring (writedate,5,7 )}월
					${fn:substring (writedate,8,10 )}일 ${ fn:substring (writedate,11,13 )}시${ fn:substring (writedate,14,16 )}분</p>
				
				</div>
			</div>
				</c:if>



			</c:forEach>



	
	

		
			<!-- <div class="enter-message">
		
		
				<input type="text" placeholder="Enter your message.." /> <a href="#"
					class="send">Send</a>
			</div> -->
		</div>
		<div id = "js-btn-wrap" > </div>
	
	</div>

</div>

<jsp:include page="/footer.do"></jsp:include>




</body>
</html>


