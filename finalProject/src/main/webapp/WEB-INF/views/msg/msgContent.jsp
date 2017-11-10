<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html >
<html>
<head>

<meta charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

$white: #eee;

$bg1: #555;
$bg2: #333;
$chat-left-color: lighten(royalblue,35);
$chat-right-color: lighten(royalblue,10);
$font-dark: #333;
$font-light: #f5f5f5;
$tail-size: 20px;


body {
	background-color: $bg2;
	background: radial-gradient(circle, $bg1, $bg2);
	min-height: 100vh;
}


p { margin: 0; }

fieldset {
	font-size: 1em;
	padding: 0.5em;
	border: none;
}

label, input, button {
	font-size: inherit;
	padding: 0.2em;
	margin: 0.1em 0.2em;
	box-sizing: border-box;
	background-color: transparent;
	border: inherit;
	color: $font-dark;
}

/*// Screen*/

.container {
	height: 100vh;
	max-width: 768px;
	min-width: 350px;
	margin: 0 auto;	
}

.phone {
	padding-top: 10px;
	background-color: $white;
	position: relative;
	box-sizing: border-box;
	height: 100vh;
	padding-bottom: 70px;
}

/*msg*/
.message {
	padding: 0 10px;
}
.message .chat {
	text-align: left;
	position: relative;
	max-width: 75%;
	display: inline-block;
	padding: 20px;
	padding-bottom: 10px;
	line-height: 1.5;
	margin: 10px 20px;
	border-radius: 10px;
	&:before,
	&:after { 
		content: "";
		position: absolute; 
		bottom: 0; 
		width: $tail-size;
		height: $tail-size;
		background-color: $white;
	}
}

.message.left {
	text-align: left;
	.chat {
		background-color: $chat-left-color;
		color: $font-dark;
		border-bottom-left-radius: 0px;
		&:before {
			left: -$tail-size;
			z-index: 2;
			border-bottom-right-radius: 60% 50%;
		}
		&:after {
			background-color: inherit;
			left: -$tail-size;
			z-index: 1;
		}
	}
}

.message.right {
	text-align: right;
	.chat {
		background-color: $chat-right-color;
		color: $font-light;
		border-bottom-right-radius: 0px;
		&:before {
			right: -$tail-size;
			z-index: 2;
			border-bottom-left-radius: 60% 50%;
		}
		&:after {
			background-color: inherit;
			right: -$tail-size;
			z-index: 1;
		}
	}
}

.message .chat figcaption { font-size: 7.5pt; margin-top: 2px;}

/* Chat Input*/
.chat-input {
	position: absolute;
	bottom: 0;
	width: 100%;
	border-top: 2px solid #ccc;
	background-color: #f5f5f5;
	z-index: 3;
	button {
		width: 50px;
		height: 50px;
		background-color: #ccc;
		border-radius: 4px;
		transition: all 100ms ease-in-out;
		&:hover {
			background-color: #333;
			color: #ccc;
		}
	}
	input {
		height: 50px;
		width: calc(100% - 100px - 1.8em);
		border-bottom: 2px solid #888;
		transition: all 300ms ease-in-out;
		&:focus {
			outline: none;
			border-bottom-color: $chat-right-color;
		}
	}
}
</style>

</head>
<body>



${partner}님과의 대화입니다.



<table>
	<thead>
	
	
		<tr>
			<th>idx</th>
			<th>보낸사람</th>
			<th>받는사람</th>
			<th>내용</th>
			<th>날짜</th>
			
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty list}">
      <tr>
         <td colspan="5" align="center">
         메시지가 없습니다. 
 		 </td>
      </tr>
   </c:if>
   <c:forEach var="dto" items="${list}">
      
 
      
      <tr>
      
       
         <td>${dto.idx}</td>
         <td>${dto.sender }</td>
         <td>${dto.receiver }</td>
         


         <td>${dto.content}</td>
         <td>${dto.writedate}</td>
       
      </tr>
   </c:forEach>
	
	</tbody>
	
	
	
	<tfoot>

		
			<tr>
			
				<td colspan="5">
				<form action="sendMsg.do" method="post">
					
sender	<input type="text" name="sender" value="${sId}" readonly="readonly">

<br>
receiver
	<input type="text" name="receiver" value="${partner}">
	
	<br>
	<textarea rows="5" cols="10" name="content">
	
		
	</textarea>
	
	<input type="submit" value="보내기">
				
		</form>
		
				
				</td>
			</tr>
	


	</tfoot>

</table>
<hr>


    <h2>[${partner }]님과의 대화</h2>
<div class="container">

		<div class="chat-input">
		
		
		   <form action="sendMsg.do" method="post" name="sendMsgFm">
    				<fieldset>
				<input type="hidden" name="sender" value="${sId}" readonly="readonly">

	<input type="hidden" name="receiver" value="${partner}">
				   <input type="text" placeholder="Enter your message.." name="content"/>
				<button type="submit"><i class="fa fa-lg fa-send"></i></button>
			</fieldset>
     
      </form>
		
		
		
		
		
		
		
		
	</div>
	<div class="phone">
	
	
	
			<c:forEach var="dto" items="${list}">
				<c:if test="${sId==dto.sender }">
						<div class="message left">
		<figure class="chat">
			<p>
				
					${dto.content }
					</p>
			<figcaption>1:50 PM</figcaption>
		</figure>
	</div>
					
				</c:if>
				<c:if test="${partner == dto.sender}">
					<div class="message right">
		<figure class="chat">
			<p>
				${dto.content }
								
		</p>
			<figcaption>1:55 PM</figcaption>
		</figure>	
	</div>

				</c:if>



			</c:forEach>
	
	<!-- 
	<div class="message left">
		<figure class="chat">
			<p>
				Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae architecto quas doloribus facere sapiente facilis voluptatibus eaque, magnam suscipit similique aut aperiam assumenda a nostrum, odit sed accusantium. Nihil, a.
			</p>
			<figcaption>1:50 PM</figcaption>
		</figure>
	</div>
	
	<div class="message right">
		<figure class="chat">
			<p>
				Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius sit, error modi cupiditate quae minus nemo maiores odio qui ex. Praesentium totam optio sed rerum.
			</p>
			<figcaption>1:55 PM</figcaption>
		</figure>	
	</div>
	 -->


	</div>
	
</div>

<!-- ------------------------- -->

<%-- 
<br>
<hr>
<div class="container">
  <div class="header">
    <h2>[${partner }]님과의 대화</h2>
  
  </div>
  <div class="chat-box">
      <div class="enter-message">
    <form action="sendMsg.do" method="post" name="sendMsgFm">
    	<input type="hidden" name="sender" value="${sId}" readonly="readonly">

	<input type="hidden" name="receiver" value="${partner}">
      <input type="text" placeholder="Enter your message.." name="content"/>
      <a href="javascript:document.sendMsgFm.submit()"  class="send">Send</a>
      </form>
    </div>


			<c:forEach var="dto" items="${list}">
				<c:if test="${sId==dto.sender }">
					<div class="message-box right-img">

						<div class="message">

							<p>${dto.content }</p>

						</div>
					</div>
				</c:if>
				<c:if test="${partner == dto.sender}">
					<div class="message-box left-img">

						<div class="message">

							<p>${dto.content }</p>
						</div>
					</div>

				</c:if>



			</c:forEach>




		</div>
</div> --%>

</body>
</html>