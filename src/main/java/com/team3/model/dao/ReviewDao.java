package com.team3.model.dao;

import com.team3.model.bean.Review;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDao extends SuperDao {
    
    private static final String SELECT_BASE = 
        "SELECT r.reviewidx, r.review_title, r.review_body, r.review_cnt, " +
        "r.review_regdate, r.review_updated, r.bookidx, b.book_name, m.memid " +
        "FROM TEAM3_BOOK_REVIEW r " +
        "LEFT JOIN booklist b ON r.bookidx = b.book_idx " +
        "LEFT JOIN team3_member m ON r.memid = m.memid";
    
    // 리뷰 목록 조회
    public List<Review> list() {
        List<Review> reviews = new ArrayList<>();
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SELECT_BASE);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                reviews.add(createReviewFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // 로깅 추가 고려
        }
        return reviews;
    }

    public Review getReviewWithIncrementViewCount(int reviewidx, boolean shouldIncrement) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Review review = null;
        
        try {
            conn = getConnection();
            conn.setAutoCommit(false); // 트랜잭션 시작
            
            // 조회수 증가가 필요한 경우에만 수행
            if (shouldIncrement) {
                String updateSql = "UPDATE TEAM3_BOOK_REVIEW SET review_cnt = review_cnt + 1 WHERE reviewidx = ?";
                pstmt = conn.prepareStatement(updateSql);
                pstmt.setInt(1, reviewidx);
                pstmt.executeUpdate();
            }
            
            // 최신 리뷰 정보 조회
            String selectSql = SELECT_BASE + " WHERE r.reviewidx = ?";
            pstmt = conn.prepareStatement(selectSql);
            pstmt.setInt(1, reviewidx);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                review = createReviewFromResultSet(rs);
            }
            
            conn.commit();
            return review;
            
        } catch (SQLException e) {
            try {
                if (conn != null) conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            return null;
        } finally {
        	try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) {
                    conn.setAutoCommit(true);
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    // 리뷰 삽입
    public int insert(Review review) {
        String sql = "INSERT INTO TEAM3_BOOK_REVIEW (review_title, review_body, review_cnt, " +
                    "review_regdate, review_updated, bookidx, memid) VALUES (?, ?, ?, ?, ?, ?, ?)";
                    
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            setReviewParameters(pstmt, review);
            
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // 로깅 추가 고려
        }
        return 0;
    }

    // 리뷰 업데이트
    public int update(Review review) {
        String sql = "UPDATE TEAM3_BOOK_REVIEW SET review_title = ?, review_body = ?, " +
                    "review_cnt = ?, review_updated = ? WHERE reviewidx = ?";
                    
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
             
            pstmt.setString(1, review.getReview_title());
            pstmt.setString(2, review.getReview_body());
            pstmt.setInt(3, review.getReview_cnt());
            pstmt.setDate(4, new Date(System.currentTimeMillis())); // 현재 시간으로 업데이트
            pstmt.setInt(5, review.getReviewidx());

            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // 로깅 추가 고려
        }
        return 0;
    }

    

    private Review createReviewFromResultSet(ResultSet rs) throws SQLException {
        Review review = new Review();
        review.setReviewidx(rs.getInt("reviewidx"));
        review.setReview_title(rs.getString("review_title"));
        review.setReview_body(rs.getString("review_body"));
        review.setReview_cnt(rs.getInt("review_cnt"));
        review.setReview_regdate(rs.getDate("review_regdate"));
        review.setReview_updated(rs.getDate("review_updated"));
        review.setBookidx(rs.getInt("bookidx"));
        review.setBook_name(rs.getString("book_name"));
        review.setMemid(rs.getString("memid"));
        return review;
    }

    private void setReviewParameters(PreparedStatement pstmt, Review review) throws SQLException {
        pstmt.setString(1, review.getReview_title());
        pstmt.setString(2, review.getReview_body());
        pstmt.setInt(3, 0); // 새 리뷰의 초기 조회수는 0
        Date currentDate = new Date(System.currentTimeMillis());
        pstmt.setDate(4, currentDate); // review_regdate
        pstmt.setDate(5, currentDate); // review_updated
        pstmt.setInt(6, review.getBookidx());
        pstmt.setString(7, review.getMemid());
    }
    
    public boolean isReviewExists(int reviewidx) {
        String sql = "SELECT COUNT(*) FROM TEAM3_BOOK_REVIEW WHERE reviewidx = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
             
            pstmt.setInt(1, reviewidx);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 리뷰 작성자 확인
     * @param reviewidx 리뷰 번호
     * @param memid 회원 ID
     * @return 작성자가 맞으면 true, 아니면 false
     */
    public boolean isReviewAuthor(int reviewidx, String memid) {
        String sql = "SELECT COUNT(*) FROM TEAM3_BOOK_REVIEW WHERE reviewidx = ? AND memid = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
             
            pstmt.setInt(1, reviewidx);
            pstmt.setString(2, memid);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 리뷰 삭제
     * @param reviewidx 삭제할 리뷰 번호
     * @return 삭제된 행의 수 (성공: 1, 실패: 0)
     */
    public int delete(int reviewidx) {
        // 리뷰가 존재하는지 먼저 확인
        if (!isReviewExists(reviewidx)) {
            return 0;
        }

        String sql = "DELETE FROM TEAM3_BOOK_REVIEW WHERE reviewidx = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            conn.setAutoCommit(false); // 트랜잭션 시작
            
            try {
                pstmt.setInt(1, reviewidx);
                int result = pstmt.executeUpdate();
                
                if (result > 0) {
                    conn.commit(); // 성공시 커밋
                    return result;
                } else {
                    conn.rollback(); // 실패시 롤백
                    return 0;
                }
            } catch (SQLException e) {
                conn.rollback(); // 예외 발생시 롤백
                throw e;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 회원이 작성한 리뷰 삭제
     * @param reviewidx 리뷰 번호
     * @param memid 회원 ID
     * @return 삭제된 행의 수 (성공: 1, 실패: 0)
     */
    public int deleteByMember(int reviewidx, String memid) {
        // 리뷰가 존재하고 해당 회원이 작성한 리뷰인지 확인
        if (!isReviewExists(reviewidx) || !isReviewAuthor(reviewidx, memid)) {
            return 0;
        }

        String sql = "DELETE FROM TEAM3_BOOK_REVIEW WHERE reviewidx = ? AND memid = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            conn.setAutoCommit(false); // 트랜잭션 시작
            
            try {
                pstmt.setInt(1, reviewidx);
                pstmt.setString(2, memid);
                int result = pstmt.executeUpdate();
                
                if (result > 0) {
                    conn.commit(); // 성공시 커밋
                    return result;
                } else {
                    conn.rollback(); // 실패시 롤백
                    return 0;
                }
            } catch (SQLException e) {
                conn.rollback(); // 예외 발생시 롤백
                throw e;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 도서에 연결된 모든 리뷰 삭제 (도서 삭제 시 사용)
     * @param bookidx 도서 번호
     * @return 삭제된 행의 수
     */
    public int deleteByBook(int bookidx) {
        String sql = "DELETE FROM TEAM3_BOOK_REVIEW WHERE bookidx = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            conn.setAutoCommit(false); // 트랜잭션 시작
            
            try {
                pstmt.setInt(1, bookidx);
                int result = pstmt.executeUpdate();
                
                conn.commit(); // 성공시 커밋
                return result;
            } catch (SQLException e) {
                conn.rollback(); // 예외 발생시 롤백
                throw e;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}