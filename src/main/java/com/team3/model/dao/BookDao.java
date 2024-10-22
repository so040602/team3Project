package com.team3.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.team3.model.bean.Book;
import com.team3.model.bean.Paging;

public class BookDao extends SuperDao{

	public int getTotalCount(String mode) {
		// TODO Auto-generated method stub
		int totalcount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as mycnt from booklist";
		boolean bool = mode == null || mode.equals("all");
		if(!bool) {
			
		}
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalcount = rs.getInt("mycnt");
			}
			
		} catch (Exception ex) {
			// TODO: handle exception
			ex.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			} catch (Exception ex) {
				// TODO: handle exception
				ex.printStackTrace();
			}
		}
		return totalcount;
	}

	public List<Book> getPaginationData(Paging pageInfo) {
		// TODO Auto-generated method stub
		Connection conn = null;
		String sql = " SELECT cnt, name, price, category, rating, data, img, description";
		sql += " FROM (SELECT cnt, name, price, category, rating, data, img, description,";
		sql += " ROW_NUMBER() OVER (ORDER BY cnt ASC) AS ranking";
		sql += " FROM booklist";
		sql += " ) AS ranked_books";
		sql += " WHERE ranking BETWEEN ? AND ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Book> lists = new ArrayList<Book>();
		
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pageInfo.getBeginRow());
			pstmt.setInt(2, pageInfo.getEndRow());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Book bean = this.getBeanData(rs);
				lists.add(bean);
			}
			
		} catch (Exception ex) {
			// TODO: handle exception
			ex.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
				
			} catch (Exception ex) {
				// TODO: handle exception
				ex.printStackTrace();
			}
		}
		
		
		return lists;
	}

	private Book getBeanData(ResultSet rs) {
		// TODO Auto-generated method stub
		Book bean = new Book();
		try {
			String priceString = rs.getString("price").replace(",", "");
			int price = Integer.parseInt(priceString);
			bean.setCnt(rs.getInt("cnt"));
			bean.setName(rs.getString("name"));
			bean.setPrice(price);
			bean.setCategory(rs.getString("category"));
			bean.setRating(Float.parseFloat(rs.getString("rating")));
			bean.setData(rs.getString("data"));
			bean.setImg(rs.getString("img"));
			bean.setDescription(rs.getString("description"));			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return bean;
	}

}
