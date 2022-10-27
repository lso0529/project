<%@ page language="java" contentType="text/html; charset=Utf-8"
	pageEncoding="Utf-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>비밀번호 찾기</title>

<!-- Custom fonts for this template -->
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/resources/assets/img/favicons/apple-touch-icon.png">

<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/resources/assets/img/favicons/favicon-32x32.png">

<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/resources/assets/img/favicons/favicon-16x16.png">

<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/assets/img/favicons/favicon.ico">

<link rel="manifest"
	href="${pageContext.request.contextPath}/resources/assets/img/favicons/manifest.json">

<meta name="msapplication-TileImage"
	content="${pageContext.request.contextPath}/resources/assets/img/favicons/mstile-150x150.png">

<meta name="theme-color" content="#ffffff">


</head>
<body class="bg-gradient-primary">
	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<!-- nested Row within Card Body -->
			<div class="row">
				<div class="col-lg-3"></div>

				<div class="col-lg-6">
					<div class="p-5">
						<div class="text-center">
							<h1 class="h4 text-gray-900 mb-2">비밀번호 찾기</h1>
						</div>
						<form class="user" action="findPwform" method="POST">
							<div class="form-group">
								<input type="text" class="form-control form-control-user"
									id="id" aria-describedby="idlHelp" name="id"
									placeholder="아이디를 입력하세요">
							</div>
							<div class="form-group">
								<input type="email" class="form-control form-control-user"
									id="email" aria-describedby="emailHelp" name="email"
									placeholder="이메일 주소를 입력하세요">
							</div>
							<div style="padding: 3px;"> </div>
							<div class="text-center">
								<input type="submit" class="btn btn-primary btn-user btn-block" value="확인">
								<input type="button" class="btn btn-primary btn-user btn-block" value="취소" onclick="location.href='login'"> 
							</div>
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>

	<script
		src="${pageContext.request.contextPath}/resources/vendors/@popperjs/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/is/is.min.js"></script>
	<!-- <script src="${pageContext.request.contextPath}/resources/vendors/bootstrap/bootstrap.min.js"></script> -->
	<script
		src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/fontawesome/all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/theme.js"></script>

	<link
		href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700;900&amp;display=swap"
		rel="stylesheet">

	<!-- jquery 임포트 코드가 로딩된 후에 실행하도록 페이지 마지막에 작성 -->
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/js/reply.js"></script>
	<script type="text/javascript">
		
	
	
	</script>
</body>

</html>