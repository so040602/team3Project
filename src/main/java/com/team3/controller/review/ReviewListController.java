package com.team3.controller.review;

import com.team3.model.dao.ReviewDao;
import com.team3.controller.SuperClass;
import com.team3.model.bean.Review;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

public class ReviewListController extends SuperClass {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	super.doGet(request, response);
    	ReviewDao reviewDao = new ReviewDao();
        List<Review> reviews = reviewDao.list();
        request.setAttribute("reviews", reviews);
        gotoPage("review/reviewList.jsp"); // 리뷰 목록 JSP 페이지로 포워딩
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        doGet(request, response); // POST 요청은 GET 요청으로 처리
    }
}
