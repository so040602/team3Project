package com.team3.controller.review;

import java.util.List;
import com.team3.controller.SuperClass;
import com.team3.model.bean.Review;
import com.team3.model.dao.ReviewDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ReviewListController extends SuperClass {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doGet(request, response);
        
        ReviewDao dao = new ReviewDao();
        
        try {
            List<Review> reviews = dao.selectAllReviews();
            request.setAttribute("reviews", reviews);
            
            super.gotoPage("review/reviewList.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "리뷰 목록을 불러오는 중 오류가 발생했습니다.");
            super.gotoPage("common/error.jsp");
        }
    }
}