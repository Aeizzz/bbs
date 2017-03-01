package cn.edu.wfu.bbs.user.service;

import java.util.List;

import cn.edu.wfu.bbs.post.domain.Post;
import cn.edu.wfu.bbs.post.domain.PostCustomer;
import cn.edu.wfu.bbs.user.dao.UserDao;
import cn.edu.wfu.bbs.user.domain.User;

public class UserService {
	private UserDao userdao = new UserDao();

	public User getByName(String username) {
		return userdao.getByName(username);
	}

	public void add(User user) {

		userdao.add(user);

	}

	public List<Post> findUserPostById(String uid) {
		return userdao.findUserPostById(uid);
	}

	public User getById(String uid) {
		return userdao.getById(uid);
	}

	public void changeUserById(User user) {
		userdao.changeUserById(user);
	}

	public List<User> findAllUser() {
		return userdao.findAllUser();
	}

	public List<PostCustomer> findAllPost() {
		return userdao.findAllPost();
	}

	public void deletePost(String pid) {
		userdao.deletePost(pid);

	}

	public void deleteUser(String uid) {
		userdao.deleteUser(uid);

	}

	public void updateAdmin(String uid, boolean bool) {
		userdao.updateAdmin(uid, bool);

	}
}
