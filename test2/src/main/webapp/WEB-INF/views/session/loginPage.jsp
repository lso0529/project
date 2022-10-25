<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginPage.jsp</title>
	</head>
	<body>
		<form action="sessionLogin" method="post">
			<input type="text" name="id" placeholder="아이디"><br>
			<input type="text" name="pw" placeholder="비밀번호"><br>
			
			<input type="submit" value="로그인">
			<input type="button" value="취소" onclick="location.href='mainPage'"><br>
		</form>
		<p style="color:red">${msg }</p>	
	</body>
</html>