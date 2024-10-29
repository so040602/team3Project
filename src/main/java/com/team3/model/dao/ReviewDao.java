package com.team3.model.dao;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.team3.model.bean.Board;
import com.team3.model.bean.Book;
import com.team3.model.bean.Paging;
import com.team3.model.bean.Review;
import com.team3.utility.AppConfig;

public class ReviewDao extends SuperDao {

	public List<Review> selectAll() {
		// 게시물 전체 목록을 읽어 들입니다.
		List<Review> lists = new ArrayList<Review>();
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		// 게시물 번호 역순으로 정렬
		String sql = " SELECT * FROM TEAM3_BOOK_REVIEW" ;
		sql += " ORDER BY reviewidx desc" ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql);			
			
			rs = pstmt.executeQuery() ;
			
			while(rs.next()) {
				lists.add(getBeanData(rs)) ; 
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
		
		return lists ;
	}	
	
	
	private Review getBeanData(ResultSet rs) {
		Review bean = null;
		
		try {
			bean = new Review() ; 
			
			bean.setReviewIdx(rs.getInt("reviewidx"));
			bean.setBookIdx(rs.getInt("bookidx"));
			bean.setMemId(rs.getString("memid"));
			bean.setReviewTitle(rs.getString("review_title"));
			bean.setReviewBody(rs.getString("review_body"));
			bean.setReviewCnt(rs.getInt("review_cnt"));
			bean.setReviewRegDate(rs.getDate("review_regdate"));
			bean.setReviewUpdated(rs.getDate("review_updated"));
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
		
		return bean ;
	}

	
	
}
