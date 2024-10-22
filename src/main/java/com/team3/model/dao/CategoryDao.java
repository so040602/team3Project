package com.team3.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.team3.model.bean.Category;

public class CategoryDao extends SuperDao{
	// 해당 모듈에 맞는 카테고리 목록을 반환해 줍니다.
	public List<Category> getCategoryList(String module, String type){
		List<Category> lists = new ArrayList<Category>();		
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = " select * from TEAM3_CATEGORY" ;
		sql += " where module = ? and usetype = ?" ;
		sql += " order by ordering asc" ;
		
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, module);
			pstmt.setString(2, type);			
			rs = pstmt.executeQuery() ;
			
			while(rs.next()) {
				lists.add(getBeanData(rs)) ; 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
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

	private Category getBeanData(ResultSet rs) {
		Category bean = null ;
		
		try {
			bean = new Category() ;
			bean.setEngname(rs.getString("engname"));
			bean.setKorname(rs.getString("korname"));
			bean.setModule(rs.getString("module"));
			bean.setOrdering(rs.getInt("ordering"));
			bean.setUsetype(rs.getString("usetype"));
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
		return bean;
	}
}


















