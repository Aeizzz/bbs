package cn.edu.wfu.bbs.user.domain;

import java.util.Date;


//用户信息
public class User {
	private String uid;
	private String name;
	private String username;
	private String passworld;
	private Date creattime;
	private boolean admin;

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
	public String getPassworld() {
		return passworld;
	}
	public void setPassworld(String passworld) {
		this.passworld = passworld;
	}
	public Date getCreattime() {
		return creattime;
	}
	public void setCreattime(Date creattime) {
		this.creattime = creattime;
	}
	public boolean isAdmin() {
		return admin;
	}
	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", name=" + name + ", username=" + username
				+ ", passworld=" + passworld + ", creattime=" + creattime
				+ ", admin=" + admin + "]";
	}
	
	

}
