package com.team3.controller.review;

import com.team3.controller.SuperClass;
import com.team3.model.dao.ReviewDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ReviewDeleteController extends SuperClass {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doGet(request, response);
        
        ReviewDao dao = new ReviewDao();
        
        try {
            int reviewIdx = Integer.parseInt(request.getParameter("reviewIdx"));
            boolean isSuccess = dao.deleteReview(reviewIdx);
            
            if (isSuccess) {
            	response.sendRedirect(request.getContextPath() + "/coolapp?opsmode=reviewList");
            } else {
                throw new Exception("리뷰 삭제 실패");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "리뷰 삭제 중 오류가 발생했습니다.");
            super.gotoPage("common/error.jsp");
        }
    }
}