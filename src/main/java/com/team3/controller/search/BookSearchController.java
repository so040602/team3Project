package com.team3.controller.search;

import com.team3.controller.SuperClass;
import com.team3.model.dao.BookDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BookSearchController extends SuperClass {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doPost(request, response);

        try {
            // keyword 파라미터 검증
            String keyword = request.getParameter("keyword");
            if (keyword == null || keyword.trim().isEmpty()) {
                setAlertMessage("검색어를 입력해주세요.");
                response.sendRedirect(request.getContextPath() + "/coolapp");
                return;
            }

            // 도서 목록 페이지로 리다이렉트하면서 검색어 전달
            response.sendRedirect(request.getContextPath() + 
                "/coolapp?opsmode=bookList&search=" + 
                java.net.URLEncoder.encode(keyword, "UTF-8"));

        } catch (Exception e) {
            e.printStackTrace();
            setAlertMessage("검색 중 오류가 발생했습니다.");
            response.sendRedirect(request.getContextPath() + "/coolapp");
        }
    }
}