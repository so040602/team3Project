package com.team3.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.team3.model.bean.Product;
import com.team3.model.mall.CartItem; 

public class ProductDao extends SuperDao {
	public Product getDataByPk(int pnum) {
		// 기본 키인 상품 번호를 이용하여 상품 정보를 반환합니다.
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from TEAM3_PRODUCT " ;
		sql += " where pnum = ?  " ;
		
		Product bean = null ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, pnum);
			
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) {
				bean = getPrdBeanData(rs);
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

	
	public int updateData(Product bean) {
		// 관리자가 수정한 상품 정보를 업데이트 합니다.
		System.out.println(bean); 
		
		PreparedStatement pstmt = null;
		String sql = " update TEAM3_PRODUCT set prdname = ?, company = ?, image01 = ?, image02 = ?, image03 = ?, stock = ?, price = ?, category = ?, contents = ?, point = ?, inputdate = ? " ;
		sql += " where pnum = ? " ; 
		
		int cnt = -99999 ;
		
		try {
			conn = super.getConnection() ;
			conn.setAutoCommit(false); 
			
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setString(1, bean.getPrdname());
			pstmt.setString(2, bean.getCompany());
			pstmt.setString(3, bean.getImage01());
			pstmt.setString(4, bean.getImage02());
			pstmt.setString(5, bean.getImage03());
			pstmt.setInt(6, bean.getStock());
			pstmt.setInt(7, bean.getPrice());
			pstmt.setString(8, bean.getCategory());
			pstmt.setString(9, bean.getContents());
			pstmt.setInt(10, bean.getPoint());
			pstmt.setString(11, bean.getInputdate());
			
			// 상품 번호 필히 넣을 것
			pstmt.setInt(12, bean.getPnum());
			
			
			cnt = pstmt.executeUpdate() ;
			
			conn.commit(); 
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}		
		
		return cnt ;
	}	
	
	public int insertData(Product bean) {
		// 상품 빈을 이용하여 데이터 베이스에 추가합니다.
		System.out.println(bean); 
		
		PreparedStatement pstmt = null;
		String sql = " insert into TEAM3_PRODUCT (prdname, company, image01, image02, image03, stock, price, category, contents, point, inputdate)" ;
		sql += " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())" ; 
		
		int cnt = -99999 ;
		
		try {
			conn = super.getConnection() ;
			conn.setAutoCommit(false); 
			
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setString(1, bean.getPrdname());
			pstmt.setString(2, bean.getCompany());
			pstmt.setString(3, bean.getImage01());
			pstmt.setString(4, bean.getImage02());
			pstmt.setString(5, bean.getImage03());
			pstmt.setInt(6, bean.getStock());
			pstmt.setInt(7, bean.getPrice());
			pstmt.setString(8, bean.getCategory());
			pstmt.setString(9, bean.getContents());
			pstmt.setInt(10, bean.getPoint());
			
			cnt = pstmt.executeUpdate() ;
			
			conn.commit(); 
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}		
		
		return cnt ;
	}	
	

	
	public List<Product> getDataList_deprecated(){
		// 상품 목록들을 담아서 반환합니다.(차후 Database으로 변경해야 합니다.)
		List<Product> lists = new ArrayList<Product>();
		
		lists.add(new Product(1, "콜라", "갑을 식품", "americano01.png", 
				null, null, 10, 1000, "beverage", "이 상품은 매우 시원하고 맛있습니다.", 5, "2024/08/29"));
		
		return lists ;
	}

	public List<Product> selectAll() {
		// 상품 전체 목록을 읽어 들입니다. 
		List<Product> lists = new ArrayList<Product>();
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		// 게시물 번호 역순으로 정렬
		String sql = " select * from TEAM3_PRODUCT" ;
		sql += " order by pnum desc" ;		
 
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql);			
			
			rs = pstmt.executeQuery() ;
			
			while(rs.next()) {
				lists.add(getPrdBeanData(rs)) ; 
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

	private Product getPrdBeanData(ResultSet rs) {
		Product bean = null ; 
		
		try {
			bean = new Product() ;
			
			bean.setPnum(rs.getInt("pnum"));
			bean.setPrdname(rs.getString("prdname"));
			bean.setCompany(rs.getString("company"));
			bean.setImage01(rs.getString("image01"));
			bean.setImage02(rs.getString("image02"));
			bean.setImage03(rs.getString("image03"));
			bean.setStock(rs.getInt("stock"));
			bean.setPrice(rs.getInt("price"));
			bean.setCategory(rs.getString("category"));
			bean.setContents(rs.getString("contents"));
			bean.setPoint(rs.getInt("point"));
			bean.setInputdate(String.valueOf(rs.getDate("inputdate"))); 
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
		
		return bean ;
	}

	public CartItem getCartItem(Integer pnum, Integer qty) {
		// 상품 번호와 구매 수량을 이용하여 장바구니 품목(CartItem) 정보를 반환해 줍니다.
		Product bean = this.getDataByPk(pnum);
		
		CartItem item = new CartItem() ; // 상품 정보 + 구매 수량 + 로그인 아이디
		
		item.setId(null); // wishList 테이블과 연관이 있습니다. 현재는 의미가 없습니다.
		
		item.setPnum(pnum);
		item.setImage01(bean.getImage01());
		item.setPname(bean.getPrdname());
		item.setPoint(bean.getPoint());
		item.setPrice(bean.getPrice());
		item.setQty(qty);
		
		return item;
	}

	public int getMileagePoint(Integer pnum) {
		// 해당 상품 번호에 대한 `마일리지 적립 포인트`를 반환해 줍니다.
		int point = 0;
		
		String sql = " select point from TEAM3_PRODUCT " ;
		sql += " where pnum = ? " ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setInt(1, pnum);
			
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) {
				point = rs.getInt("point") ;
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
		
		
		return point ;
	}	

}












