package cn.edu.wfu.bbs.post.service;

import java.util.List;

import cn.edu.wfu.bbs.post.dao.PostDao;
import cn.edu.wfu.bbs.post.domain.Post;
import cn.edu.wfu.bbs.post.domain.PostCustomer;

public class PostService {
	private PostDao postDao = new PostDao();

	public void addPost(Post post) {
		postDao.addPost(post);
		
	}

	public int getcount() {
		return postDao.getcount();
	}

	public List<PostCustomer> getByPost(int x,int y) {
		return postDao.getBypost(x, y);
		
	}

	public PostCustomer findPostById(String pid) {
		return postDao.findPostById(pid);
	}

	public List<PostCustomer> searchByTitle(String search) {
		return postDao.searchByTitle(search);
	}

	public int searchcount(String search) {
		return postDao.searchcount(search);
	}

	public void updatePost(Post post) {
		postDao.updatePost(post);
		
	}

	public void delete(String pid) {
		postDao.delete(pid);
		
	}
	

}
