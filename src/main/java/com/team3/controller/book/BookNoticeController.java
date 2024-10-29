package com.team3.controller.book;

import java.util.List;
import com.team3.controller.SuperClass;
import com.team3.model.bean.Notice;
import com.team3.model.dao.NoticeDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BookNoticeController extends SuperClass {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doGet(request, response);
        
        NoticeDao dao = new NoticeDao();
        
        try {
            // 모든 공지사항 가져오기
            List<Notice> notices = dao.selectAllNotices();
            request.setAttribute("notices", notices);
            
            // 페이지 이동
            super.gotoPage("book/notice.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "공지사항을 불러오는 중 오류가 발생했습니다.");
            super.gotoPage("common/error.jsp");
        }
    }
    
   
}
