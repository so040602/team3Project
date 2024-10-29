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
	    String sql = " SELECT * FROM notices "; // 테이블 이름 확인

	    try (Connection conn = super.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         ResultSet rs = pstmt.executeQuery()) {

	        while (rs.next()) {
	            Notice notice = new Notice();
	            notice.setNoticeId(rs.getInt("notice_id"));
	            notice.setNoticeTitle(rs.getString("notice_title"));
	            notice.setNoticeContent(rs.getString("notice_content"));
	            notice.setNoticeAuthor(rs.getString("notice_author"));
	            notice.setNoticeCreated(rs.getTimestamp("notice_created")); // Timestamp로 설정
	            notice.setNoticeViews(rs.getInt("notice_views"));
	            notice.setNoticeAttachments(rs.getString("notice_attachments"));
	            notices.add(notice);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return notices;
	}

}
