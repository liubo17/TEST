package com.shxt.mannger.interceptor;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle( HttpServletRequest request , HttpServletResponse response , Object handler )
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("session_user") == null){
			//调回登录页面
			//response.sendRedirect(request.getContextPath());
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write("<script>alert('系统需要登录才能访问');window.top.location.href='"+ request.getContextPath() +"/index';</script>");


			out.flush();
			out.close();
			return false;
		}
		return true;
	}

}
