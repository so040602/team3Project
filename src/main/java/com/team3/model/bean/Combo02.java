package com.team3.model.bean;

public class Combo02 {
	private String memname ;
	private int cnt ;
	
	public Combo02() {}

	public Combo02(String memname, int cnt) {
		super();
		this.memname = memname;
		this.cnt = cnt;
	}

	public String getMemname() {
		return memname;
	}

	public void setMemname(String memname) {
		this.memname = memname;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "Combo02 [memname=" + memname + ", cnt=" + cnt + "]";
	}

	
}
