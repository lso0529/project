package org.zerock.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	//1. 스프링에서 제공하는 HandlerInterceptorAdapter클래스를 상속 받습니다.
	//2. alt + shift +s -> overiding method를 통해서 3가지 메서드를 오버라이딩해서 사용
	
	//preHandle 메서드는 컨트롤러를 실행하기 전 요청을 가로채서 처리합니다. 
	//일반적으로 로그인, 세션 처리에 사용됩니다.
	//preHandle에 세션처리를 했다면, 스프링 설정 파일에 <interceptor>태그를
	// 사용하여 매핑 설정을 합니다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		
		if(user_id == null) {
			response.sendRedirect("/project/session/loginPage");
			return false;
			//return false이면 핸들러메서드를 실행 후에 Controller를 수행하지 않음
		}else {
			return true;
			//return true인 경우에는 핸들러메서드를 실행 후에 Controller를 수행한다는 의미
		}
		
	}
	
	
	
}
