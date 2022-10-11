<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@include file="../include/header.jsp"%>
      <section class="py-5 overflow-hidden bg-primary" id="home">
        <div class="container">
          <div class="row flex-center">
            <div class="col-md-7 col-lg-6 py-8 text-md-start text-center">
              <h1 class="display-1 fs-md-5 fs-lg-6 fs-xl-8 text-light">${vo.FNAME }</h1>
              <a href="resultMap?food=${vo.FNO }">주변 식당 보기</a>
			</div>
		</div>
		</div>
      </section>
<%@include file="../include/footer.jsp"%>