package com.team3.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.team3.model.bean.Member;

public class MemberDao extends SuperDao {
	
	public int updateData(Member bean) {
		System.out.println("updateData");
		System.out.println(bean);
		
		PreparedStatement pstmt = null;
		String sql = " update TEAM3_MEMBER set memname = ?, gender = ?, birth = ?, ";
			   sql += " mobile = ?, email = ?, addr01 = ?, addr02 = ? " ;
			   sql += " where memid = ? and mempwd = ?" ;
		
		int cnt = -99999 ;
		
		try {
			conn = super.getConnection() ;
			conn.setAutoCommit(false); 
			
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setString(1, bean.getMemname());
			pstmt.setString(2, bean.getGender());
			pstmt.setString(3, bean.getBirth());
			pstmt.setString(4, bean.getMobile());
			pstmt.setString(5, bean.getEmail());
			pstmt.setString(6, bean.getAddr01());
			pstmt.setString(7, bean.getAddr02());
			pstmt.setString(8, bean.getMemid());		
			pstmt.setString(9, bean.getMempwd());
						
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
	

	public int insertData(Member bean) {
		// bean을 사용하여 데이터 베이스에 추가합니다.
		System.out.println("insertData");
		System.out.println(bean);
		
		PreparedStatement pstmt = null;
		String sql = " insert into TEAM3_MEMBER(memid, mempwd, memname, "
					+ "gender, birth, email, mobile, addr01, addr02, regdate)" ;
		sql += " values(?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())" ;

		int cnt = -99999 ;
		
		try {
			conn = super.getConnection() ;
			conn.setAutoCommit(false); 
			
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setString(1, bean.getMemid());
			pstmt.setString(2, bean.getMempwd());
			pstmt.setString(3, bean.getMemname());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getBirth());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getMobile());
			pstmt.setString(8, bean.getAddr01());
			pstmt.setString(9, bean.getAddr02());

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
	
	
	// 회원의 아이디와 비밀 번호를 이용하여 회원이 존재하는 지 체크합니다.
	public Member getDataByPk(String id, String password) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from TEAM3_MEMBER " ;
		sql += " where memid = ? and mempwd = ? " ;
		
		Member bean = null ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) {
				bean = getBeanData(rs);
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
	
	// 회원 가입 아이디를 사용할 수 있는지 체크합니다.
	public Member getMemberByMemid(String memid) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from TEAM3_MEMBER where memid = ? ";
		
		Member bean = null ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, memid);
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) {
				bean = getBeanData(rs);
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
	
	private Member getBeanData(ResultSet rs) {
		// ResultSet 객체를 사용하여 Bean 객체에 데이터를 설정합니다.
		Member bean = new Member() ;
		
		try {
			bean.setMemidx(rs.getInt("memidx"));
			bean.setMemid(rs.getString("memid"));
			bean.setMemname(rs.getString("memname"));
			bean.setGender(rs.getString("gender"));
			bean.setEmail(rs.getString("email"));			
			bean.setMobile(rs.getString("mobile"));	
			bean.setRemark(rs.getString("remark"));
			bean.setAddr01(rs.getString("addr01"));
			bean.setAddr02(rs.getString("addr02"));
			bean.setLogcnt(rs.getInt("logcnt"));
			bean.setDropout(rs.getInt("dropout"));
			
			// 날짜 타입
			bean.setBirth(String.valueOf(rs.getDate("birth")));
			bean.setRegdate(String.valueOf(rs.getDate("regdate")));
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return bean;
	}


	// 회원의 아이디 정보를 이용하여 회원 정보를 반환합니다.
	public Member getDataByPk(String mem_id) {
		Member bean = null;
//		Member bean = new Member(mem_id, "김호철", "abc123", "female", "2024/08/25", 
//				"미혼", 100, "역삼", "kim9", 11, "탁구,축구," );
		
		return bean ;
	}
	
	// 회원 목록 보기 기능) 회원 전체 목록을 반환해 줍니다.
	public List<Member> getDataList(){
		List<Member> datalist = new ArrayList<Member>() ;
		
//		datalist.add(new Member("kimho", "김호철", "abc123", "female", "2023/08/20", "미혼", 100, "마포", "kim9", 0, "탁구,축구,"));
//		datalist.add(new Member("park", "박혁신", "abc123", "male", "2002/06/24", "미혼", 200, "용산", "kim9", 0, "농구,배구,"));		
//		datalist.add(new Member("choi", "최만위", "abc123", "female", "2020/12/12", "이혼", 300, "강남", "soon", 0, "농구,배구,"));		
//		datalist.add(new Member("kim", "김동섭", "abc123", "male", "2023/08/20", "결혼", 400, "마포", "soon", 0, "탁구,축구,"));
//		datalist.add(new Member("lee", "이수돌", "abc123", "male", "2023/08/20", "이혼", 500, "서대문", "kim9", 0, "탁구,축구,"));
		
		return datalist ;
	}


	public List<Member> selectAll() {
		List<Member> lists = new ArrayList<Member>();
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		
		String sql = " select * from TEAM3_MEMBER" ;
		sql += " order by memidx desc " ;		
		
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


	public Member getMemDataByMemId(String memid) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from TEAM3_MEMBER " ;
		sql += " where memid = ? " ;
		
		Member bean = null ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setString(1, memid);
			
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) {
				bean = getBeanData(rs);
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
