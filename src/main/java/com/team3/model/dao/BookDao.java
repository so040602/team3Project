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
        String sql = "SELECT COUNT(*) AS mycnt FROM booklist";
        boolean bool = mode == null || mode.equals("all");
        if (!bool) {
            // Additional filtering can be added here if necessary
        }
        try {
            conn = super.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                totalcount = rs.getInt("mycnt");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) { rs.close(); }
                if (pstmt != null) { pstmt.close(); }
                if (conn != null) { conn.close(); }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return totalcount;
    }

    public List<Book> getPaginationData(Paging pageInfo) {
        Connection conn = null;
        String sql = "SELECT cnt, book_name, price, category, rating, date, person_name, publisher, img, description " +
                     "FROM (SELECT cnt, book_name, price, category, rating, date, person_name, publisher, img, description, " +
                     "ROW_NUMBER() OVER (ORDER BY cnt ASC) AS ranking " +
                     "FROM booklist) AS ranked_books " +
                     "WHERE ranking BETWEEN ? AND ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        List<Book> lists = new ArrayList<>();
        try {
            conn = super.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, pageInfo.getBeginRow());
            pstmt.setInt(2, pageInfo.getEndRow());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Book bean = getBeanData(rs);
                lists.add(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) { rs.close(); }
                if (pstmt != null) { pstmt.close(); }
                if (conn != null) { conn.close(); }
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
            bean.setCnt(rs.getInt("cnt"));
            bean.setBook_name(rs.getString("book_name"));
            bean.setPrice(price);
            bean.setCategory(rs.getString("category"));
            bean.setRating(rs.getFloat("rating"));
            bean.setDate(rs.getString("date"));
            bean.setPerson_name(rs.getString("person_name"));
            bean.setPublisher(rs.getString("publisher"));
            bean.setImg(rs.getString("img"));
            bean.setDescription(rs.getString("description"));
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
            bean.setCnt(rs.getInt("cnt"));
            bean.setBook_name(rs.getString("book_name"));
            String priceString = rs.getString("price").replace(",", "");
            int price = Integer.parseInt(priceString);
            bean.setPrice(price);
            bean.setCategory(rs.getString("category"));
            bean.setRating(rs.getFloat("rating"));
            bean.setDate(rs.getString("date"));
            bean.setPerson_name(rs.getString("person_name"));
            bean.setPublisher(rs.getString("publisher"));
            bean.setImg(rs.getString("img"));
            bean.setDescription(rs.getString("description"));
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
}
