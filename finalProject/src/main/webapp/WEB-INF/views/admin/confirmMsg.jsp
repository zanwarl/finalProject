<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
   
   
   if (confirm ("${confirmMsg}"))
   
   window.alert('${msg}');
   
   location.href='${goURL}';
</script>