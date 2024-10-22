package com.team3.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.team3.model.bean.Member;
import com.team3.model.bean.Order;
import com.team3.model.mall.CartItem;

//주문과 주문 상세 관련된 업무를 처리하는 Dao입니다.
public class MallDaoOld extends SuperDao{

	public List<Order> getHistory(String id) {
		// 해당 고객의 모든 주문 내역을 최신순으로 정렬하여 반환해 줍니다.
		String sql = " select * from TEAM3_ORDER " ;
		sql += " where memid = ? order by orderdate desc ";
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		List<Order> orderList = new ArrayList<Order>() ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, id);
			rs = pstmt.executeQuery() ;
			
			while(rs.next()) {
				orderList.add(this.makeOrderBean(rs)) ;
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
		return orderList;		
	}
	
	private Order makeOrderBean(ResultSet rs) {
		Order bean = null ;
		try {
			bean = new Order() ;
			
			bean.setId(rs.getString("id"));
			bean.setOid(rs.getInt("oid"));
			bean.setOrderdate(String.valueOf(rs.getDate("orderdate")));					
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
		return bean;
	}
	
	public void calculate(Member payer, Map<Integer, Integer> cartList) {
		// payer : 계산을 수행하는 사람(포인트 적립 대상자)
		// cartList : 카트에 담겨져 있는 `상품 번호`와 `구매 수량`
		
		System.out.println("payer in MallDao.calculate() : " + payer);
		System.out.println("cartList MallDao.calculate() : " + cartList);
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null;
		String sql = "" ;
		int cnt = -999999; 
		
		try {
			conn = super.getConnection() ;
			conn.setAutoCommit(false);
			
			// step01 : 주문 테이블(Orders)에 매출 1건 입력
			sql = " insert into TEAM3_ORDER(memid, orderdate)" ;
			sql += " values(?, NOW())" ;
			
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, payer.getMemid());
			
			cnt = pstmt.executeUpdate();
			
			if(pstmt != null) {pstmt.close();}
			
			// step02 : `step01`에서 방금 추가된 송장 번호 읽기
			sql = " select max(oid) as invnum from TEAM3_ORDER " ;
			pstmt = conn.prepareStatement(sql) ;
			rs = pstmt.executeQuery();
			
			int invnum = 0 ; // 송장 번호
			if(rs.next()) {
				invnum = rs.getInt("invnum") ;
			}
			if(pstmt != null) {pstmt.close();}	
			
			int totalPoint = 0 ; // 고객에게 적립해줄 포인트 점수
			
			for(Integer pnum : cartList.keySet()) {
				int qty = cartList.get(pnum) ;				
				
				// 반복문을 사용하여
				// step03 : 주문 상세 테이블(OrderDetails)에 각각의 데이터 추가하기
				sql = " insert into TEAM3_ORDER_DETAIL(oid, pnum, qty)" ;
				sql += " values(?, ?, ?)" ;
				pstmt = conn.prepareStatement(sql) ;
				pstmt.setInt(1, invnum);
				pstmt.setInt(2, pnum);
				pstmt.setInt(3, qty);		
				cnt = pstmt.executeUpdate();
				if(pstmt != null) {pstmt.close();}
				
				// step04 : 상품(Products) 각각의 재고 수량을 뺄셈합니다.
				sql = " update TEAM3_PRODUCT set stock = stock - ? " ;
				sql += " where pnum = ? " ;
				pstmt = conn.prepareStatement(sql) ;
		
				pstmt.setInt(1, qty);
				pstmt.setInt(2, pnum);
				
				cnt = pstmt.executeUpdate();
				if(pstmt != null) {pstmt.close();}
				
				totalPoint += qty * new ProductDao().getMileagePoint(pnum) ;
			}
			
			// step05 : 해당 고객(Members)의 마일리지 포인트를 적립해 줍니다.
			sql = " update TEAM3_MEMBER set mpoint = mpoint + ? " ;
			sql += " where memid = ?" ;
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, totalPoint);
			pstmt.setString(2, payer.getMemid());
			
			cnt = pstmt.executeUpdate();
			if(pstmt != null) {pstmt.close();}			
						
			
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}

	public Order getDetailHistory(int oid) {
		// 해당 송장 번호에 대한 주문 정보를 반환해 줍니다.
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from TEAM3_ORDER where oid = ? " ;
		
		Order bean = null ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setInt(1, oid);
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) {
				bean = this.makeOrderBean(rs) ;
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
		
		return bean;
	}

	public List<CartItem> showDetail(int oid) {
		// 해당 송장 번호에 대한 상세 내역을 컬렉션 형태로 반환합니다.
		List<CartItem> lists = new ArrayList<CartItem>();
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		
		String sql = " select p.pnum, p.name pname, od.qty, p.price, p.point, p.image01 " ;
		sql += " from (TEAM3_ORDER o inner join TEAM3_ORDER_DETAIL od " ;
		sql += " on o.oid = od.oid) inner join TEAM3_PRODUCT p " ;
		sql += " on od.pnum = p.pnum and o.oid = ?  " ;
		sql += " order by od.odid desc " ;		
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, oid);
			rs = pstmt.executeQuery() ;
			
			while(rs.next()) {
				lists.add(this.makeCartItemBean(rs)) ;
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

	private CartItem makeCartItemBean(ResultSet rs) {
		CartItem item = null ;
	
		try {
			item = new CartItem() ;
			
			// item.setId(rs.getString("id"));			
			item.setImage01(rs.getString("image01"));
			item.setPname(rs.getString("pname"));
			item.setPnum(rs.getInt("pnum"));
			item.setPoint(rs.getInt("point"));
			item.setPrice(rs.getInt("price"));
			item.setQty(rs.getInt("qty"));
			
		} catch (SQLException e) {			
			e.printStackTrace();
			return null ; 
		}
		
		return item;
	}	
	
}
