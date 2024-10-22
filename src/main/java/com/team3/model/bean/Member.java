package com.team3.model.bean;

public class Member {
	private int memidx;
	private String memid;
	private String mempwd;
	private String memname;
	private String gender;
	private String birth; // 생일(날짜 형식)
	private String email;
	private String mobile;
	private String addr01;
	private String addr02;
	private String remark;
	private int mpoint;
	private int logcnt;
	private int dropout;
	private String regdate; // 날짜 형식	
	private String updated; // 날짜 형식	
	

	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(int memidx, String memid, String mempwd, String memname, String gender, String birth, String email,
			String mobile, String addr01, String addr02, String remark, int mpoint, int logcnt, int dropout,
			String regdate, String updated) {
		super();
		this.memidx = memidx;
		this.memid = memid;
		this.mempwd = mempwd;
		this.memname = memname;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
		this.mobile = mobile;
		this.addr01 = addr01;
		this.addr02 = addr02;
		this.remark = remark;
		this.mpoint = mpoint;
		this.logcnt = logcnt;
		this.dropout = dropout;
		this.regdate = regdate;
		this.updated = updated;
	}


	public int getMemidx() {
		return memidx;
	}


	public void setMemidx(int memidx) {
		this.memidx = memidx;
	}


	public String getMemid() {
		return memid;
	}


	public void setMemid(String memid) {
		this.memid = memid;
	}


	public String getMempwd() {
		return mempwd;
	}


	public void setMempwd(String mempwd) {
		this.mempwd = mempwd;
	}


	public String getMemname() {
		return memname;
	}


	public void setMemname(String memname) {
		this.memname = memname;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getBirth() {
		return birth;
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getMobile() {
		return mobile;
	}


	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	public String getAddr01() {
		return addr01;
	}


	public void setAddr01(String addr01) {
		this.addr01 = addr01;
	}


	public String getAddr02() {
		return addr02;
	}


	public void setAddr02(String addr02) {
		this.addr02 = addr02;
	}


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}


	public int getMpoint() {
		return mpoint;
	}


	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}


	public int getLogcnt() {
		return logcnt;
	}


	public void setLogcnt(int logcnt) {
		this.logcnt = logcnt;
	}


	public int getDropout() {
		return dropout;
	}


	public void setDropout(int dropout) {
		this.dropout = dropout;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public String getUpdated() {
		return updated;
	}


	public void setUpdated(String updated) {
		this.updated = updated;
	}


	@Override
	public String toString() {
		return "Member [memidx=" + memidx + ", memid=" + memid + ", mempwd=" + mempwd + ", memname=" + memname
				+ ", gender=" + gender + ", birth=" + birth + ", email=" + email + ", mobile=" + mobile + ", addr01="
				+ addr01 + ", addr02=" + addr02 + ", remark=" + remark + ", mpoint=" + mpoint + ", logcnt=" + logcnt
				+ ", dropout=" + dropout + ", regdate=" + regdate + ", updated=" + updated + "]";
	}
	
	
}
