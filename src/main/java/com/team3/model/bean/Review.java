package com.team3.model.bean;

import java.sql.Timestamp;

public class Review {
    private int reviewidx; // 서평 번호
    private String review_title; // 서평 제목
    private String review_body; // 서평 내용
    private int review_cnt; // 서평 조회수
    private Timestamp review_regdate;  // 서평 작성일자
    private String book_name; // 책 이름
    private String memid; // 작성자

    // Getters and Setters
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

    public Timestamp getReview_regdate() {
        return review_regdate;
    }

    public void setReview_regdate(Timestamp review_regdate) {
        this.review_regdate = review_regdate;
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
