package com.team3.model.bean;

public class Combo03 {
	private String mname ; // 사람 이름  
	private String pname ; // 상품 이름
	private String orderdate ; // 주문 일자
	private int qty; // 구매 수량
	private int price; // 가격
	private int amount; // 금액
	
	public Combo03() {}

	@Override
	public String toString() {
		return "Combo03 [mname=" + mname + ", pname=" + pname + ", orderdate=" + orderdate + ", qty=" + qty + ", price="
				+ price + ", amount=" + amount + "]";
	}

	public String getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	
}