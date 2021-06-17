package pmtool.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;



public class MyInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		System.out.println("this is prehandler..");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String usertype=request.getParameter("usertype");
		return true;
		
	}
	

}