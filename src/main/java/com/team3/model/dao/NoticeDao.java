package com.team3.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.team3.model.bean.Notice;

public class NoticeDao extends SuperDao {

	public List<Notice> selectAllNotices() {
	    List<Notice> notices = new ArrayList<>();
	    String sql = " SELECT * FROM notices "; 

	    try (Connection conn = super.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         ResultSet rs = pstmt.executeQuery()) {

	        while (rs.next()) {
	            Notice notice = new Notice();
	            notice.setNoticeId(rs.getInt("notice_id"));
	            notice.setNoticeTitle(rs.getString("notice_title"));
	            notice.setNoticeContent(rs.getString("notice_content"));
	            notice.setNoticeAuthor(rs.getString("notice_author"));
	            notice.setNoticeCreated(rs.getTimestamp("notice_created")); 
	            notice.setNoticeViews(rs.getInt("notice_views"));
	            notice.setNoticeAttachments(rs.getString("notice_attachments"));
	            notices.add(notice);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return notices;
	}
	
	public Notice selectNoticeById(int noticeId) {
        Notice notice = null;
        String sql = "SELECT * FROM notices WHERE notice_id = ?";
        
        try (Connection conn = super.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, noticeId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    notice = new Notice();
                    notice.setNoticeId(rs.getInt("notice_id"));
                    notice.setNoticeTitle(rs.getString("notice_title"));
                    notice.setNoticeContent(rs.getString("notice_content"));
                    notice.setNoticeAuthor(rs.getString("notice_author"));
                    notice.setNoticeCreated(rs.getTimestamp("notice_created"));
                    notice.setNoticeViews(rs.getInt("notice_views"));
                    notice.setNoticeAttachments(rs.getString("notice_attachments"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notice;
    }

    // 조회수만 증가시키는 별도의 메서드
    public void incrementNoticeViews(int noticeId) {
        String sql = "UPDATE notices SET notice_views = notice_views + 1 WHERE notice_id = ?";
        
        try (Connection conn = super.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, noticeId);
            pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public boolean insertNotice(Notice notice) {
        String sql = "INSERT INTO notices (notice_title, notice_content, notice_author, notice_created, notice_views, notice_attachments) "
                  + "VALUES (?, ?, ?, NOW(), 0, ?)";
        
        try (Connection conn = super.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, notice.getNoticeTitle());
            pstmt.setString(2, notice.getNoticeContent());
            pstmt.setString(3, notice.getNoticeAuthor());
            pstmt.setString(4, notice.getNoticeAttachments());
            
            int count = pstmt.executeUpdate();
            return count > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteNotice(int noticeId) {
        String sql = "DELETE FROM notices WHERE notice_id = ?";
        
        try (Connection conn = super.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, noticeId);
            int count = pstmt.executeUpdate();
            return count > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean updateNotice(Notice notice) {
        String sql = "UPDATE notices SET notice_title=?, notice_content=?, notice_author=?, notice_attachments=? WHERE notice_id=?";
        
        try (Connection conn = super.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, notice.getNoticeTitle());
            pstmt.setString(2, notice.getNoticeContent());
            pstmt.setString(3, notice.getNoticeAuthor());
            pstmt.setString(4, notice.getNoticeAttachments());
            pstmt.setInt(5, notice.getNoticeId());
            
            int count = pstmt.executeUpdate();
            return count > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
    
