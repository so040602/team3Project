package com.team3.model.bean;

public class Combo05 {
	private String memid; 
	private int cnt;
	
	public Combo05() { }

	public String getMemid() {
		return memid;
	}

	public void setId(String memid) {
		this.memid = memid;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "Combo05 [memid=" + memid + ", cnt=" + cnt + "]";
	}	
}