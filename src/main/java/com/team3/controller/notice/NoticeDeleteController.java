package com.team3.controller.notice;

import com.team3.controller.SuperClass;
import com.team3.model.dao.NoticeDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class NoticeDeleteController extends SuperClass {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doGet(request, response);
        
        NoticeDao dao = new NoticeDao();
        
        try {
            // URL 파라미터에서 공지사항 ID 가져오기
            String noticeIdStr = request.getParameter("id");
            
            if (noticeIdStr == null || noticeIdStr.trim().isEmpty()) {
                throw new Exception("잘못된 접근입니다.");
            }
            
            int noticeId = Integer.parseInt(noticeIdStr);
            
            // 공지사항 삭제
            boolean isSuccess = dao.deleteNotice(noticeId);
            
            if (isSuccess) {
                // 목록 페이지로 리다이렉트
                response.sendRedirect(request.getContextPath() + "/coolapp?opsmode=noticeList");
            } else {
                throw new Exception("공지사항 삭제 중 오류가 발생했습니다.");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", e.getMessage());
            super.gotoPage("common/error.jsp");
        }
    }
}