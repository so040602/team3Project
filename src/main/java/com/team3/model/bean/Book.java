package com.team3.model.bean;

public class Book {
	private int cnt; //도서번호
	private String name; //도서 제목
	private int price; //가격
	private String category; // 도서 카테고리
	private float rating; //평점
	private	String data; //출판일자
	private String img; // 도서 이미지
	private String description; // 도서 내용
		
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Book(int cnt, String name, int price, String category, float rating, String data, String img,
			String description) {
		super();
		this.cnt = cnt;
		this.name = name;
		this.price = price;
		this.category = category;
		this.rating = rating;
		this.data = data;
		this.img = img;
		this.description = description;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
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
