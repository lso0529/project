<%@ page language="java" contentType="text/html; charset=Utf-8"

    pageEncoding="Utf-8"%>

<!DOCTYPE html>

<html>

 <head>

    <meta charset="Utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1">

 

 

    <!-- ===============================================-->

    <!--    Document Title-->

    <!-- ===============================================-->

    <title>오점뭐? | 오늘 점심 뭐 먹지?</title>

 

 

    <!-- ===============================================-->

    <!--    Favicons-->

    <!-- ===============================================-->

    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/assets/img/favicons/apple-touch-icon.png">

    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/assets/img/favicons/favicon-32x32.png">

    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/assets/img/favicons/favicon-16x16.png">

    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/favicons/favicon.ico">

    <link rel="manifest" href="${pageContext.request.contextPath}/resources/assets/img/favicons/manifest.json">

    <meta name="msapplication-TileImage" content="${pageContext.request.contextPath}/resources/assets/img/favicons/mstile-150x150.png">

    <meta name="theme-color" content="#ffffff">

 

 

    <!-- ===============================================-->

    <!--    Stylesheets-->

    <!-- ===============================================-->

    <link href="${pageContext.request.contextPath}/resources/assets/css/theme.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/assets/css/reply.css" rel="stylesheet" />
	
 

  </head>

 

 

  <body>

 

    <!-- ===============================================-->

    <!--    Main Content-->

    <!-- ===============================================-->

    <main class="main" id="top">

      <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" data-navbar-on-scroll="data-navbar-on-scroll">

        <div class="container"><a class="navbar-brand d-inline-flex" href="${pageContext.request.contextPath}/"><img class="d-inline-block" src="${pageContext.request.contextPath}/resources/assets/img/gallery/logo.svg" alt="logo" /><span class="text-1000 fs-3 fw-bold ms-2 text-gradient">오점뭐¿</span></a>

          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"> </span></button>

          <div class="collapse navbar-collapse border-top border-lg-0 my-2 mt-lg-0" id="navbarSupportedContent">

            <div class="mx-auto pt-5 pt-lg-0 d-block d-lg-none d-xl-block">

            </div>

            <form class="d-flex mt-4 mt-lg-0 ms-lg-auto ms-xl-0">
				
				<!-- session 처리 해야함 -->
                <%if(session.getAttribute("user_id")==null){ %>

            	<button class="btn btn-white shadow-warning text-warning" type="button" onclick="location.href='${pageContext.request.contextPath}/board/list'">board</button>

            	

				<!-- <button class="btn btn-danger shadow-warning text-light" type="submit"> <i class="fas fa-user me-2"></i>join</button> -->

             	<button class="btn btn-danger shadow-warning text-light" type="button" onclick="location.href='${pageContext.request.contextPath}/member/login'"> <i class="fas fa-user me-2"></i>Login</button>

                <%}else{ %>

                <button class="btn btn-white shadow-warning text-warning" type="button" onclick="location.href='${pageContext.request.contextPath}/board/list'">board</button>
                <button class="btn btn-danger shadow-warning text-light" type="button" onclick="location.href='${pageContext.request.contextPath}/member/logout'"> <i class="fas fa-user me-2"></i>Logout</button>

                <%} %>

            </form>

          </div>

        </div>

      </nav>