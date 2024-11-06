package com.team3.controller.aibbs;

import com.team3.controller.SuperClass;
import com.team3.model.dao.AibbsDao;
import com.team3.model.bean.Member;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AibbsDeleteController extends SuperClass {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doGet(request, response);
        
        AibbsDao dao = new AibbsDao();
        String message = "";
        
        try {
            // 로그인 체크
            HttpSession session = request.getSession();
            Member loginfo = (Member)session.getAttribute("loginfo");
            
            if (loginfo == null) {
                throw new Exception("로그인이 필요한 서비스입니다.");
            }
            
            // URL 파라미터에서 게시글 번호 가져오기
            String brdidxStr = request.getParameter("brdidx");
            
            if (brdidxStr == null || brdidxStr.trim().isEmpty()) {
                throw new Exception("잘못된 접근입니다.");
            }
            
            int brdidx = Integer.parseInt(brdidxStr);
            
            // 게시글 삭제
            boolean isSuccess = dao.deleteAibbs(brdidx, loginfo.getMemid());
            
            if (isSuccess) {
                // 삭제 성공 시 목록 페이지로 리다이렉트
                response.sendRedirect(request.getContextPath() + "/coolapp?opsmode=aibbsList");
            } else {
                message = "게시글 삭제 중 오류가 발생했습니다.";
                this.setAlertMessage(message);
                response.sendRedirect(request.getContextPath() + "/coolapp?opsmode=aibbsList");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            message = e.getMessage();
            this.setAlertMessage(message);
            response.sendRedirect(request.getContextPath() + "/coolapp?opsmode=aibbsList");
        }
    }
}