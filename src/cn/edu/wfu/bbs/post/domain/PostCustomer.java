package cn.edu.wfu.bbs.post.domain;

public class PostCustomer extends Post {
	private String username;
	private String uid;
	private String name;

	@Override
	public String toString() {
		return "PostCustomer [username=" + username + ", uid=" + uid
				+ ", name=" + name + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}
