package com.team3.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.team3.model.bean.Combo01;
import com.team3.model.bean.Combo02;
import com.team3.model.bean.Combo03;
import com.team3.model.bean.Combo04;
import com.team3.model.bean.Combo05;

public class CompositeDao extends SuperDao{
	public List<Combo01> view01() throws Exception{
		String sql = " select m.memname, b.subtitle, b.contents, b.regdate ";
		sql += " from TEAM3_MEMBER m inner join TEAM3_BOARD b " ;		
		sql += " on m.memid = b.memid " ; 
		sql += " order by m.memname " ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		conn = super.getConnection() ;
		pstmt = conn.prepareStatement(sql) ;
		rs = pstmt.executeQuery() ; 
		
		List<Combo01> lists = new ArrayList<Combo01>() ;
		
		while(rs.next()) {
			Combo01 bean = new Combo01();
			
			bean.setContents(rs.getString("contents"));
			bean.setMemname(rs.getString("memname"));
			bean.setSubtitle(rs.getString("subtitle"));
			bean.setRegdate(String.valueOf(rs.getDate("regdate")));
			
			lists.add(bean) ;
		}		
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		return lists;
	}

	public List<Combo02> view02() throws Exception{
		String sql = " select m.memname, count(*) as cnt " ;
		sql += " from TEAM3_MEMBER m inner join TEAM3_BOARD b " ;
		sql += " on m.memid = b.memid " ;
		sql += " group by m.memname " ;
		sql += " order by m.memname " ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		conn = super.getConnection() ;
		pstmt = conn.prepareStatement(sql) ;
		rs = pstmt.executeQuery() ; 
		
		List<Combo02> lists = new ArrayList<Combo02>() ;
		
		while(rs.next()) {
			Combo02 bean = new Combo02() ;
			bean.setMemname(rs.getString("memname"));
			bean.setCnt(rs.getInt("cnt"));
			lists.add(bean) ;
		}
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		return lists;
	}
	
	public List<Combo03> view03() throws Exception{		
		String sql = " select m.memname mname, p.prdname pname, o.orderdate, od.qty, p.price, od.qty * p.price as amount";
		sql += " from ((TEAM3_MEMBER m inner join TEAM3_ORDER o";
		sql += " on m.memid=o.memid) inner join TEAM3_ORDER_DETAIL od";
		sql += " on o.oid=od.oid) inner join TEAM3_PRODUCT p";
		sql += " on od.pnum=p.pnum";
		sql += " order by p.prdname desc, m.memname asc";
		
		List<Combo03> lists = new ArrayList<Combo03>() ;		
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		conn=super.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery() ;
		
		while(rs.next()) {
			Combo03 bean = new Combo03() ;
			
			bean.setAmount(rs.getInt("amount"));
			bean.setMname(rs.getString("mname"));
			bean.setOrderdate(String.valueOf(rs.getDate("orderdate")));
			bean.setPname(rs.getString("pname"));
			bean.setPrice(rs.getInt("price"));
			bean.setQty(rs.getInt("qty"));
			
			lists.add(bean) ;
		}
		
		if(rs!=null){rs.close();}
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}
		
		return lists;
	}

	public List<Combo04> view04() throws Exception{		
		String sql = " select m.memid, sum(od.qty * p.price) as sumtotal ";
		sql += " from ((TEAM3_MEMBER m inner join TEAM3_ORDER o";
		sql += " on m.memid=o.memid) inner join TEAM3_ORDER_DETAIL od";
		sql += " on o.oid=od.oid) inner join TEAM3_PRODUCT p";
		sql += " on od.pnum=p.pnum";
		sql += " group by m.memid";
		
		List<Combo04> lists = new ArrayList<Combo04>() ;
	
		 
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		conn=super.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery() ;
		
		while(rs.next()) {
			Combo04 bean = new Combo04() ;
			
			bean.setSumtotal(rs.getInt("sumtotal"));
			bean.setId(rs.getString("memid"));
			
			lists.add(bean) ;
		}
		
		if(rs!=null){rs.close();}
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}
		
		return lists;
	}
	
	public List<Combo05> view05() throws Exception{		
		String sql = " select m.memid, count(o.memid) as cnt ";
		sql += " from TEAM3_MEMBER m left outer join TEAM3_ORDER o";
		sql += " on m.memid=o.memid";
		sql += " group by m.memid";
		sql += " order by cnt desc, m.memid asc";
		
		List<Combo05> lists = new ArrayList<Combo05>() ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		conn=super.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery() ;
		
		while(rs.next()) {
			Combo05 bean = new Combo05() ;
			
			bean.setCnt(rs.getInt("cnt"));
			bean.setId(rs.getString("memid"));
			
			lists.add(bean) ;
		}
		
		if(rs!=null){rs.close();}
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}
		
		return lists;
	}	

}
