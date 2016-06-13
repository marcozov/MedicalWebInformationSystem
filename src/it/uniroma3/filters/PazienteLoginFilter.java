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
import it.uniroma3.controller.ControllerPaziente;

public class PazienteLoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = ((HttpServletRequest) req).getSession();
		ControllerPaziente controllerPaziente = (ControllerPaziente) session.getAttribute("controllerPaziente");
		
		if (controllerPaziente == null || !controllerPaziente.isLoginPazienteSucceded()) {
			String contextPath = ((HttpServletRequest)req).getContextPath();
            ((HttpServletResponse)resp).sendRedirect(contextPath + "/faces/index.jsp");
		}
		else {
			chain.doFilter(req, resp);
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
