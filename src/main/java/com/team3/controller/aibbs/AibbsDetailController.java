package com.team3.controller.aibbs;

import java.io.File;
import java.util.HashSet;
import java.util.Set;
import com.team3.controller.SuperClass;
import com.team3.model.bean.Aibbs;
import com.team3.model.dao.AibbsDao;
import com.team3.utility.AppConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AibbsDetailController extends SuperClass {
    @Override
    @SuppressWarnings("unchecked")
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doGet(request, response);
        
        try {
            String brdidxParam = request.getParameter("brdidx");
            if (brdidxParam == null || brdidxParam.trim().isEmpty()) {
                super.setAlertMessage("잘못된 접근입니다.");
                super.gotoPage("common/home.jsp");
                return;
            }
            
            int brdidx = Integer.parseInt(brdidxParam);
            
            // 세션에서 조회한 게시글 목록을 가져옴
            HttpSession session = request.getSession();
            Set<Integer> viewedPosts = (Set<Integer>) session.getAttribute("viewedPosts");
            
            if (viewedPosts == null) {
                viewedPosts = new HashSet<>();
                session.setAttribute("viewedPosts", viewedPosts);
            }
            
            // 이미 조회한 게시글인지 확인
            boolean shouldIncrement = !viewedPosts.contains(brdidx);
            
            AibbsDao dao = new AibbsDao();
            Aibbs bean = dao.getAibbsDataWithIncrementViewCount(brdidx, shouldIncrement);
            
            if (bean == null) {
                super.setAlertMessage("존재하지 않는 게시글입니다.");
                super.gotoPage("common/home.jsp");
                return;
            }
            
            // 조회한 게시글 목록에 추가
            if (shouldIncrement) {
                viewedPosts.add(brdidx);
                session.setMaxInactiveInterval(30 * 60); // 30분 세션 유지
            }
            
            String os = System.getProperty("os.name").toLowerCase();
            String filePath = os.contains("win") ? "team3_uploads" : "./../team3_uploads";
            
            request.setAttribute("filePath", filePath);
            request.setAttribute("bean", bean);
            super.gotoPage("aibbs/aibbsDetail.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            super.setAlertMessage("게시글 조회 중 오류가 발생했습니다.");
            super.gotoPage("common/home.jsp");
        }
    }
}