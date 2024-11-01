package com.team3.controller.review;

import com.team3.model.dao.ReviewDao;
import com.team3.controller.SuperClass;
import com.team3.model.bean.Review;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

public class ReviewInsertController extends SuperClass {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doGet(request, response);
        gotoPage("review/reviewInsert.jsp");
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doPost(request, response);
        ReviewDao reviewDao = new ReviewDao();

        try {
            // 요청 파라미터 가져오기
            String title = request.getParameter("review_title");
            String body = request.getParameter("review_body");
            int bookidx = getNumberData(request.getParameter("bookidx"));
            String memid = (String) session.getAttribute("loginfo"); // 현재 로그인된 회원 ID

            // 유효성 검사
            validateInputs(title, body);

            // Review 객체 생성
            Review review = createReview(title, body, bookidx, memid);

            // DB에 리뷰 삽입
            int reviewId = reviewDao.insert(review);

            if (reviewId > 0) {
                // 리뷰 목록으로 리다이렉트
                response.sendRedirect(request.getContextPath() + "/coolapp?opsmode=reviewList&reviewidx=" + reviewId);
            } else {
                throw new Exception("리뷰 등록 중 오류가 발생했습니다.");
            }

        } catch (Exception e) {
            handleError(request, e);
        }
    }

    private void validateInputs(String title, String body) throws Exception {
        if (title == null || title.trim().isEmpty()) {
            throw new Exception("제목을 입력해주세요.");
        }
        if (body == null || body.trim().isEmpty()) {
            throw new Exception("내용을 입력해주세요.");
        }
    }

    private Review createReview(String title, String body, int bookidx, String memid) {
        Review review = new Review();
        review.setReview_title(title);
        review.setReview_body(body);
        review.setReview_cnt(0); // 초기 조회수
        review.setReview_regdate(new Date(System.currentTimeMillis())); // 현재 날짜
        review.setReview_updated(new Date(System.currentTimeMillis())); // 현재 날짜
        review.setBookidx(bookidx);
        review.setMemid(memid);
        return review;
    }

    private void handleError(HttpServletRequest request, Exception e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", e.getMessage());
        request.setAttribute("review", request.getParameterMap()); // 입력 데이터 유지
        super.gotoPage("review/reviewInsert.jsp"); // 실패 시 삽입 폼으로 포워딩
    }
}
