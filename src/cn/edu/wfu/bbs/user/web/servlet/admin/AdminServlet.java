package cn.edu.wfu.bbs.user.web.servlet.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.wfu.bbs.post.domain.PostCustomer;
import cn.edu.wfu.bbs.user.domain.User;
import cn.edu.wfu.bbs.user.service.UserService;
import cn.itcast.servlet.BaseServlet;

public class AdminServlet extends BaseServlet {
	private UserService userService = new UserService();

	/**
	 * 查询所有用户
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAll(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<PostCustomer> postList =  userService.findAllPost();
		List<User> userList =  userService.findAllUser();
		request.setAttribute("PostList", postList);
		request.setAttribute("UserList", userList);
		return "f:/admin/admin.jsp";
	}
	
	
	/**
	 * 删除文章
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String deletePost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pid = request.getParameter("pid");
		userService.deletePost(pid);
		return "r:/servlet/AdminServlet?method=findAll";
	}
	
	
	/**
	 * 删除用户
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String deleteUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uid = request.getParameter("uid");
		userService.deleteUser(uid);
		return "r:/servlet/AdminServlet?method=findAll";
	}
	
	/**
	 * 设置管理员
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String updateAdmin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uid = request.getParameter("uid");
		User user = userService.getById(uid);
		boolean bool = user.isAdmin();
		userService.updateAdmin(uid,!bool);
		return "r:/servlet/AdminServlet?method=findAll";
	}
	
	
	

}
