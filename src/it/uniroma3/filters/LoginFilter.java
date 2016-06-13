package it.uniroma3.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.uniroma3.controller.ControllerAdmin;

public class LoginFilter implements Filter {
	

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
	
		HttpSession session = ((HttpServletRequest) req).getSession();
		ControllerAdmin controllerAdmin = (ControllerAdmin) session.getAttribute("controllerAdmin");
		
		if (controllerAdmin == null || !controllerAdmin.isLoginSucceded()) {
			String contextPath = ((HttpServletRequest)req).getContextPath();
            ((HttpServletResponse)resp).sendRedirect(contextPath + "/faces/admin.jsp");
		}
		else {
			chain.doFilter(req, resp);
		}
		
	}
		

}
