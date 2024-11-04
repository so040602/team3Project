package com.team3.model.bean;

public class BookOutCur {
	private int book_idx;
	private String book_name;
	private String category;
	private String person_name;
	private String publisher;
	private String img;
	private String date;
	private int memidx;
	private String memname;
	private String regdate;
	
	public BookOutCur() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookOutCur(int book_idx, String book_name, String category, String person_name, String publisher, String img, String date,
			int memidx, String memname, String regdate) {
		super();
		this.book_idx = book_idx;
		this.book_name = book_name;
		this.category = category;
		this.person_name = person_name;
		this.publisher = publisher;
		this.img = img;
		this.date = date;
		this.memidx = memidx;
		this.memname = memname;
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "BookOutCur [book_idx=" + book_idx + ", book_name=" + book_name + ", category=" + category
				+ ", person_name=" + person_name + ", publisher=" + publisher + ", img=" + img + ", date=" + date
				+ ", memidx=" + memidx + ", memname=" + memname + ", regdate=" + regdate + "]";
	}
		
	public int getBook_idx() {
		return book_idx;
	}

	public void setBook_idx(int book_idx) {
		this.book_idx = book_idx;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	
}
