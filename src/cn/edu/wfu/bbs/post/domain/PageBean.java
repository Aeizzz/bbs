package cn.edu.wfu.bbs.post.domain;

import java.util.List;

public class PageBean<T> {
	private int pc;//当前页码
	private int tp;//总页数
	private int tr;//总记录数
	private int ps;//每页记录数
	private List<T> beanList;
	public int getPc() {
		return pc;
	}
	public void setPc(int pc) {
		this.pc = pc;
	}
	public int getTp() {
		int tp;
		if(tr%ps==0){
			tp=tr/ps;
		}else{
			tp=tr/ps+1;
		}
		
		return tp;
	}
	
	
	public void setTp(int tp) {
		this.tp = tp;
	}
	@Override
	public String toString() {
		return "PageBean [pc=" + pc + ", tr=" + tr + ", ps=" + ps
				+ ", beanList=" + beanList + "]";
	}
	public int getTr() {
		return tr;
	}
	public void setTr(int tr) {
		this.tr = tr;
	}
	public int getPs() {
		return ps;
	}
	public void setPs(int ps) {
		this.ps = ps;
	}
	public List<T> getBeanList() {
		return beanList;
	}
	public void setBeanList(List<T> beanList) {
		this.beanList = beanList;
	}
	

}
