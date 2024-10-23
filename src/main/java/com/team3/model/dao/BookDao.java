package com.team3.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.team3.model.bean.Book;
import com.team3.model.bean.Paging;
import com.team3.model.bean.Product;

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

	public Book getDataByPk(int cnt) {
		// 기본 키인 상품 번호를 이용하여 상품 정보를 반환합니다.
				PreparedStatement pstmt = null ;
				ResultSet rs = null ;		
				String sql = " select * from booklist " ;
				sql += " where cnt = ?  " ;
				
				Book bean = null ;
				
				try {
					conn = super.getConnection() ;
					pstmt = conn.prepareStatement(sql) ;
					
					pstmt.setInt(1, cnt);
					
					rs = pstmt.executeQuery() ;
					
					if(rs.next()) {
						bean = getBookBeanData(rs);
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

	private Book getBookBeanData(ResultSet rs) {
		Book bean = null ; 
		
		try {
			bean = new Book() ;
			
			bean.setCnt(rs.getInt("cnt"));
			bean.setName(rs.getString("name"));
			
			String priceString = rs.getString("price").replace(",", "");
	        int price = Integer.parseInt(priceString);
	        bean.setPrice(price);
			
			bean.setCategory(rs.getString("category"));
			bean.setRating(rs.getFloat("rating"));
			bean.setData(rs.getString("data"));
			bean.setImg(rs.getString("img"));
			bean.setDescription(rs.getString("description"));
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
		
		return bean ;
	}
	
	
	public List<Book> getBestSellers() throws Exception {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<Book> lists = new ArrayList<Book>();
	    
	    String sql = "SELECT * FROM booklist WHERE rating >= 4.0 "
	               + "ORDER BY rating DESC, cnt DESC LIMIT 25";
	    
	    try {
	        conn = super.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        
	        while(rs.next()) {
	            Book bean = this.getBeanData(rs);
	            lists.add(bean);
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	        throw ex;
	    } finally {
	        try {
	            if(rs != null) {rs.close();}
	            if(pstmt != null) {pstmt.close();}
	            if(conn != null) {conn.close();}
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }
	    return lists;
	}

	public List<Book> getNewBooks() throws Exception {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<Book> lists = new ArrayList<Book>();
	    
	    String sql = "SELECT * FROM booklist "
	               + "ORDER BY data DESC LIMIT 12";
	    
	    try {
	        conn = super.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        
	        while(rs.next()) {
	            Book bean = this.getBeanData(rs);
	            lists.add(bean);
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	        throw ex;
	    } finally {
	        try {
	            if(rs != null) {rs.close();}
	            if(pstmt != null) {pstmt.close();}
	            if(conn != null) {conn.close();}
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }
	    return lists;
	}

	public List<Book> getPopularBooks() throws Exception {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<Book> lists = new ArrayList<Book>();
	    
	    String sql = "SELECT * FROM booklist "
	               + "ORDER BY rating DESC LIMIT 12";
	    
	    try {
	        conn = super.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        
	        while(rs.next()) {
	            Book bean = this.getBeanData(rs);
	            lists.add(bean);
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	        throw ex;
	    } finally {
	        try {
	            if(rs != null) {rs.close();}
	            if(pstmt != null) {pstmt.close();}
	            if(conn != null) {conn.close();}
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }
	    return lists;
	}

	public List<Book> getPickBooks() throws Exception {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<Book> lists = new ArrayList<Book>();
	    
	    // PICK 도서는 평점이 4.5 이상이면서 최신인 도서들
	    String sql = "SELECT * FROM booklist WHERE rating >= 4.5 "
	               + "ORDER BY data DESC LIMIT 12";
	    
	    try {
	        conn = super.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        
	        while(rs.next()) {
	            Book bean = this.getBeanData(rs);
	            lists.add(bean);
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	        throw ex;
	    } finally {
	        try {
	            if(rs != null) {rs.close();}
	            if(pstmt != null) {pstmt.close();}
	            if(conn != null) {conn.close();}
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }
	    return lists;
	}

	public List<Book> getRecentSearched() throws Exception {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<Book> lists = new ArrayList<Book>();
	    
	    // 최근 7일 동안 조회된 도서들
	    String sql = "SELECT * FROM booklist "
	               + "WHERE data >= DATE_SUB(NOW(), INTERVAL 7 DAY) "
	               + "ORDER BY cnt DESC LIMIT 12";
	    
	    try {
	        conn = super.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        
	        while(rs.next()) {
	            Book bean = this.getBeanData(rs);
	            lists.add(bean);
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	        throw ex;
	    } finally {
	        try {
	            if(rs != null) {rs.close();}
	            if(pstmt != null) {pstmt.close();}
	            if(conn != null) {conn.close();}
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }
	    return lists;
	}

	public List<Book> searchBooks(String keyword, String category) throws Exception {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<Book> lists = new ArrayList<Book>();
	    
	    String sql = "SELECT * FROM booklist WHERE 1=1 ";
	    
	    if (keyword != null && !keyword.trim().isEmpty()) {
	        sql += "AND (name LIKE ? OR description LIKE ?) ";
	    }
	    
	    if (category != null && !category.trim().isEmpty()) {
	        sql += "AND category = ? ";
	    }
	    
	    sql += "ORDER BY cnt DESC";
	    
	    try {
	        conn = super.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        
	        int parameterIndex = 1;
	        if (keyword != null && !keyword.trim().isEmpty()) {
	            String searchKeyword = "%" + keyword + "%";
	            pstmt.setString(parameterIndex++, searchKeyword);
	            pstmt.setString(parameterIndex++, searchKeyword);
	        }
	        
	        if (category != null && !category.trim().isEmpty()) {
	            pstmt.setString(parameterIndex, category);
	        }
	        
	        rs = pstmt.executeQuery();
	        
	        while(rs.next()) {
	            Book bean = this.getBeanData(rs);
	            lists.add(bean);
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	        throw ex;
	    } finally {
	        try {
	            if(rs != null) {rs.close();}
	            if(pstmt != null) {pstmt.close();}
	            if(conn != null) {conn.close();}
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }
	    return lists;
	}
	
	


}
