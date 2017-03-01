package cn.edu.wfu.bbs.post.web.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.wfu.bbs.post.domain.Post;
import cn.edu.wfu.bbs.post.domain.PostCustomer;
import cn.edu.wfu.bbs.post.service.PostService;
import cn.edu.wfu.bbs.user.domain.User;
import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class EditPostServlet extends BaseServlet {
	private  PostService postService = new PostService();
	
	
	/**
	 * 发布文章
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Post post = CommonUtils.toBean(request.getParameterMap(), Post.class);
		if ((post.getTitle().trim() == null || post.getTitle().trim()
				.equals(""))
				&& (post.getContent().trim() == null || post.getContent()
						.trim().equals(""))) {
			request.setAttribute("msg", "请输入文章内容和标题");
			return "f:/edit.jsp";
		}
		if (post.getTitle().trim() == null || post.getTitle().trim().equals("")) {
			request.setAttribute("msg", "请输入文章标题");
			request.setAttribute("post", post);
			return "f:/edit.jsp";
		}
		if (post.getContent().trim() == null
				|| post.getContent().trim().equals("")) {
			request.setAttribute("msg", "请输入文章内容");
			request.setAttribute("post", post);
			return "f:/edit.jsp";
		}
		post.setCreattime(new Date());
		post.setPid(CommonUtils.uuid());
		User user = (User) request.getSession().getAttribute("session_user");
		post.setUser(user);
		postService.addPost(post);
		
		return "f:/index.jsp";
	}
	
	/**
	 * 修改文章
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String changepost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pid= request.getParameter("pid");
		PostCustomer postCustomer = postService.findPostById(pid);
		request.setAttribute("post", postCustomer);
		return "f:/changepost.jsp";
	}
	
	
	/**
	 * 更新文章
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String updatePost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Post post = CommonUtils.toBean(request.getParameterMap(), Post.class);
		String pid = request.getParameter("pid");
		if ((post.getTitle().trim() == null || post.getTitle().trim()
				.equals(""))
				&& (post.getContent().trim() == null || post.getContent()
						.trim().equals(""))) {
			request.setAttribute("msg", "请输入文章内容和标题");
			return "f:/changepost.jsp";
		}
		if (post.getTitle().trim() == null || post.getTitle().trim().equals("")) {
			request.setAttribute("msg", "请输入文章标题");
			request.setAttribute("post", post);
			return "f:/changepost.jsp";
		}
		if (post.getContent().trim() == null
				|| post.getContent().trim().equals("")) {
			request.setAttribute("msg", "请输入文章内容");
			request.setAttribute("post", post);
			return "f:/changepost.jsp";
		}
		post.setPid(pid);
		postService.updatePost(post);
		PostCustomer postCustomer = postService.findPostById(pid);
		request.setAttribute("post", postCustomer);
		
		return "f:/article.jsp";
		
	}
	
	/**
	 * 删除文章
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public String delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pid = request.getParameter("pid");
		PostCustomer postCustomer = postService.findPostById(pid);
		User u = (User) request.getSession().getAttribute("session_user");
		
		if(!postCustomer.getUid().trim().equals(u.getUid().trim())){
			request.setAttribute("msg", "请重新登录，你不能删除不是自己的文章");
			request.getSession().invalidate();
			return "f:/login.jsp";
		}
		postService.delete(pid);
		return "f:/index.jsp";
	}
	
	

}
