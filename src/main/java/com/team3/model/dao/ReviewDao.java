package com.team3.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.team3.model.bean.Review;
import com.team3.model.bean.Paging;

public class ReviewDao extends SuperDao {

    public List<Review> selectAllReviews() throws Exception {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT r.reviewidx, r.review_title, r.review_body, r.review_cnt, r.review_regdate, b.book_name, m.memid " +
                     "FROM TEAM3_BOOK_REVIEW r " +
                     "JOIN booklist b ON r.bookidx = b.bookidx " +
                     "JOIN team3_member m ON r.memid = m.memid";

        try (Connection conn = super.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

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
        } catch (Exception ex) {
            ex.printStackTrace();
            throw ex; // 예외 발생 시 상위로 전달
        }

        return reviews;
    }

    public Review selectReviewByIdx(int reviewIdx) throws Exception {
        Review review = null;
        String sql = "SELECT r.reviewidx, r.review_title, r.review_body, r.review_cnt, r.review_regdate, b.book_name, m.memid " +
                     "FROM TEAM3_BOOK_REVIEW r " +
                     "JOIN booklist b ON r.bookidx = b.bookidx " +
                     "JOIN team3_member m ON r.memid = m.memid " +
                     "WHERE r.reviewidx = ?";

        try (Connection conn = super.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, reviewIdx);
            try (ResultSet rs = pstmt.executeQuery()) {
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
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw e; // 예외 발생 시 상위로 전달
        }
        return review;
    }

    public List<Review> getPaginationData(Paging pageInfo) {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT r.reviewidx, r.review_title, r.review_body, r.review_cnt, r.review_regdate, b.book_name, m.memid " +
                     "FROM (SELECT r.reviewidx, r.review_title, r.review_body, r.review_cnt, r.review_regdate, b.book_name, m.memid, " +
                     "ROW_NUMBER() OVER (ORDER BY r.review_regdate DESC) AS ranking " +
                     "FROM TEAM3_BOOK_REVIEW r " +
                     "JOIN booklist b ON r.bookidx = b.bookidx " +
                     "JOIN team3_member m ON r.memid = m.memid) AS ranked_reviews " +
                     "WHERE ranking BETWEEN ? AND ?";

        try (Connection conn = super.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, pageInfo.getBeginRow());
            pstmt.setInt(2, pageInfo.getEndRow());

            try (ResultSet rs = pstmt.executeQuery()) {
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
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return reviews;
    }

    public int getTotalCount() {
        int totalCount = 0;
        String sql = "SELECT COUNT(*) AS total FROM TEAM3_BOOK_REVIEW";

        try (Connection conn = super.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                totalCount = rs.getInt("total");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return totalCount;
    }
}
