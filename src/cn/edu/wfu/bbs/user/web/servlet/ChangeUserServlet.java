package cn.edu.wfu.bbs.user.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.wfu.bbs.post.domain.Post;
import cn.edu.wfu.bbs.user.domain.User;
import cn.edu.wfu.bbs.user.service.UserService;
import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class ChangeUserServlet extends BaseServlet {
	private UserService userService = new  UserService();
	
	/**
	 * 获取用户文章
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findUserPostById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("session_user");
		String uid = user.getUid();
		List<Post> list =  userService.findUserPostById(uid);
		request.setAttribute("postList", list);
		return "f:/user.jsp";
	}
	
	
	/**
	 * 修改信息预备
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String changeUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("session_user");
		request.setAttribute("user",user);
		return "f:/changeuser.jsp";
	}
	
	/**
	 * 正式修改信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public String changeload(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = CommonUtils.toBean(request.getParameterMap(),User.class);
		User u = userService.getByName(user.getName());
		if(u!=null){
			request.setAttribute("msg","已存在用户名，请重新输入");
			return "f:/changeuser.jsp";
		}
		//的到当前用户的user
		User user1 = (User) request.getSession().getAttribute("session_user");
		
		user.setUid(user1.getUid());
		if(user.getUsername()==null||user.getUsername().trim().equals("")){
			user.setUsername(user1.getUsername());
		}
		if(user.getPassworld()==null||user.getPassworld().trim().equals("")){
			user.setPassworld(user1.getPassworld());
		}
		if(user.getName()==null||user.getName().trim().equals("")){
			user.setName(user1.getName());
		}
		userService.changeUserById(user);
		User user2 = userService.getById(user1.getUid());
		request.getSession().invalidate();
		request.getSession().setAttribute("session_user",user2);
		return "f:/index.jsp";
		
	}
	

}
