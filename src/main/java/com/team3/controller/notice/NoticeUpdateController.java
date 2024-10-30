package com.team3.controller.notice;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Notice;
import com.team3.model.dao.NoticeDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class NoticeUpdateController extends SuperClass {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doGet(request, response);
        
        NoticeDao dao = new NoticeDao();
        
        try {
            String noticeIdStr = request.getParameter("id");
            
            if (noticeIdStr == null || noticeIdStr.trim().isEmpty()) {
                throw new Exception("잘못된 접근입니다.");
            }
            
            int noticeId = Integer.parseInt(noticeIdStr);
            Notice notice = dao.selectNoticeById(noticeId);
            
            if (notice == null) {
                throw new Exception("존재하지 않는 공지사항입니다.");
            }
            
            request.setAttribute("notice", notice);
            super.gotoPage("notice/noticeUpdate.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", e.getMessage());
            super.gotoPage("common/error.jsp");
        }
    }
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doPost(request, response);
        
        NoticeDao dao = new NoticeDao();
        
        try {
            // 요청 파라미터 가져오기
            int noticeId = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String author = request.getParameter("author");
            String attachments = request.getParameter("attachments");
            
            // 유효성 검사
            if (title == null || title.trim().isEmpty()) {
                throw new Exception("제목을 입력해주세요.");
            }
            if (content == null || content.trim().isEmpty()) {
                throw new Exception("내용을 입력해주세요.");
            }
            if (author == null || author.trim().isEmpty()) {
                throw new Exception("작성자를 입력해주세요.");
            }
            
            // Notice 객체 생성
            Notice notice = new Notice();
            notice.setNoticeId(noticeId);
            notice.setNoticeTitle(title);
            notice.setNoticeContent(content);
            notice.setNoticeAuthor(author);
            notice.setNoticeAttachments(attachments);
            
            // DB 업데이트
            boolean isSuccess = dao.updateNotice(notice);
            
            if (isSuccess) {
                // 상세 페이지로 리다이렉트
                response.sendRedirect(request.getContextPath() + "/coolapp?opsmode=noticeDetail&id=" + noticeId);
            } else {
                throw new Exception("공지사항 수정 중 오류가 발생했습니다.");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", e.getMessage());
            request.setAttribute("notice", request.getParameterMap());
            super.gotoPage("notice/noticeUpdate.jsp");
        }
    }
}