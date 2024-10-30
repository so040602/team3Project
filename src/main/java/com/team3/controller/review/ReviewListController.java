package com.team3.controller.review;

import java.util.List;
import com.team3.controller.SuperClass;
import com.team3.model.bean.Review;
import com.team3.model.dao.ReviewDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ReviewListController extends SuperClass {
    private ReviewDao reviewDao;

    public ReviewListController() {
        reviewDao = new ReviewDao();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doGet(request, response);
        
        String action = request.getParameter("action");
        
        if (action == null) {
            action = "list";
        }
        
        switch (action) {
            case "list":
                listReviews(request, response);
                break;
            case "detail":
                showReviewDetail(request, response);
                break;
            default:
                listReviews(request, response);
                break;
        }
    }

    private void listReviews(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<Review> reviews = reviewDao.selectAllReviews();
        if(reviews.size() == 0) {
        	System.out.println("값을 읽어올수 없습니다.");
        }
        for(Review bean : reviews) {
        	System.out.println(bean);
        }
        request.setAttribute("reviews", reviews);
        super.gotoPage("review/reviewList.jsp");
    }

    private void showReviewDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String reviewIdxParam = request.getParameter("reviewIdx");
        
        if (reviewIdxParam == null || reviewIdxParam.isEmpty()) {
            // 유효하지 않은 요청 처리 (예: 목록 페이지로 리다이렉션)
            response.sendRedirect("reviewList.jsp");
            return;
        }

        try {
            int reviewIdx = Integer.parseInt(reviewIdxParam);
            Review review = reviewDao.selectReviewByIdx(reviewIdx);
            
            if (review == null) {
                // 리뷰가 존재하지 않을 경우 처리
                response.sendRedirect("reviewList.jsp");
                return;
            }

            request.setAttribute("review", review);
            super.gotoPage("review/reviewDetail.jsp");
        } catch (NumberFormatException e) {
            // 잘못된 형식의 reviewIdx 처리
            response.sendRedirect("reviewList.jsp");
        }
    }
}
