package com.team3.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.team3.model.bean.Book;
import com.team3.model.bean.BookOutCur;
import com.team3.model.bean.OutCart;
import com.team3.model.bean.Paging;


public class BookDao extends SuperDao {

    public int getTotalCount(String mode) {
    	int totalcount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as mybook_idx from booklist";
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
				totalcount = rs.getInt("mybook_idx");
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
		String sql = " SELECT book_idx, book_name, price, category, rating, date, person_name , publisher, img, description";
		sql += " FROM (SELECT book_idx, book_name, price, category, rating, date, person_name , publisher, img, description,";
		sql += " ROW_NUMBER() OVER (ORDER BY book_idx ASC) AS ranking";
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
			else {
				pstmt.setInt(1, pageInfo.getBeginRow());
				pstmt.setInt(2, pageInfo.getEndRow());
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
    
    public List<Book> getAllBooks() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Book> lists = new ArrayList<Book>();
        
        String sql = "SELECT book_idx, book_name, price, category, rating, date, "
                   + "person_name, publisher, img, description "
                   + "FROM booklist ORDER BY book_idx ASC";
        
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
			bean.setbook_idx(rs.getInt("book_idx"));
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

    public Book getDataByPk(int book_idx) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;		
        String sql = "SELECT * FROM booklist WHERE book_idx = ?";
        Book bean = null;
        try {
            conn = super.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, book_idx);
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
			bean.setbook_idx(rs.getInt("book_idx"));
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
        String sql = "SELECT * FROM booklist " +
                     "ORDER BY rating DESC, book_idx DESC LIMIT 10";
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
    	List<Book> lists = new ArrayList<>();
    	String sql = "SELECT * FROM booklist " +
                "ORDER BY date DESC LIMIT 10";
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
        
        return lists; // 신간 도서 목록 반환
    }


   
    public int searchBookIdx(String keyword) {
    	   Connection conn = null;
    	   PreparedStatement pstmt = null;
    	   ResultSet rs = null;
    	   int bookIdx = -1; 
    	   
    	   String sql = "SELECT book_idx FROM booklist "
    	              + "WHERE book_name LIKE ? OR person_name LIKE ? "
    	              + "ORDER BY book_idx ASC LIMIT 1";
    	              
    	   try {
    	       conn = super.getConnection(); 
    	       pstmt = conn.prepareStatement(sql);
    	       pstmt.setString(1, "%" + keyword + "%");
    	       pstmt.setString(2, "%" + keyword + "%");
    	       rs = pstmt.executeQuery();
    	       
    	       if(rs.next()) {
    	           bookIdx = rs.getInt("book_idx");
    	       }
    	       
    	   } catch (Exception e) {
    	       e.printStackTrace();
    	   } finally {
    	       try {
    	           if(rs != null) {rs.close();}
    	           if(pstmt != null) {pstmt.close();}  
    	           if(conn != null) {conn.close();}
    	       } catch (Exception e) {
    	           e.printStackTrace();
    	       }
    	   }
    	   
    	   return bookIdx;
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
		
        String sql = "SELECT book_idx, book_name, price, category, rating, date, person_name , publisher, img, DESCRIPTION";
		sql +=" FROM(SELECT book_idx, book_name, price, category, rating, date, person_name , publisher, img, DESCRIPTION,";
		sql +=" ROW_NUMBER() OVER (ORDER BY book_idx ASC) AS ranking";
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
		String sql = "select count(*) AS book_idx";
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
				tCount = rs.getInt("book_idx");
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

	public List<Book> getRatingPaginationData(Paging pageInfo) {
		Connection conn = null;
		String mode = pageInfo.getMode() ;
		String keyword = pageInfo.getKeyword();
        boolean bool = pageInfo.equals(null) || pageInfo.equals("null") || mode.equals("")|| mode.equals("all");
        boolean bool1 = pageInfo.equals(null) || pageInfo.equals("null") || keyword.equals("");
		String sql = " SELECT book_idx, book_name, price, category, rating, date, person_name , publisher, img, description";
		sql += " FROM (SELECT book_idx, book_name, price, category, rating, date, person_name , publisher, img, description,";
		sql += " ROW_NUMBER() OVER (ORDER BY rating DESC) AS ranking";
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
			else {
				pstmt.setInt(1, pageInfo.getBeginRow());
				pstmt.setInt(2, pageInfo.getEndRow());
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

	public List<Book> getRecentPaginationData(Paging pageInfo) {
		Connection conn = null;
		String mode = pageInfo.getMode() ;
		String keyword = pageInfo.getKeyword();
        boolean bool = pageInfo.equals(null) || pageInfo.equals("null") || mode.equals("")|| mode.equals("all");
        boolean bool1 = pageInfo.equals(null) || pageInfo.equals("null") || keyword.equals("");
		String sql = " SELECT book_idx, book_name, price, category, rating, date, person_name , publisher, img, description";
		sql += " FROM (SELECT book_idx, book_name, price, category, rating, date, person_name , publisher, img, description,";
		sql += " ROW_NUMBER() OVER (ORDER BY date DESC) AS ranking";
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
			else {
				pstmt.setInt(1, pageInfo.getBeginRow());
				pstmt.setInt(2, pageInfo.getEndRow());
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

	public String getCheckOut(int bookId) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement prsmt = null;
		ResultSet rs = null;
		String sql = "select checkout from booklist";
		sql += " where book_idx = ?";
		String checkOut = "";
		
		try {
			conn = super.getConnection();
			prsmt = conn.prepareStatement(sql);
			prsmt.setInt(1, bookId);
			rs = prsmt.executeQuery();
			
			while(rs.next()) {
				checkOut = rs.getString("checkout");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(prsmt != null) {prsmt.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return checkOut;
	}

	public int getOutCartCnt(Integer midx) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement prsmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = " select count(*) AS cnt From outcart";
		sql += " where memidx = ? AND book_status='대기'";
		
		try {
			conn = super.getConnection();
			prsmt = conn.prepareStatement(sql);
			prsmt.setInt(1, midx);
			rs = prsmt.executeQuery();
			
			while(rs.next()) {
				count = rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(prsmt != null) {prsmt.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
		return count;
	}

	public int insertOutCart(int bookId, int midx) {
		int cnt = -99999;
		Connection conn = null;
		PreparedStatement checkStmt = null;
		PreparedStatement insertStmt = null;
		ResultSet rs = null;
		String selectsql = " select count(*) From outcart";
		selectsql += " where book_idx = ? And memidx = ?";
		
		String sql = " insert into outcart (memidx, book_idx, regdate)";
		sql += " values(?,?, CURRENT_TIMESTAMP)";
		
		try {
			conn = super.getConnection();
			checkStmt = conn.prepareStatement(selectsql);
			checkStmt.setInt(1, bookId);
			checkStmt.setInt(2, midx);
			rs = checkStmt.executeQuery();
			
			if(rs.next() && rs.getInt(1) > 0 ) {
				return 0 ;
			}
			
			insertStmt = conn.prepareStatement(sql);
			insertStmt.setInt(1, midx);
	        insertStmt.setInt(2, bookId);
			cnt = insertStmt.executeUpdate();
			
			conn.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(checkStmt != null) {checkStmt.close();}
				if(insertStmt != null) {insertStmt.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		// TODO Auto-generated method stub
		return cnt;
	}

	public List<OutCart> getOutCartList(int memidx) {
		Connection conn = null;
		PreparedStatement prsmt = null;
		ResultSet rs = null;
		List<OutCart> cartList = null;
		String sql = "SELECT b.book_name, b.category, b.person_name, b.publisher, b.img, b.date,";
		sql += " b.checkout, o.oid, o.regdate, o.book_idx, memidx, memname";
		sql += " FROM booklist b";
		sql += " Right JOIN (";
		sql += "	select o.oid, o.regdate, o.book_idx, m.memidx, m.memname";
		sql += "	from outcart o";
		sql += "	LEFT JOIN team3_member m ON o.memidx = m.memidx";
		sql += "	where o.memidx = ? AND o.book_status = '대기' ";
		sql += ") AS o ON b.book_idx = o.book_idx";
		sql += " order by regdate";
		
		try {
			conn = super.getConnection();
			prsmt = conn.prepareStatement(sql);
			prsmt.setInt(1, memidx);
			rs = prsmt.executeQuery();
			cartList = new ArrayList<OutCart>();
			
			while(rs.next()) {
				OutCart bean = new OutCart();
				bean = this.getOutCartData(rs);
				cartList.add(bean);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		// TODO Auto-generated method stub
		return cartList;
	}

	private OutCart getOutCartData(ResultSet rs) {
		// TODO Auto-generated method stub
		OutCart bean = new OutCart();
		try {
			bean.setBook_idx(rs.getInt("book_idx"));
			bean.setMemidx(rs.getInt("memidx"));
			bean.setOid(rs.getInt("oid"));
			bean.setBook_name(rs.getString("book_name"));
			bean.setCategory(rs.getString("category"));
			bean.setPerson_name(rs.getString("person_name"));
			bean.setPublisher(rs.getString("publisher"));
			bean.setImg(rs.getString("img"));
			bean.setRegdate(rs.getString("regdate"));
			bean.setCheckout(rs.getString("checkout"));
			bean.setMemname(rs.getString("memname"));
			bean.setDate(rs.getString("date"));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}

		return bean;
	}

	public int searchOutBook(int bookId, int midx) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement prsmt = null;
		ResultSet rs = null;
		int scnt = -99999;
		String sql = "select * from bookout where book_idx = ? AND memidx = ? AND returns = '대출'";
		
		try {
			conn = super.getConnection();
			prsmt = conn.prepareStatement(sql);
			prsmt.setInt(1, bookId);
			prsmt.setInt(2, midx);
			rs = prsmt.executeQuery();
			
			if(rs.next()) {
				//데이터가 존재하는 경우
				scnt = 0;
			}else {
				//데이터가 존재하지 않는 경우
				scnt = -1;
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(prsmt != null) {rs.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}				
		return scnt;
	}

	public int insertbookOut(int bookId, int midx) {
		// TODO Auto-generated method stub
		Connection conn =null;
		PreparedStatement prsmt = null;
		int cnt = -99999;
		String sql = "insert into bookout(memidx, book_idx, regdate)";
		sql += " values(?, ?, CURRENT_TIMESTAMP)";
		
		try {
			conn = super.getConnection();
			prsmt = conn.prepareStatement(sql);
			prsmt.setInt(1, midx);
			prsmt.setInt(2, bookId);
			cnt = prsmt.executeUpdate();
			
			conn.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}finally {
			try {
				if(prsmt !=null) {prsmt.close();}
				if(conn != null) {conn.close();}				
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
		return cnt;
	}

	public int updateOutCart(int bookId, int midx) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement prsmt = null;
		PreparedStatement bookprsmt = null;
		int cnt = -99999;
		String sql = " update outcart set book_status = '완료' , regdate = CURRENT_TIMESTAMP";
		sql += " where book_idx = ? AND memidx = ?";
		String bookSql = " update booklist set checkout = '불가능' ";
		bookSql += " where book_idx = ?";
		
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false); //자동 커밋 비활성화
			prsmt = conn.prepareStatement(sql);
			bookprsmt = conn.prepareStatement(bookSql);
			prsmt.setInt(1, bookId);
			prsmt.setInt(2, midx);
			bookprsmt.setInt(1, bookId);
			cnt = prsmt.executeUpdate();
			cnt = bookprsmt.executeUpdate();
			
			conn.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}finally {
			try {
				if(prsmt != null) {prsmt.close();}
				if(bookprsmt !=null) {bookprsmt.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
		return cnt;
	}

	public int getCheckOutCount(int midx) {
		Connection conn = null;
		PreparedStatement prsmt = null;
		ResultSet rs = null;
		int cnt = 0;
		String sql = " select count(*) AS cnt from bookout";
		sql += " where memidx = ? AND returns = '대출'";
		
		try {
			conn = super.getConnection();
			prsmt = conn.prepareStatement(sql);
			prsmt.setInt(1, midx);
			rs = prsmt.executeQuery();
			
			while(rs.next()) {
				cnt = rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {prsmt.close();}
				if(prsmt != null) {prsmt.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
		return cnt;
	}

	public List<BookOutCur> CurrentBookOut(Integer memidx) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " SELECT b.book_idx ,b.book_name, b.category, b.person_name,";
		sql += "  b.publisher, b.img, b.date, memidx, memname, bo.regdate";
		sql += " FROM booklist b RIGHT OUTER JOIN ";
		sql += " (SELECT m.memidx, m.memname, bo.book_idx, bo.regdate";
		sql += " FROM bookout bo LEFT OUTER JOIN team3_member m ON m.memidx = bo.memidx";
		sql += " where bo.returns = '대출' AND bo.memidx = ?)";
		sql += " AS bo ON b.book_idx = bo.book_idx";
		List<BookOutCur> outlist = null;
		
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memidx);
			rs = pstmt.executeQuery();
			outlist = new ArrayList<BookOutCur>();
			
			while(rs.next()) {
				BookOutCur bean = getBookOutCurrent(rs);
				outlist.add(bean);
			}
			
		} catch (Exception e) {
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
		return outlist;
	}

	private BookOutCur getBookOutCurrent(ResultSet rs) {
		// TODO Auto-generated method stub
		BookOutCur bean = null;
		try {
			Date date = rs.getDate("regdate");
			
			SimpleDateFormat rdate = new SimpleDateFormat("yyyy년MM월dd일");
			String regdate = rdate.format(date);
			bean = new BookOutCur();
			bean.setBook_idx(rs.getInt("book_idx"));
			bean.setBook_name(rs.getString("book_name"));
			bean.setCategory(rs.getString("category"));
			bean.setPerson_name(rs.getString("person_name"));
			bean.setPublisher(rs.getString("publisher"));
			bean.setImg(rs.getString("img"));
			bean.setDate(rs.getString("date"));
			bean.setMemidx(rs.getInt("memidx"));
			bean.setMemname(rs.getString("memname"));
			bean.setRegdate(regdate);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return bean;
	}

	public int updateBookOut(int bookId, int memidx) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement bookout_prsmt = null;
		PreparedStatement booklist_prsmt = null;
		int cnt = -99999;
		String bookout_sql = "update bookout set returns = '반납'";
		bookout_sql += " where book_idx = ? AND memidx = ?";
		String booklist_sql = "update booklist set checkout = '가능'";
		booklist_sql += " where book_idx = ?";
		
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false); //자동 커밋 비활성화
			
			bookout_prsmt = conn.prepareStatement(bookout_sql);
			booklist_prsmt = conn.prepareStatement(booklist_sql);
			bookout_prsmt.setInt(1, bookId);
			bookout_prsmt.setInt(2, memidx);
			
			
			cnt = bookout_prsmt.executeUpdate();
			
			if(cnt > 0) {
				booklist_prsmt.setInt(1, bookId);
				cnt += booklist_prsmt.executeUpdate();
			}
			
			
			conn.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			try {
				if(conn != null) {
				conn.rollback();
				}
			} catch (SQLException e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}finally {
			try {
				if(bookout_prsmt != null) {bookout_prsmt.close();}
				if(booklist_prsmt != null) {booklist_prsmt.close();}
				if(conn != null) {conn.close();}				
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return cnt;
	}
}
