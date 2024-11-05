package com.team3.controller.notice;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Member;
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

	        // 로그인된 사용자 정보 가져오기
	        Member loggedInMember = (Member) super.session.getAttribute("loginfo");  // 세션에서 Member 객체 가져오기
	        String author = null;

	        if (loggedInMember != null) {
	            // Member 객체에서 작성자 정보를 가져옴 (예: memid)
	            author = loggedInMember.getMemid();  // 또는 getUsername() 등
	        } else {
	            // 로그인된 사용자가 없는 경우 처리
	            throw new Exception("로그인 정보가 없습니다.");
	        }

	        String title = request.getParameter("title");
	        String content = request.getParameter("content");
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
	        NoticeDao dao = new NoticeDao();
	        boolean isSuccess = dao.insertNotice(notice);

	        if (isSuccess) {
	            // 목록 페이지로 리다이렉트
	            super.gotoPage("notice/noticeList.jsp");
	        } else {
	            throw new Exception("공지사항 등록 중 오류가 발생했습니다.");
	        }
	    }

	}
