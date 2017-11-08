<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
window.alert('${msg}');
opener.document.memberJoin.member_id.value='${userid}';
window.self.close();
</script>