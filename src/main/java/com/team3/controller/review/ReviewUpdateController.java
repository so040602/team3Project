package com.team3.controller.review;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Review;
import com.team3.model.dao.ReviewDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ReviewUpdateController extends SuperClass {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doGet(request, response);
        
        ReviewDao dao = new ReviewDao();
        
        try {
            int reviewIdx = Integer.parseInt(request.getParameter("reviewIdx"));
            Review review = dao.selectReviewById(reviewIdx);
            
            if (review != null) {
                request.setAttribute("review", review);
                super.gotoPage("review/reviewUpdate.jsp");
            } else {
                response.sendRedirect("review/reviewList.jsp");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "리뷰 정보를 불러오는 중 오류가 발생했습니다.");
            super.gotoPage("common/error.jsp");
        }
    }
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doPost(request, response);
        
        ReviewDao dao = new ReviewDao();
        Review review = new Review();
        
        try {
            review.setReviewidx(Integer.parseInt(request.getParameter("reviewIdx")));
            review.setReview_title(request.getParameter("review_title"));
            review.setReview_body(request.getParameter("review_body"));
            
            boolean isSuccess = dao.updateReview(review);
            
            if (isSuccess) {
                response.sendRedirect("review/reviewDetail.jsp?reviewIdx=" + review.getReviewidx());
            } else {
                throw new Exception("리뷰 수정 실패");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "리뷰 수정 중 오류가 발생했습니다.");
            super.gotoPage("common/error.jsp");
        }
    }
}