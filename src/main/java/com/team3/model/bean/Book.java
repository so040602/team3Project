package com.team3.model.bean;

public class Book {
	private int cnt;
	private String name;
	private int price;
	private String category;
	private float rating;
	private	String data;
	private String img;
	private String description;
		
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
