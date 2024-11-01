package com.team3.controller.review;

import com.team3.controller.SuperClass;
import com.team3.model.dao.ReviewDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ReviewDeleteController extends SuperClass {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	super.doGet(request, response);
    	int reviewidx = getNumberData(request.getParameter("reviewidx"));
        ReviewDao reviewDao = new ReviewDao();
        int result = reviewDao.delete(reviewidx);

        if (result > 0) {
        	response.sendRedirect(request.getContextPath() + "/coolapp?opsmode=reviewList&reviewidx=" + reviewidx);
        } else {
            setAlertMessage("리뷰 삭제에 실패했습니다."); // 실패 메시지 설정
            response.sendRedirect(request.getContextPath() + "/coolapp?opsmode=reviewList&reviewidx=" + reviewidx);
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        doGet(request, response); // POST 요청은 GET 요청으로 처리
    }
}
