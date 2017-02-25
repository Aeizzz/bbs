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
 * Servlet Filter implementation class AdminLoginFilter
 */
@WebFilter(urlPatterns = { "/AdminLoginFilter", "/servlet/AdminServlet" }, servletNames = { "AdminServlet" })
public class AdminLoginFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public AdminLoginFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httprequest = (HttpServletRequest) request;
		User user = (User) httprequest.getSession()
				.getAttribute("session_user");
		if (user == null) {
			httprequest.setAttribute("msg", "请登录");
			httprequest.getRequestDispatcher("/login.jsp").forward(httprequest,
					response);
			return ;
		}
		if (user.isAdmin() != true) {
			httprequest.setAttribute("msg", "对不起你不是管理员，请重新登录");
			httprequest.getRequestDispatcher("/login.jsp").forward(httprequest,
					response);
			return ;
		}
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
