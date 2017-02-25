package cn.edu.wfu.bbs.user.dao;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.management.RuntimeErrorException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.edu.wfu.bbs.post.domain.Post;
import cn.edu.wfu.bbs.post.domain.PostCustomer;
import cn.edu.wfu.bbs.user.domain.User;
import cn.itcast.jdbc.TxQueryRunner;

public class UserDao {
	private QueryRunner qr = new TxQueryRunner();

	/**
	 * 按照username查询用户
	 * 
	 * @param username
	 * @return
	 */
	public User getByName(String username) {
		try {

			String sql = "select * from user where username=?";
			return qr.query(sql, new BeanHandler<User>(User.class), username);

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 增加用户
	 * 
	 * @param user
	 */
	public void add(User user) {
		try {

			String sql = "insert into user values(?,?,?,?,?,?)";
			Timestamp timestamp = new Timestamp(user.getCreattime().getTime());
			Object[] params = { user.getUid(), user.getUsername(),
					user.getPassworld(), timestamp, user.isAdmin(),
					user.getName() };
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public List<Post> findUserPostById(String uid) {
		try {
			String sql = "select pid,title,content,creattime from post where uid=?";
			List<Post> list = qr.query(sql, new BeanListHandler<Post>(
					Post.class), uid);
			return list;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public User getById(String uid) {
		try {
			String sql = "select * from user where uid=?";
			User user = qr.query(sql, new BeanHandler<User>(User.class), uid);
			return user;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public void changeUserById(User user) {
		try {
			String sql = "update user set username=?,name=?,passworld=? where uid=?";
			qr.update(sql, user.getUsername(), user.getName(),
					user.getPassworld(), user.getUid());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * 查询所有文章
	 * 
	 * @return
	 */
	public List<PostCustomer> findAllPost() {

		try {
			String sql = "select post.title,post.pid,post.content,post.creattime,user.uid,user.name from post,user where post.uid=user.uid";
			List<PostCustomer> list = qr.query(sql,
					new BeanListHandler<PostCustomer>(PostCustomer.class));
			return list;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	/**
	 * 查询所有用户
	 * 
	 * @return
	 */
	public List<User> findAllUser() {

		try {
			String sql = "select * from user";
			List<User> list = qr.query(sql, new BeanListHandler<User>(
					User.class));
			return list;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public void deletePost(String pid) {
		try {
			String sql = "delete from post where pid=?";
			qr.update(sql, pid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void deleteUser(String uid) {
		try {
			String sql = "delete from user where uid=?";
			qr.update(sql, uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public void updateAdmin(String uid,boolean bool) {
		try {
			String sql="update user set admin = ? where uid=?";
			qr.update(sql,bool,uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}

}
