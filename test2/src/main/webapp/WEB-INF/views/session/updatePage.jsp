<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>updatePage.jsp</title>
	</head>
	<body>
		<h2>회원정보 수정 화면</h2>
		아이디 : ${sessionScope.user_id }<br>
		이름 : ${sessionScope.user_name }
	</body>
</html>