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
        request.setAttribute("reviews", reviews);
        super.gotoPage("review/reviewList.jsp");
    }

    private void showReviewDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int reviewIdx = Integer.parseInt(request.getParameter("reviewIdx"));
        Review review = reviewDao.selectReviewByIdx(reviewIdx);
        request.setAttribute("review", review);
        super.gotoPage("review/reviewDetail.jsp");
    }
}