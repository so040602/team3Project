package com.team3.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.team3.model.bean.Review;

public class ReviewDao extends SuperDao {

    public List<Review> selectAllReviews() {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT r.reviewidx, r.review_title, r.review_body, r.review_cnt, " +
                    "r.review_regdate, b.book_name, m.memid " +
                    "FROM TEAM3_BOOK_REVIEW r " +
                    "LEFT JOIN booklist b ON r.bookidx = b.book_idx " +
                    "LEFT JOIN team3_member m ON r.memid = m.memid " +
                    "ORDER BY r.review_regdate DESC";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = super.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Review review = new Review();
                review.setReviewidx(rs.getInt("reviewidx"));
                review.setReview_title(rs.getString("review_title"));
                review.setReview_body(rs.getString("review_body"));
                review.setReview_cnt(rs.getInt("review_cnt"));
                review.setReview_regdate(rs.getTimestamp("review_regdate"));
                review.setBook_name(rs.getString("book_name"));
                review.setMemid(rs.getString("memid"));
                reviews.add(review);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 

        return reviews;
    }

    public Review selectReviewById(int reviewIdx) {
        Review review = null;
        String sql = "SELECT r.reviewidx, r.review_title, r.review_body, r.review_cnt, " +
                    "r.review_regdate, b.book_name, m.memid " +
                    "FROM TEAM3_BOOK_REVIEW r " +
                    "LEFT JOIN booklist b ON r.bookidx = b.book_idx " +
                    "LEFT JOIN team3_member m ON r.memid = m.memid " +
                    "WHERE r.reviewidx = ?";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = super.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, reviewIdx);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                review = new Review();
                review.setReviewidx(rs.getInt("reviewidx"));
                review.setReview_title(rs.getString("review_title"));
                review.setReview_body(rs.getString("review_body"));
                review.setReview_cnt(rs.getInt("review_cnt"));
                review.setReview_regdate(rs.getTimestamp("review_regdate"));
                review.setBook_name(rs.getString("book_name"));
                review.setMemid(rs.getString("memid"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 

        return review;
    }

    public void incrementReviewViews(int reviewIdx) {
        String sql = "UPDATE TEAM3_BOOK_REVIEW SET review_cnt = review_cnt + 1 WHERE reviewidx = ?";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = super.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, reviewIdx);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean insertReview(Review review) {
        boolean result = false;
        String sql = "INSERT INTO TEAM3_BOOK_REVIEW (review_title, review_body, memid, review_regdate) " +
                    "VALUES (?, ?, ?, now())";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = super.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, review.getReview_title());
            pstmt.setString(2, review.getReview_body());
            pstmt.setString(3, review.getMemid());

            int count = pstmt.executeUpdate();
            result = count > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return result;
    }

    public boolean updateReview(Review review) {
        boolean result = false;
        String sql = "UPDATE TEAM3_BOOK_REVIEW SET review_title = ?, review_body = ? WHERE reviewidx = ?";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = super.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, review.getReview_title());
            pstmt.setString(2, review.getReview_body());
            pstmt.setInt(3, review.getReviewidx());

            int count = pstmt.executeUpdate();
            result = count > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        

        return result;
    }

    public boolean deleteReview(int reviewIdx) {
        boolean result = false;
        String sql = "DELETE FROM TEAM3_BOOK_REVIEW WHERE reviewidx = ?";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = super.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, reviewIdx);

            int count = pstmt.executeUpdate();
            result = count > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}