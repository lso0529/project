<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@include file="../include/header.jsp"%>
      <section class="py-5 overflow-hidden bg-primary" id="home">
        <div class="container" align="center">
          <div class="row flex-center" align="center">
            <div class="col-md-7 col-lg-6 py-8 text-md-start text-center" align="center">
              <h1 class="text-800 mb-5 fs-4">당신의 메뉴:</h1>
              <h1 class="display-1 fs-md-5 fs-lg-6 fs-xl-8 text-light" style="color:graytext;" align="center">${vo.FNAME }</h1>
              <hr>
	              <div  align="center">
	              <form class="row gx-2 gy-2 align-items-center" style="display: flex; align-items: center;" action="${pageContext.request.contextPath}/random/doRandom">
	                   <div class="d-grid gap-3 col-sm-auto">
	                     <button class="btn btn-danger" style="color:#F17228; background-color: #FFFEFE;" type="button" onclick="location.href='${pageContext.request.contextPath}/random/doRandom?location=${location }'">다시하기</button>
	                  </div>
	                  <div class="d-grid gap-3 col-sm-auto">
	                     <button class="btn btn-danger" type="button" onclick="location.href='resultMap?food=${vo.FNO }&&location=${location}'">주변 식당 보기</button>
	                  </div>
	              </form>
	              </div>
			</div>
		</div>
		</div>
      </section>
<%@include file="../include/footer.jsp"%>