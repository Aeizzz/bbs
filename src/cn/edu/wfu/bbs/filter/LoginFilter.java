package cn.edu.wfu.bbs.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import cn.edu.wfu.bbs.user.domain.User;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter(urlPatterns = { "/LoginFilter", "/EditPostServlet",
		"/ChangeUserServlet","/servlet/AdminServlet" }, servletNames = { "EditPostServlet",
		"ChangeUserServlet","AdminServlet" })
public class LoginFilter implements Filter {

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		User user = (User) httpRequest.getSession()
				.getAttribute("session_user");
		if (user != null) {
			chain.doFilter(request, response);
		} else {
			httpRequest.setAttribute("msg", "请登录");
			httpRequest.getRequestDispatcher("/login.jsp").forward(httpRequest,
					response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
