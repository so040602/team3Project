package com.team3.controller.review;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Review;
import com.team3.model.dao.ReviewDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ReviewDetailController extends SuperClass {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doGet(request, response);
        
        ReviewDao dao = new ReviewDao();
        
        try {
            int reviewIdx = Integer.parseInt(request.getParameter("reviewIdx"));
            Review review = dao.selectReviewById(reviewIdx);
            
            if (review != null) {
                dao.incrementReviewViews(reviewIdx);
                request.setAttribute("review", review);
                super.gotoPage("review/reviewDetail.jsp");
            } else {
                response.sendRedirect("review/reviewList.jsp");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "리뷰를 불러오는 중 오류가 발생했습니다.");
            super.gotoPage("common/error.jsp");
        }
    }
}
