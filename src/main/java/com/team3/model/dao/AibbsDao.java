package com.team3.model.dao;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.team3.model.bean.Aibbs;
import com.team3.model.bean.Board;
import com.team3.utility.AppConfig;

public class AibbsDao extends SuperDao {

	public List<Aibbs> selectAll() {
		// 게시물 전체 목록을 읽어 들입니다.
		List<Aibbs> lists = new ArrayList<Aibbs>();
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		// 게시물 번호 역순으로 정렬
		String sql = " SELECT * FROM TEAM3_AIBBS" ;
		sql += " ORDER BY brdidx desc" ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql);			
			
			rs = pstmt.executeQuery() ;
			
			while(rs.next()) {
				lists.add(getAibbsBeanData(rs)) ; 
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
	
	
	private Aibbs getAibbsBeanData(ResultSet rs) {
		Aibbs bean = null;
		
		try {
			bean = new Aibbs() ; 
			
			bean.setBrdidx(rs.getInt("brdidx"));
			bean.setMemid(rs.getString("memid"));
			bean.setBoardpwd(rs.getString("boardpwd"));
			bean.setSubtitle(rs.getString("subtitle"));
			bean.setContents(rs.getString("contents"));
			bean.setAttach01(rs.getString("attach01"));
			bean.setAttach02(rs.getString("attach02"));
			bean.setAttach03(rs.getString("attach03"));
			bean.setAttach04(rs.getString("attach04"));
			bean.setCodefile(rs.getString("codefile"));
			bean.setReadcnt(rs.getInt("readcnt"));
			bean.setGroupnum(rs.getInt("groupnum"));
			bean.setOrdernum(rs.getInt("ordernum"));
			bean.setDepthcnt(rs.getInt("depthcnt"));			
			bean.setLikes(rs.getInt("likes"));
			bean.setHates(rs.getInt("hates"));
			
			bean.setRegdate(String.valueOf(rs.getDate("regdate")));
			bean.setUpdated(String.valueOf(rs.getDate("updated")));
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
		
		return bean ;
	}

	public List<Aibbs> getAibbsDataList(){
		List<Aibbs> lists = new ArrayList<Aibbs>();
		// lists.add(new Board(10, "hong", "abc123", "jsp 프로그래밍", "잼있어요", 10, "2024/08/28", 0));
		return lists;
	}
	
    /* 
     * Key Changes:
     * Try-With-Resources is preferred for automatic resource management.
		Try-With-Resources: The try-with-resources statement automatically closes 
		  Connection and PreparedStatement, reducing boilerplate code and 
		  minimizing the risk of resource leaks.
		Error Handling: Added a separate catch block for handling rollback exceptions.
		Code Cleanliness: Simplified the code for better readability.
		By following these improvements, you ensure that resources are managed properly 
		and errors are handled more effectively.
     **/
	
	public int updateAibbsData(Aibbs bean) {
	    // bean을 사용하여 데이터베이스에 수정합니다.
	    System.out.println("updateData");
	    System.out.println(bean);

	    StringBuilder sql = new StringBuilder("UPDATE TEAM3_AIBBS SET subtitle = ?, contents = ?");
	    List<Object> paramList = new ArrayList<>();
	    
	    paramList.add(bean.getSubtitle());
	    paramList.add(bean.getContents());

	    // Add file attachments if they are not null
	    if (bean.getAttach01() != null) {
	        sql.append(", attach01 = ?");
	        paramList.add(bean.getAttach01());
	        removePreloadedFile("attach01", bean.getBrdidx());
	    }
	    if (bean.getAttach02() != null) {
	        sql.append(", attach02 = ?");
	        paramList.add(bean.getAttach02());
	        removePreloadedFile("attach02", bean.getBrdidx());
	    }
	    if (bean.getAttach03() != null) {
	        sql.append(", attach03 = ?");
	        paramList.add(bean.getAttach03());
	        removePreloadedFile("attach03", bean.getBrdidx());
	    }
	    if (bean.getAttach04() != null) {
	        sql.append(", attach04 = ?");
	        paramList.add(bean.getAttach04());
	        removePreloadedFile("attach04", bean.getBrdidx());
	    }
	    if (bean.getCodefile() != null) {
	        sql.append(", codefile = ?");
	        paramList.add(bean.getCodefile());
	        removePreloadedFile("codefile", bean.getBrdidx());
	    }

	    // Add update timestamp and where clause
	    sql.append(", updated = NOW() WHERE brdidx = ? AND boardpwd = ?");
	    paramList.add(bean.getBrdidx());
	    paramList.add(bean.getBoardpwd());
	    
	    System.out.println("bean.getBrdidx() : " + bean.getBrdidx());
	    System.out.println("bean.getBoardpwd() : " + bean.getBoardpwd());
	    
	    System.out.println("sql.toString() : " + sql.toString());
	    System.out.println("paramList : " + paramList);
	    System.out.println("++++++++++++++++++++++++++++++++++++++");

	    int cnt = -99999;

	    // Use try-with-resources for automatic resource management
	    try (Connection conn = super.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {

	        conn.setAutoCommit(false);

	        // Set parameters dynamically based on the collected list
	        for (int i = 0; i < paramList.size(); i++) {
	            pstmt.setObject(i + 1, paramList.get(i));
	        }

	        cnt = pstmt.executeUpdate();
	        conn.commit();

	    } catch (SQLException e) {
	        e.printStackTrace();
	        try {
	            // Rollback transaction on failure
	            if (conn != null) conn.rollback();
	        } catch (SQLException rollbackEx) {
	            rollbackEx.printStackTrace();
	        }
	    }

	    return cnt;
	}
	

	private void removePreloadedFile(String attachField, int brdidx) {
	    StringBuilder sql = new StringBuilder("SELECT ").append(attachField).append(" FROM TEAM3_AIBBS WHERE brdidx = ?");
	    String oldFileName = null;

	    try (Connection conn = super.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {

	        pstmt.setInt(1, brdidx);
	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	        	String fileUploadPath = AppConfig.getInstance().getFileUploadPath();
	            oldFileName = fileUploadPath + File.separator + rs.getString(attachField);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    if (oldFileName != null && !oldFileName.isEmpty()) {
	        System.out.println("Old file name to remove: " + oldFileName);
	        
	        try {
		        // Attempt to delete the file
		        File file = new File(oldFileName);
		        if (file.exists()) {
		            if (file.delete()) {
		                System.out.println("File deleted successfully: " + oldFileName);
		            } else {
		                System.err.println("Failed to delete file: " + oldFileName);
		            }
		        } else {
		            System.err.println("File not found: " + oldFileName);
		        }
	        } catch(Exception e) {
				e.printStackTrace();
	        }
	        
	    } else {
	        System.out.println("No file to remove.");
	    }
	}


	public int insertAibbsData(Aibbs bean) {
		// bean을 사용하여 데이터 베이스에 추가합니다.
		System.out.println("insertData");
		System.out.println(bean);
		
		PreparedStatement pstmt = null;
		String sql = " INSERT INTO TEAM3_AIBBS (memid, boardpwd, subtitle, contents, "
				   + " attach01, attach02, attach03, attach04, codefile, regdate)" ;
		sql += " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())" ;	 

		int cnt = -99999 ;
		
		try {
			conn = super.getConnection() ;
			conn.setAutoCommit(false); 
			
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setString(1, bean.getMemid());		
			pstmt.setString(2, bean.getBoardpwd());
			pstmt.setString(3, bean.getSubtitle());		
			pstmt.setString(4, bean.getContents());
			pstmt.setString(5, bean.getAttach01());
			pstmt.setString(6, bean.getAttach02());
			pstmt.setString(7, bean.getAttach03());
			pstmt.setString(8, bean.getAttach04());
			pstmt.setString(9, bean.getCodefile());
			
			cnt = pstmt.executeUpdate() ;
			
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
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return cnt ;
	}

	private void plusReadcnt(int brdidx) {
;
		String sql = " UPDATE TEAM3_AIBBS SET readcnt = readcnt + 1 ";
		sql += " WHERE brdidx = ? ";
		
		try (Connection conn = super.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setInt(1, brdidx);
			pstmt.executeQuery() ;
			
		} catch (Exception e) {
			e.printStackTrace();
		} 

	}
	
	public Aibbs getAibbsDataByPk(int brdidx) {
		
		plusReadcnt(brdidx); // 조회수 1회 증가시킴
		
		// 기본 키인 게시물 번호를 이용하여 게시물 정보를 반환합니다.
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " SELECT * FROM TEAM3_AIBBS " ;
		sql += " WHERE brdidx = ? " ;
		
		Aibbs bean = null ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, brdidx);
			
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) {
				bean = getAibbsBeanData(rs);
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
		
		return bean;
	}

}
