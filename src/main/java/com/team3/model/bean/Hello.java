package com.team3.model.bean;

public class Hello {
	private String memid ;
	private String memname ;
	private int age ;
	private String hobby ;
	
	public Hello() {}

	public Hello(String memid, String memname, int age, String hobby) {
		super();
		this.memid = memid;
		this.memname = memname;
		this.age = age;
		this.hobby = hobby;
	}

	public String getMemid() {
		return memid;
	}

	public void setMemid(String memid) {
		this.memid = memid;
	}

	public String getMemname() {
		return memname;
	}

	public void setMemname(String memname) {
		this.memname = memname;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	@Override
	public String toString() {
		return "Hello [memid=" + memid + ", memname=" + memname + ", age=" + age + ", hobby=" + hobby + "]";
	}

	
}
