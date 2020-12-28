package com.kh.greenfood.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.greenfood.domain.TestVo;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 로그인 세션 확인
		HttpSession session = request.getSession();
		TestVo testVo = (TestVo)session.getAttribute("TestVo");
		if(testVo == null) {
			String uri = request.getRequestURI();
			String queryString = request.getQueryString();
			String targetLocation = uri + "?" + queryString;
			session.setAttribute("targetLocation", targetLocation);
			System.out.println("targetLocation" + targetLocation);
			response.sendRedirect("/main/loginPage");
			return false;
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
}
