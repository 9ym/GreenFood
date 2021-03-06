package com.kh.greenfood.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.greenfood.domain.CustomerVo;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		CustomerVo customerVo = (CustomerVo)session.getAttribute("customerVo");
		// 로그인 확인 , 로그인 x일 경우
		if(customerVo == null) {
			String uri = request.getRequestURI();
			String query = request.getQueryString();
			if(query == null || query.equals("")) {
				query = "";
			} else if(uri == "/order/addCart") {
				System.out.println("음");
			} else {
				query = "?" + query;
			} 
			session.setAttribute("dest", uri + query);
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
