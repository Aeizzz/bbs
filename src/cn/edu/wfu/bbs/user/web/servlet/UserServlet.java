package cn.edu.wfu.bbs.user.web.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.wfu.bbs.post.domain.Post;
import cn.edu.wfu.bbs.user.domain.User;
import cn.edu.wfu.bbs.user.service.UserService;
import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class UserServlet extends BaseServlet {
	private UserService userSerice = new UserService();
	
	
	/**
	 * 用户注册
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User from = CommonUtils.toBean(request.getParameterMap(), User.class);
		String againpassworld = request.getParameter("againpassworld");
		if(!from.getPassworld().trim().equals(againpassworld.trim())){
			request.setAttribute("msg", "两次密码输入不一样");
			return "f:/register.jsp";
		}
		String username = from.getUsername();
		if(userSerice.getByName(username)!=null){
			request.setAttribute("msg","用户已经存在");
			return "f:/register.jsp";
		}
		from.setUid(CommonUtils.uuid());
		from.setCreattime(new Date());
		from.setAdmin(false);
		from.setName(from.getUsername());
		userSerice.add(from);
		return "f:/login.jsp";
	}
	
	
	
	/**
	 * 用户登录
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User from = CommonUtils.toBean(request.getParameterMap(), User.class);
		//System.out.println(from);
		User user = userSerice.getByName(from.getUsername());
		//System.out.println(user);
		if(user==null){
			request.setAttribute("msg", "用户不存在");
			request.setAttribute("user", from);
			return "f:/login.jsp";
		}
		if(!user.getPassworld().trim().equals(from.getPassworld().trim())){
			request.setAttribute("msg", "密码或用户名错误");
			request.setAttribute("user", from);
			return "f:/login.jsp";
		}
		request.getSession().invalidate();
		request.getSession().setAttribute("session_user", user);
		
		return "f:/index.jsp";
	}
	
	
	
	/**
	 * 用户退出
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String quite(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().invalidate();
		return "f:/index.jsp";
		
	}



	
	
	
	

}
