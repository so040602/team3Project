package com.team3.model.bean;

public class Combo01 {
	private String memname ;
	private String subtitle ;
	private String contents ;
	private String regdate ;
	
	public Combo01() {}
	
	public Combo01(String memname, String subtitle, String contents, String regdate) {
		super();
		this.memname = memname;
		this.subtitle = subtitle;
		this.contents = contents;
		this.regdate = regdate;
	}

	public String getMemname() {
		return memname;
	}

	public void setMemname(String memname) {
		this.memname = memname;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Combo01 [memname=" + memname + ", subtitle=" + subtitle + ", contents=" + contents + ", regdate="
				+ regdate + "]";
	}
	
	
}
