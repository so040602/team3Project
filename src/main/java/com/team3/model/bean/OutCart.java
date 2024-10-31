package com.team3.model.bean;

public class OutCart {
	private int oid;
	private int memidx;
	private String memname;
	private int book_idx;
	private String regdate;
	private String book_name;
	private String category;
	private String person_name;
	private String publisher;
	private String img;
	private String checkout;
	private String date;
			
	public OutCart() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "OutCart [oid=" + oid + ", memidx=" + memidx + ", memname=" + memname + ", book_idx=" + book_idx
				+ ", regdate=" + regdate + ", book_name=" + book_name + ", category=" + category + ", person_name="
				+ person_name + ", publisher=" + publisher + ", img=" + img + ", checkout=" + checkout + ", date="
				+ date + "]";
	}

	public OutCart(int oid, int memidx, String memname, int book_idx, String regdate, String book_name, String category,
			String person_name, String publisher, String img, String checkout, String date) {
		super();
		this.oid = oid;
		this.memidx = memidx;
		this.memname = memname;
		this.book_idx = book_idx;
		this.regdate = regdate;
		this.book_name = book_name;
		this.category = category;
		this.person_name = person_name;
		this.publisher = publisher;
		this.img = img;
		this.checkout = checkout;
		this.date = date;
	}

	
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public int getMemidx() {
		return memidx;
	}

	public void setMemidx(int memidx) {
		this.memidx = memidx;
	}

	public String getMemname() {
		return memname;
	}

	public void setMemname(String memname) {
		this.memname = memname;
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

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPerson_name() {
		return person_name;
	}

	public void setPerson_name(String person_name) {
		this.person_name = person_name;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}			
}
