package com.team3.model.bean;

public class Book {
	private int book_idx; //도서번호
	private String book_name; //도서 제목
	private int price; //가격
	private String category; // 도서 카테고리
	private float rating; //평점
	private	String date; //출판일자
	private String person_name; //저자
	private String publisher; //출판사
	private String img; // 도서 이미지
	private String description; // 도서 내용
		
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Book [book_idx=" + book_idx + ", book_name=" + book_name + ", price=" + price + ", category=" + category
				+ ", rating=" + rating + ", date=" + date + ", person_name=" + person_name + ", publisher=" + publisher
				+ ", img=" + img + ", description=" + description + "]";
	}

	public Book(int book_idx, String book_name, int price, String category, float rating, String date, String person_name,
			String publisher, String img, String description) {
		super();
		this.book_idx = book_idx;
		this.book_name = book_name;
		this.price = price;
		this.category = category;
		this.rating = rating;
		this.date = date;
		this.person_name = person_name;
		this.publisher = publisher;
		this.img = img;
		this.description = description;
	}

	public int getbook_idx() {
		return book_idx;
	}

	public void setbook_idx(int book_idx) {
		this.book_idx = book_idx;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
}
