package com.team3.model.bean;

public class OrderDetail {
	private int odid ;
	private int oid ;
	private int pnum ;
	private int qty ;
		

	@Override
	public String toString() {
		return "OrderDetail [odid=" + odid + ", oid=" + oid + ", pnum=" + pnum + ", qty=" + qty + "]";
	}

	public int getOdid() {
		return odid;
	}

	public void setOdid(int odid) {
		this.odid = odid;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public OrderDetail() {
	
	}

	public OrderDetail(int odid, int oid, int pnum, int qty) {
		super();
		this.odid = odid;
		this.oid = oid;
		this.pnum = pnum;
		this.qty = qty;
	}
	
	
}
