package com.team3.controller.notice;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Notice;
import com.team3.model.dao.NoticeDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class NoticeInsertController extends SuperClass {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doGet(request, response);
        super.gotoPage("notice/noticeInsert.jsp");
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doPost(request, response);
        
        NoticeDao dao = new NoticeDao();
        
        try {
            // 요청 파라미터 가져오기
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
            notice.setNoticeTitle(title);
            notice.setNoticeContent(content);
            notice.setNoticeAuthor(author);
            notice.setNoticeAttachments(attachments);
            
            // DB에 저장
            boolean isSuccess = dao.insertNotice(notice);
            
            if (isSuccess) {
                // 목록 페이지로 리다이렉트
                super.gotoPage("notice/noticeList.jsp");
            } else {
                throw new Exception("공지사항 등록 중 오류가 발생했습니다.");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", e.getMessage());
            request.setAttribute("notice", request.getParameterMap()); // 입력값 유지
            super.gotoPage("notice/noticeInsert.jsp");
        }
    }
}