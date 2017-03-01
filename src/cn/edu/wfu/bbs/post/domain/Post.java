package cn.edu.wfu.bbs.post.domain;

import java.util.Date;

import cn.edu.wfu.bbs.user.domain.User;

public class Post {
	private String pid;
	private String title;
	private String content;
	private Date creattime;
	private User user;

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreattime() {
		return creattime;
	}

	public void setCreattime(Date creattime) {
		this.creattime = creattime;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Post [pid=" + pid + ", title=" + title + ", content=" + content
				+ ", creattime=" + creattime + ", user=" + user + "]";
	}

}
