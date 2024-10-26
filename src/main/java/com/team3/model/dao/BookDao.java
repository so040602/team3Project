package com.team3.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.team3.model.bean.Book;
import com.team3.model.bean.Paging;

public class BookDao extends SuperDao {

    public int getTotalCount(String mode) {
    	int totalcount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as mycnt from booklist";
		boolean bool = mode == null || mode.equals("all");
		if(!bool) {
			sql += " where category = ?";
		}
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			if(!bool) {
				pstmt.setString(1, mode);
			}
			
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
		Connection conn = null;
		String mode = pageInfo.getMode() ;
		String keyword = pageInfo.getKeyword();
        boolean bool = pageInfo.equals(null) || pageInfo.equals("null") || mode.equals("")|| mode.equals("all");
        boolean bool1 = pageInfo.equals(null) || pageInfo.equals("null") || keyword.equals("");
		String sql = " SELECT cnt, book_name, price, category, rating, date, person_name , publisher, img, description";
		sql += " FROM (SELECT cnt, book_name, price, category, rating, date, person_name , publisher, img, description,";
		sql += " ROW_NUMBER() OVER (ORDER BY cnt ASC) AS ranking";
		sql += " FROM booklist";
		if(!bool) {
			sql += " WHERE category = ?";
		}
		if(!bool1) {
			if(bool) {
				sql += " WHERE book_name LIKE ?";
			}else {
				sql += " AND book_name LIKE ?";
			}
		}
		sql += " ) AS ranked_books";
		sql += " WHERE ranking BETWEEN ? AND ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("sql is " + sql);
		
		List<Book> lists = new ArrayList<Book>();
		
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			if(!bool) {
				pstmt.setString(1, mode);
				pstmt.setInt(2, pageInfo.getBeginRow());
				pstmt.setInt(3, pageInfo.getEndRow());
			}
			if(!bool1) {
				if(bool) {
					pstmt.setString(1, "%" + keyword + "%");
					pstmt.setInt(2, pageInfo.getBeginRow());
					pstmt.setInt(3, pageInfo.getEndRow());
				}else {
					pstmt.setString(1, mode);
					pstmt.setString(2, "%" + keyword + "%");
					pstmt.setInt(3, pageInfo.getBeginRow());
					pstmt.setInt(4, pageInfo.getEndRow());
				}
			}
			else {
				pstmt.setInt(1, pageInfo.getBeginRow());
				pstmt.setInt(2, pageInfo.getEndRow());
			}
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
        Book bean = new Book();
        try {
        	String priceString = rs.getString("price").replace(",", "");
			int price = Integer.parseInt(priceString);
			String book_rating = rs.getString("rating");
			if(book_rating == null || book_rating.trim().isEmpty()) {
				
				book_rating = "0.0";
			}
			String descrip = rs.getString("description");
			if(descrip == null) {
				descrip = "";
			}			
			bean.setCnt(rs.getInt("cnt"));
            bean.setBook_name(rs.getString("book_name"));
			bean.setPrice(price);
			bean.setCategory(rs.getString("category"));
			bean.setRating(Float.parseFloat(book_rating));
            bean.setDate(rs.getString("date"));
			bean.setImg(rs.getString("img"));
            bean.setPerson_name(rs.getString("person_name"));
            bean.setPublisher(rs.getString("publisher"));
			bean.setDescription(descrip);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bean;
    }

    public Book getDataByPk(int cnt) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;		
        String sql = "SELECT * FROM booklist WHERE cnt = ?";
        Book bean = null;
        try {
            conn = super.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, cnt);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                bean = getBookBeanData(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) { rs.close(); }
                if (pstmt != null) { pstmt.close(); }
                if (conn != null) { conn.close(); }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return bean;
    }

