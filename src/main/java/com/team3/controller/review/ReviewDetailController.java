package com.team3.controller.review;

import com.team3.controller.SuperClass;
import com.team3.model.dao.ReviewDao;
import com.team3.model.bean.Review;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.Set;

public class ReviewDetailController extends SuperClass {
    
    @Override
    @SuppressWarnings("unchecked")
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doGet(request, response);
        
        try {
            String reviewIdxParam = request.getParameter("reviewidx");
            if (reviewIdxParam == null || reviewIdxParam.trim().isEmpty()) {
                setAlertMessage("잘못된 접근입니다.");
                response.sendRedirect(request.getContextPath() + "/coolapp?opsmode=reviewList");
                return;
            }
            
            int reviewidx = getNumberData(reviewIdxParam);
            if (reviewidx == 0) {
                setAlertMessage("유효하지 않은 리뷰 번호입니다.");
                response.sendRedirect(request.getContextPath() + "/coolapp?opsmode=reviewList");
                return;
            }
            
            // 세션에서 조회한 리뷰 목록을 가져옴
            HttpSession session = request.getSession();
            Set<Integer> viewedReviews = (Set<Integer>) session.getAttribute("viewedReviews");
            
            if (viewedReviews == null) {
                viewedReviews = new HashSet<>();
                session.setAttribute("viewedReviews", viewedReviews);
            }
            
            // 이미 조회한 리뷰인지 확인
            boolean shouldIncrement = !viewedReviews.contains(reviewidx);
            
            ReviewDao reviewDao = new ReviewDao();
            Review review = reviewDao.getReviewWithIncrementViewCount(reviewidx, shouldIncrement);
            
            if (review == null) {
                setAlertMessage("존재하지 않는 리뷰입니다.");
                response.sendRedirect(request.getContextPath() + "/coolapp?opsmode=reviewList");
                return;
            }
            
            // 조회한 리뷰 목록에 추가
            if (shouldIncrement) {
                viewedReviews.add(reviewidx);
                
                // 세션 유지 시간 동안만 조회수 증가 방지 (예: 30분)
                session.setMaxInactiveInterval(30 * 60);
            }
            
            request.setAttribute("review", review);
            super.gotoPage("review/reviewDetail.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            setAlertMessage("리뷰 조회 중 오류가 발생했습니다.");
            response.sendRedirect(request.getContextPath() + "/coolapp?opsmode=reviewList");
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        doGet(request, response);
    }
}