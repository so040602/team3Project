package com.team3.controller;

import java.util.List;
import com.team3.controller.SuperClass;
import com.team3.model.bean.Book;
import com.team3.model.dao.BookDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class HomeController extends SuperClass {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doGet(request, response);
        
        BookDao dao = new BookDao();
        
        try {
            // 베스트셀러 도서 가져오기
            List<Book> bestSellers = dao.getBestSellers();
            request.setAttribute("bestSellers", bestSellers);
            
            // 신간 도서 가져오기
            List<Book> newBooks = dao.getNewBooks();
            request.setAttribute("newBooks", newBooks);
            
          
            
            // 페이지 이동
            super.gotoPage("book/bookMain.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "도서 정보를 불러오는 중 오류가 발생했습니다.");
            super.gotoPage("common/error.jsp");
        }
    }
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
    }
}
