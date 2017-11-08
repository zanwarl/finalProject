<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
   
   
   if (confirm ("${confirmMsg}")){
	  
	   
	   location.href='${yesURL}';

	   
   }
   
   else {
	   location.href ='${noURL}'
	
		   
   }

  
</script>