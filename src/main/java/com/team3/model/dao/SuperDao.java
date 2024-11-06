package com.team3.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class SuperDao {
	protected Connection conn = null ; // 접속 객체
	
//	public Connection getConnection() {
		// step02. 접속 객체를 구해주는 범용 메소드
//		try {
//			String url = "jdbc:oracle:thin:@localhost:1521:xe" ;
//			String id = "shopping" ;
//			String password = "oracle" ;
//			
//			this.conn = DriverManager.getConnection(url, id, password) ;
//			if(conn == null) {System.out.println("접속 실패");} 			
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}		
	
	public SuperDao() { // step01. driver 메모리에 로딩
		
		//String driver = "oracle.jdbc.driver.OracleDriver" ;
		//String driver = "org.mariadb.jdbc.Driver";
			
		//try {
		//	Class.forName(driver) ;
		//} catch (Exception e) {
		//	e.printStackTrace();
		//}
	}
		
	public Connection getConnection() {
		
		String os = System.getProperty("os.name").toLowerCase();
		String url = null;
		
	    try {
	        // Load the MariaDB JDBC driver
	        Class.forName("org.mariadb.jdbc.Driver");

	        // Database connection details
	        if (os.contains("win")) {
		        url = "jdbc:mariadb://192.168.0.160:3306/bonspring";	        	
	        } else {
	        	url = "jdbc:mariadb://192.168.0.160:3306/bonspring";	        
	        }

	        String userid = "team3";
	        String password = "team333";
	            
	        // Establish the connection
	        this.conn = DriverManager.getConnection(url, userid, password);
	            
	        // Check if the connection is successful
	        if (conn != null) {
	            System.out.println("DB Connection is successful");
	        } else {
	            System.out.println("DB Connection is failed");
	        }
	            
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
		return conn ;
	}	


}
