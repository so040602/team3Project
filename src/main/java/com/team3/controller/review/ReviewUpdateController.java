package com.team3.controller.review;

import com.team3.model.dao.ReviewDao;
import com.team3.controller.SuperClass;
import com.team3.model.bean.Review;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

public class ReviewUpdateController extends SuperClass {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doGet(request, response);
        
        try {
            // reviewidx 파라미터 검증
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
            
            ReviewDao reviewDao = new ReviewDao();
            // 조회수 증가 없이 리뷰 정보만 가져오기
            Review review = reviewDao.getReviewWithIncrementViewCount(reviewidx, false);
            
            if (review == null) {
                setAlertMessage("존재하지 않는 리뷰입니다.");
                response.sendRedirect(request.getContextPath() + "/coolapp?opsmode=reviewList");
                return;
            }
            
            request.setAttribute("review", review);
            super.gotoPage("review/reviewUpdate.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            setAlertMessage("리뷰 조회 중 오류가 발생했습니다.");
            response.sendRedirect(request.getContextPath() + "/coolapp?opsmode=reviewList");
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doPost(request, response);
        ReviewDao reviewDao = new ReviewDao();

        try {
            // 요청 파라미터 가져오기
            int reviewidx = getNumberData(request.getParameter("reviewidx"));
            String title = request.getParameter("review_title");
            String body = request.getParameter("review_body");
            
            // 유효성 검사
            if (title == null || title.trim().isEmpty()) {
                throw new Exception("제목을 입력해주세요.");
            }
            if (body == null || body.trim().isEmpty()) {
                throw new Exception("내용을 입력해주세요.");
            }
            
            // 기존 리뷰 정보 가져오기
            Review existingReview = reviewDao.getReviewWithIncrementViewCount(reviewidx, false);
            if (existingReview == null) {
                throw new Exception("존재하지 않는 리뷰입니다.");
            }

            // Review 객체 업데이트
            existingReview.setReview_title(title);
            existingReview.setReview_body(body);
            existingReview.setReview_updated(new Date(System.currentTimeMillis()));

            // DB 업데이트
            int result = reviewDao.update(existingReview);

            if (result > 0) {
                setAlertMessage("리뷰가 성공적으로 수정되었습니다.");
                response.sendRedirect(request.getContextPath() + 
                    "/coolapp?opsmode=reviewDetail&reviewidx=" + reviewidx);
            } else {
                throw new Exception("리뷰 수정 중 오류가 발생했습니다.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", e.getMessage());
            
            // 입력값 유지를 위해 Review 객체 다시 설정
            Review review = new Review();
            review.setReviewidx(getNumberData(request.getParameter("reviewidx")));
            review.setReview_title(request.getParameter("review_title"));
            review.setReview_body(request.getParameter("review_body"));
            request.setAttribute("review", review);
            
            super.gotoPage("review/reviewUpdate.jsp");
        }
    }
}