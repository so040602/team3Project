package com.team3.model.bean;

import java.sql.Date;

public class Review {
	    private int reviewIdx; // 리뷰 번호
	    private Integer bookIdx; // 도서번호(booklist 테이블 primary key값)
	    private String memId; // 아이디 (member 테이블에서 가져온 아이디)
	    private String reviewTitle; // 서평 제목
	    private String reviewBody; // 서평 내용
	    private int reviewCnt; // 서평 조회수
	    private Date reviewRegDate; // 서평 작성일자
	    private Date reviewUpdated; // 서평 수정일자
	    private String book_name; // 책 이름(bookIdx 통해 booklist 테이블에서 가져온 책이름
		
	    public Review() {
			// TODO Auto-generated constructor stub
		}
	    
	    public Review(int reviewIdx, Integer bookIdx, String memId, String reviewTitle, String reviewBody,
				int reviewCnt, Date reviewRegDate, Date reviewUpdated, String book_name) {
			super();
			this.reviewIdx = reviewIdx;
			this.bookIdx = bookIdx;
			this.memId = memId;
			this.reviewTitle = reviewTitle;
			this.reviewBody = reviewBody;
			this.reviewCnt = reviewCnt;
			this.reviewRegDate = reviewRegDate;
			this.reviewUpdated = reviewUpdated;
			this.book_name = book_name;
		}

		@Override
		public String toString() {
			return "Review [reviewIdx=" + reviewIdx + ", bookIdx=" + bookIdx + ", memId=" + memId + ", reviewTitle="
					+ reviewTitle + ", reviewBody=" + reviewBody + ", reviewCnt=" + reviewCnt + ", reviewRegDate="
					+ reviewRegDate + ", reviewUpdated=" + reviewUpdated + ", book_name=" + book_name + "]";
		}

		public int getReviewIdx() {
			return reviewIdx;
		}

		public void setReviewIdx(int reviewIdx) {
			this.reviewIdx = reviewIdx;
		}

		public Integer getBookIdx() {
			return bookIdx;
		}

		public void setBookIdx(Integer bookIdx) {
			this.bookIdx = bookIdx;
		}

		public String getMemId() {
			return memId;
		}

		public void setMemId(String memId) {
			this.memId = memId;
		}

		public String getReviewTitle() {
			return reviewTitle;
		}

		public void setReviewTitle(String reviewTitle) {
			this.reviewTitle = reviewTitle;
		}

		public String getReviewBody() {
			return reviewBody;
		}

		public void setReviewBody(String reviewBody) {
			this.reviewBody = reviewBody;
		}

		public int getReviewCnt() {
			return reviewCnt;
		}

		public void setReviewCnt(int reviewCnt) {
			this.reviewCnt = reviewCnt;
		}

		public Date getReviewRegDate() {
			return reviewRegDate;
		}

		public void setReviewRegDate(Date reviewRegDate) {
			this.reviewRegDate = reviewRegDate;
		}

		public Date getReviewUpdated() {
			return reviewUpdated;
		}

		public void setReviewUpdated(Date reviewUpdated) {
			this.reviewUpdated = reviewUpdated;
		}

		public String getBook_name() {
			return book_name;
		}

		public void setBook_name(String book_name) {
			this.book_name = book_name;
		}
	    
	    
	    
	    
	    
}