    private Book getBookBeanData(ResultSet rs) {
        Book bean = new Book();
        try {
        	String priceString = rs.getString("price").replace(",", "");
			int price = Integer.parseInt(priceString);
			String book_rating = rs.getString("rating");
			if(book_rating == null || book_rating.trim().isEmpty()) {
				
				book_rating = "0.0";
			}
			String descrip = rs.getString("description");
			if(descrip == null) {
				descrip = "";
			}			
			bean.setCnt(rs.getInt("cnt"));
            bean.setBook_name(rs.getString("book_name"));
			bean.setPrice(price);
			bean.setCategory(rs.getString("category"));
			bean.setRating(Float.parseFloat(book_rating));
            bean.setDate(rs.getString("date"));
			bean.setImg(rs.getString("img"));
            bean.setPerson_name(rs.getString("person_name"));
            bean.setPublisher(rs.getString("publisher"));
			bean.setDescription(descrip);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return bean;
    }

    public List<Book> getBestSellers() throws Exception {
        List<Book> lists = new ArrayList<>();
        String sql = "SELECT * FROM booklist WHERE rating >= 4.0 " +
                     "ORDER BY rating DESC, cnt DESC LIMIT 25";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;

        try {
            conn = super.getConnection(); // 데이터베이스 연결
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Book book = getBookBeanData(rs); // ResultSet에서 Book 객체 생성
                lists.add(book); // 리스트에 추가
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw e; // 예외 발생 시 상위로 전달
        } finally {
            try {
                if (rs != null) { rs.close(); }
                if (pstmt != null) { pstmt.close(); }
                if (conn != null) { conn.close(); }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        
        return lists; // 베스트셀러 도서 목록 반환
    }

    public List<Book> getNewBooks() throws Exception {
        String sql = "SELECT * FROM booklist " +
                     "ORDER BY date DESC LIMIT 12";
        List<Book> lists = new ArrayList<>();
        // Logic remains the same...
        // ...
        return lists;
    }

    public List<Book> getPopularBooks() throws Exception {
        String sql = "SELECT * FROM booklist " +
                     "ORDER BY rating DESC LIMIT 12";
        List<Book> lists = new ArrayList<>();
        // Logic remains the same...
        // ...
        return lists;
    }

    public List<Book> getPickBooks() throws Exception {
        String sql = "SELECT * FROM booklist WHERE rating >= 4.5 " +
                     "ORDER BY date DESC LIMIT 12";
        List<Book> lists = new ArrayList<>();
        // Logic remains the same...
        // ...
        return lists;
    }

    public List<Book> getRecentSearched() throws Exception {
        String sql = "SELECT * FROM booklist " +
                     "WHERE date >= DATE_SUB(NOW(), INTERVAL 7 DAY) " +
                     "ORDER BY cnt DESC LIMIT 12";
        List<Book> lists = new ArrayList<>();
        // Logic remains the same...
        // ...
        return lists;
    }

    public List<Book> searchBooks(String keyword, String category) throws Exception {
        String sql = "SELECT * FROM booklist WHERE 1=1 ";
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql += "AND (book_name LIKE ? OR description LIKE ?) ";
        }
        if (category != null && !category.trim().isEmpty()) {
            sql += "AND category = ? ";
        }
        sql += "ORDER BY cnt DESC";

        List<Book> lists = new ArrayList<>();
        // Logic remains the same...
        // ...
        return lists;
    }

	public List<String> getCategory() {
		// TODO Auto-generated method stub
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select distinct category from booklist";
				List<String> categoryList = null;
				
				try{
					conn = super.getConnection();
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					categoryList = new ArrayList<String>();
					
					while(rs.next()) {
						categoryList.add(rs.getString("category"));
					}
					
				}catch (Exception e1) {
					// TODO: handle exception
					e1.printStackTrace();
				}finally {
					try {
						if(rs!=null) {rs.close();}
						if(pstmt!=null) {pstmt.close();}
						if(conn!=null) {conn.close();}
					}catch (Exception e2) {
						// TODO: handle exception
						e2.printStackTrace();
					}
				}
				
				return categoryList;
	}

	public List<Book> getCategorySearch(Paging pageInfo, String text) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet  rs = null;
		List<Book> blist = null;
		String mode = pageInfo.getMode() ;
        boolean bool = pageInfo.equals(null) || pageInfo.equals("null") || mode.equals("")|| mode.equals("all");				
		
        String sql = "SELECT cnt, book_name, price, category, rating, date, person_name , publisher, img, DESCRIPTION";
		sql +=" FROM(SELECT cnt, book_name, price, category, rating, date, person_name , publisher, img, DESCRIPTION,";
		sql +=" ROW_NUMBER() OVER (ORDER BY cnt ASC) AS ranking";
		sql +=" FROM booklist";
		if(!bool) {
			sql += " WHERE category = ? AND book_name LIKE ?";
		}
		else {
			sql += " WHERE book_name LIKE ?";
		}
		sql += " ) AS ranked_books";
		sql += " WHERE ranking BETWEEN ? AND ?";
		
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			if(!bool) {
				pstmt.setString(1, pageInfo.getMode());
				pstmt.setString(2, "%" + text + "%");
				pstmt.setInt(3, pageInfo.getBeginRow());
				pstmt.setInt(4, pageInfo.getEndRow());
			}
			else {
				pstmt.setString(1, "%" + text + "%");
				pstmt.setInt(2, pageInfo.getBeginRow());
				pstmt.setInt(3, pageInfo.getEndRow());
			}
			rs = pstmt.executeQuery();
			blist = new ArrayList<Book>();
			
			while(rs.next()) {
				Book bean = this.getBeanData(rs);
				blist.add(bean);
				
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
				
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
		return blist;
	}

	public int getSearchTotalCount(String category, String text) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int tCount = 0;
		boolean bool = category == null || category.equals("all");
		String sql = "select count(*) AS cnt";
		sql += " From booklist";
		if(!bool) {
			sql += " where category = ? AND book_name LIKE ?";
		}
		else {
			sql += " where book_name LIKE ? ";
		}
		
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			if(!bool) {
				pstmt.setString(1, category);
				pstmt.setString(2, "%" + text + "%");
			}
			else {
				pstmt.setString(1, "%" + text + "%");
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				tCount = rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {rs.close();}
				if(conn != null) {rs.close();}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return tCount;
	}	
}
