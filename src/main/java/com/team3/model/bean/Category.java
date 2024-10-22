package com.team3.model.bean;

public class Category {
	private String module ;
	private String usetype ;
	private int ordering ;
	private String engname ;
	private String korname ;
	
	public Category() { }
	
	public Category(String module, String usetype, int ordering, String engname, String korname) {
		super();
		this.module = module;
		this.usetype = usetype;
		this.ordering = ordering;
		this.engname = engname;
		this.korname = korname;
	}
	
	@Override
	public String toString() {
		return "Category [module=" + module + ", usetype=" + usetype + ", ordering=" + ordering + ", engname=" + engname
				+ ", korname=" + korname + "]";
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	public String getUsetype() {
		return usetype;
	}
	public void setUsetype(String usetype) {
		this.usetype = usetype;
	}
	public int getOrdering() {
		return ordering;
	}
	public void setOrdering(int ordering) {
		this.ordering = ordering;
	}
	public String getEngname() {
		return engname;
	}
	public void setEngname(String engname) {
		this.engname = engname;
	}
	public String getKorname() {
		return korname;
	}
	public void setKorname(String korname) {
		this.korname = korname;
	}
	
	
}
