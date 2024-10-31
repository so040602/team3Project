package com.team3.controller.review;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Review;
import com.team3.model.dao.ReviewDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ReviewInsertController extends SuperClass {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doGet(request, response);
        super.gotoPage("review/reviewInsert.jsp");
    }
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doPost(request, response);
        
        ReviewDao dao = new ReviewDao();
        Review review = new Review();
        
        try {
            review.setReview_title(request.getParameter("review_title"));
            review.setReview_body(request.getParameter("review_body"));
            review.setMemid((String) request.getSession().getAttribute("memid"));
            
            boolean isSuccess = dao.insertReview(review);
            
            if (isSuccess) {
            	response.sendRedirect(request.getContextPath() + "/coolapp?opsmode=reviewList");
            } else {
                throw new Exception("리뷰 등록 실패");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "리뷰 등록 중 오류가 발생했습니다.");
            super.gotoPage("common/error.jsp");
        }
    }
}