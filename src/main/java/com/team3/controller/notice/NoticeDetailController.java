package com.team3.controller.notice;

import java.util.HashSet;
import java.util.Set;
import com.team3.controller.SuperClass;
import com.team3.model.bean.Notice;
import com.team3.model.dao.NoticeDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class NoticeDetailController extends SuperClass {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doGet(request, response);
        
        NoticeDao dao = new NoticeDao();
        HttpSession session = request.getSession();
        
        try {
            String noticeIdStr = request.getParameter("id");
            
            if (noticeIdStr == null || noticeIdStr.trim().isEmpty()) {
                throw new Exception("잘못된 접근입니다.");
            }
            
            int noticeId = Integer.parseInt(noticeIdStr);
            
            // 먼저 공지사항 정보를 가져옴
            Notice notice = dao.selectNoticeById(noticeId);
            
            if (notice == null) {
                throw new Exception("존재하지 않는 공지사항입니다.");
            }
            
            // 세션에서 읽은 공지사항 목록을 가져옴
            Set<Integer> readNotices = (Set<Integer>) session.getAttribute("readNotices");
            
            // 읽은 공지사항 목록이 없으면 새로 생성
            if (readNotices == null) {
                readNotices = new HashSet<>();
            }
            
            // 이 공지사항을 처음 읽는 경우에만 조회수 증가
            if (!readNotices.contains(noticeId)) {
                dao.incrementNoticeViews(noticeId);
                // 읽은 공지사항 목록에 추가
                readNotices.add(noticeId);
                // 세션에 업데이트된 목록 저장
                session.setAttribute("readNotices", readNotices);
                
                // 증가된 조회수를 반영하기 위해 다시 조회
                notice = dao.selectNoticeById(noticeId);
            }
            
            request.setAttribute("notice", notice);
            super.gotoPage("notice/noticeDetail.jsp");
            
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "잘못된 공지사항 번호입니다.");
            super.gotoPage("common/error.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", e.getMessage());
            super.gotoPage("common/error.jsp");
        }
    }
}