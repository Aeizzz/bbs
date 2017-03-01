package cn.edu.wfu.bbs.post.dao;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;






import cn.edu.wfu.bbs.post.domain.Post;
import cn.edu.wfu.bbs.post.domain.PostCustomer;
import cn.itcast.jdbc.TxQueryRunner;

public class PostDao {
	private QueryRunner qr = new TxQueryRunner();

	public void addPost(Post post) {
		String sql = "insert into post values(?,?,?,?,?)";
		Timestamp timestamp = new Timestamp(post.getCreattime().getTime());
		Object [] parems={post.getPid(),post.getTitle(),post.getContent(),timestamp,post.getUser().getUid()};
		try {
			qr.update(sql,parems);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	public int getcount(){
		try {
			String sql="select count(*) from post";
			Number sum=(Number) qr.query(sql,new ScalarHandler());
			return sum.intValue();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	
	public List<PostCustomer> getBypost(int x,int y){
		
		try {
			String sql="select post.pid,post.title,user.username,user.name,post.creattime,post.uid from post,user where post.uid=user.uid ORDER BY creattime desc limit ?,? ";
			List<PostCustomer> list;
			list = qr.query(sql, new BeanListHandler<PostCustomer>(PostCustomer.class),x,y);
			return list;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public PostCustomer findPostById(String pid) {
		try {
			String sql = "SELECT post.pid,post.title,post.content,post.creattime,post.uid,user.username,user.name FROM post,user WHERE post.uid=user.uid AND pid =?";
			PostCustomer post = qr.query(sql,  new BeanHandler<PostCustomer>(PostCustomer.class),pid);
			return post;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public List<PostCustomer> searchByTitle(String search) {
		try {
			String sql = "SELECT post.pid,post.title,post.uid,user.username,post.content,user.name FROM post,user WHERE post.uid=user.uid AND (title LIKE  ? OR content LIKE ? )";
			search = "%"+search+"%";
			List<PostCustomer> list = qr.query(sql, new BeanListHandler<PostCustomer>(PostCustomer.class),search,search);
			return list;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	
	}
	
	
	public int searchcount(String search) {
		try {
			String sql = "SELECT count(*) FROM post WHERE title LIKE  ? OR content LIKE ? ";
			search = "%"+search+"%";
			Number number = (Number) qr.query(sql, new ScalarHandler(),search,search);
			return number.intValue();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	
	}
	public void updatePost(Post post) {
		try {
			String sql = "update post set title=?,content=? where pid=?";
			qr.update(sql, post.getTitle(),post.getContent(),post.getPid());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	public void delete(String pid) {
		try {
			String sql = "delete from post where pid=?";
			qr.update(sql,pid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	
	
	
	

}
