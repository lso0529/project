<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>join_result.jsp</title>
	</head>
	<body>
		<script type="text/javascript">
			alert("${msg}");  //화면서 넘어온 msg를 받아서 경고창으로 띄우기
			location.href='login';		
		</script>
	</body>
</html>