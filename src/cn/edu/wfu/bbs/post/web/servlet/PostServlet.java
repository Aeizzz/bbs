package cn.edu.wfu.bbs.post.web.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.wfu.bbs.post.domain.PageBean;
import cn.edu.wfu.bbs.post.domain.Post;
import cn.edu.wfu.bbs.post.domain.PostCustomer;
import cn.edu.wfu.bbs.post.service.PostService;
import cn.edu.wfu.bbs.user.domain.User;
import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class PostServlet extends BaseServlet {
	private PostService postService = new PostService();
	
	
	

	
	/**
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int count = postService.getcount();
		PageBean pageBean = new PageBean<Post>();
		//第几页
		String page1=request.getParameter("page");
		if(page1==null){
			pageBean.setPc(1);
		}else{
			int page = Integer.parseInt(request.getParameter("page"));
			pageBean.setPc(page);
		}
		
		//总记录数
		pageBean.setTr(postService.getcount());
		//每页的记录数
		pageBean.setPs(10);
		pageBean.setTp(pageBean.getTp());
		//每页的数据(偏移量，条数)
		pageBean.setBeanList(postService.getByPost((pageBean.getPc()-1)*pageBean.getPs(),pageBean.getPs()));
		//System.out.println(pageBean.toString());
		request.setAttribute("pageBean", pageBean);
		return "f:/main.jsp";
	}
	
	
	public String findPostById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pid = request.getParameter("pid");
		PostCustomer post= postService.findPostById(pid);
		request.setAttribute("post", post);
		return "f:/article.jsp";
	}
	
	
	/**
	 * 查找文章
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String searchpost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String search = request.getParameter("search");
		@SuppressWarnings("unchecked")
		List<PostCustomer> list = postService.searchByTitle(search);
		int count = postService.searchcount(search);
		request.setAttribute("postlist", list);
		request.setAttribute("search", search);
		request.setAttribute("count", count);
		return "f:/search.jsp";
	}
	
	
	
	
	
	
	
}
