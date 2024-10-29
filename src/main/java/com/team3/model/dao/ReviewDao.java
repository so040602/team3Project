package com.team3.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.team3.model.bean.Review;

public class ReviewDao extends SuperDao{
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public List<Review> selectAllReviews() {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT r.*, b.book_name " +
                     "FROM TEAM3_BOOK_REVIEW r " +
                     "JOIN booklist b ON r.bookIdx = b.bookIdx " +
                     "ORDER BY r.reviewIdx DESC";

        try {
            conn = super.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Review review = new Review();
                review.setReviewIdx(rs.getInt("reviewIdx"));
                review.setBookIdx(rs.getInt("bookIdx"));
                review.setMemId(rs.getString("memId"));
                review.setReviewTitle(rs.getString("reviewTitle"));
                review.setReviewBody(rs.getString("reviewBody"));
                review.setReviewCnt(rs.getInt("reviewCnt"));
                review.setReviewRegDate(rs.getDate("reviewRegDate"));
                review.setReviewUpdated(rs.getDate("reviewUpdated"));
                review.setBook_name(rs.getString("book_name"));
                reviews.add(review);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

        return reviews;
    }

    public Review selectReviewByIdx(int reviewIdx) {
        Review review = null;
        String sql = "SELECT r.*, b.book_name " +
                     "FROM TEAM3_BOOK_REVIEW r " +
                     "JOIN booklist b ON r.bookIdx = b.bookIdx " +
                     "WHERE r.reviewIdx = ?";

        try {
            conn = super.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, reviewIdx);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                review = new Review();
                review.setReviewIdx(rs.getInt("reviewIdx"));
                review.setBookIdx(rs.getInt("bookIdx"));
                review.setMemId(rs.getString("memId"));
                review.setReviewTitle(rs.getString("reviewTitle"));
                review.setReviewBody(rs.getString("reviewBody"));
                review.setReviewCnt(rs.getInt("reviewCnt"));
                review.setReviewRegDate(rs.getDate("reviewRegDate"));
                review.setReviewUpdated(rs.getDate("reviewUpdated"));
                review.setBook_name(rs.getString("book_name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

        return review;
    }
}