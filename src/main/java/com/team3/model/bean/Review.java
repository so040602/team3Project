package com.team3.model.bean;

import java.sql.Date;

public class Review {
    private int reviewidx;       // 리뷰 ID
    private String review_title;  // 리뷰 제목
    private String review_body;   // 리뷰 내용
    private int review_cnt;       // 리뷰 조회수
    private Date review_regdate; // 등록 날짜
    private Date review_updated; // 업데이트 날짜
    private int bookidx;          // 도서 ID
    private String book_name;      // 도서 이름
    private String memid;          // 회원 ID

    public Review() {
        // 기본값 설정
        this.review_cnt = 0;
        this.review_regdate = new Date(System.currentTimeMillis());
        this.review_updated = new Date(System.currentTimeMillis());
    }

	public Review(int reviewidx, String review_title, String review_body, int review_cnt, Date review_regdate,
			Date review_updated, int bookidx, String book_name, String memid) {
		super();
		this.reviewidx = reviewidx;
		this.review_title = review_title;
		this.review_body = review_body;
		this.review_cnt = review_cnt;
		this.review_regdate = review_regdate;
		this.review_updated = review_updated;
		this.bookidx = bookidx;
		this.book_name = book_name;
		this.memid = memid;
	}

	@Override
	public String toString() {
		return "Review [reviewidx=" + reviewidx + ", review_title=" + review_title + ", review_body=" + review_body
				+ ", review_cnt=" + review_cnt + ", review_regdate=" + review_regdate + ", review_updated="
				+ review_updated + ", bookidx=" + bookidx + ", book_name=" + book_name + ", memid=" + memid + "]";
	}

	public int getReviewidx() {
		return reviewidx;
	}

	public void setReviewidx(int reviewidx) {
		this.reviewidx = reviewidx;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_body() {
		return review_body;
	}

	public void setReview_body(String review_body) {
		this.review_body = review_body;
	}

	public int getReview_cnt() {
		return review_cnt;
	}

	public void setReview_cnt(int review_cnt) {
		this.review_cnt = review_cnt;
	}

	public Date getReview_regdate() {
		return review_regdate;
	}

	public void setReview_regdate(Date review_regdate) {
		this.review_regdate = review_regdate;
	}

	public Date getReview_updated() {
		return review_updated;
	}

	public void setReview_updated(Date review_updated) {
		this.review_updated = review_updated;
	}

	public int getBookidx() {
		return bookidx;
	}

	public void setBookidx(int bookidx) {
		this.bookidx = bookidx;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getMemid() {
		return memid;
	}

	public void setMemid(String memid) {
		this.memid = memid;
	}

    
}
