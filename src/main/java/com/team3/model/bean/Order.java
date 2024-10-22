package com.team3.model.bean;

public class Order { // 주문(구매)
	private int oid ;
	private String id ;
	private String orderdate ;
	
	public Order() {
	
	}	
	

	public Order(int oid, String id, String orderdate) {
		super();
		this.oid = oid;
		this.id = id;
		this.orderdate = orderdate;
	}


	@Override
	public String toString() {
		return "Order [oid=" + oid + ", id=" + id + ", orderdate=" + orderdate + "]";
	}



	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	
	
}