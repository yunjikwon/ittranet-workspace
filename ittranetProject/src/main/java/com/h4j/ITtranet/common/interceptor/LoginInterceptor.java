package com.h4j.ITtranet.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") != null) {
			return true;
		}else {
			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스 입니다.");
			response.sendRedirect(request.getContextPath());
			return false;
		}
		
		// ★ servlet-context.xml 에서 권한체크할 
		/*
		 * <interceptors>
		 *       <interceptor>
		 *       	<mapping path="해당인터셉터가구동됐으면하는url"/> (ex."/myPage.me"  "enrollForm.pro")
		 *       	<mapping path="..."/>
		 *       	<mapping path="..."/> 등등 다수 작성 가능
		 *       	<beans:bean class="com.h4j.ITtranet.common.interceptor.LoginInterceptor" id="loginInterceptor"/>
		 *       </interceptor>
		 * </interceptors>
		 */
		
	}

}
