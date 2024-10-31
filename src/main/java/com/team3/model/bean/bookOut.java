package com.team3.model.bean;

public class bookOut {
	private int boid;
	private int memidx;
	private int book_idx;
	private String regdate;
	private int oid;
	
	public bookOut() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "bookOut [boid=" + boid + ", memidx=" + memidx + ", book_idx=" + book_idx + ", regdate=" + regdate
				+ ", oid=" + oid + "]";
	}

	public bookOut(int boid, int memidx, int book_idx, String regdate, int oid) {
		super();
		this.boid = boid;
		this.memidx = memidx;
		this.book_idx = book_idx;
		this.regdate = regdate;
		this.oid = oid;
	}

	public int getBoid() {
		return boid;
	}

	public void setBoid(int boid) {
		this.boid = boid;
	}

	public int getMemidx() {
		return memidx;
	}

	public void setMemidx(int memidx) {
		this.memidx = memidx;
	}

	public int getBook_idx() {
		return book_idx;
	}

	public void setBook_idx(int book_idx) {
		this.book_idx = book_idx;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}
	
	

}
