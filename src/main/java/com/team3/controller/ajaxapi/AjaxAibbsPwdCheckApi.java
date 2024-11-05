package com.team3.controller.ajaxapi;

import java.io.IOException;
import java.io.PrintWriter;

import com.team3.model.bean.Aibbs;
import com.team3.model.dao.AibbsDao;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AjaxAibbsPwdCheck")
public class AjaxAibbsPwdCheckApi extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String brdpwdOk = "AIBBS_WRONG_PWD"; // 비밀번호가 틀린 경우 초기화
        
        try {
            int brdidx = Integer.parseInt(request.getParameter("brdidx")); // 게시물 번호
            String boardpwd = request.getParameter("boardpwd"); // 비밀번호
            
            System.out.println(brdidx + " " + boardpwd); // 로그 출력
            
            AibbsDao dao = new AibbsDao(); // Aibbs DAO 객체 생성
            Aibbs bean = dao.getAibbsDataByPkPwd(brdidx, boardpwd); // 비밀번호 확인
            
            if (bean != null) { // 해당 게시물과 비밀번호가 존재하는 경우
                brdpwdOk = "AIBBS_CORRECT_PWD"; // 비밀번호가 맞음
                System.out.println("===> " + bean.toString());
            } else {
                System.out.println("===> no board data found");
            }
            
            response.setContentType("text/plain;charset=UTF-8"); // 응답 형식 설정
            try (PrintWriter res = response.getWriter()) { // PrintWriter 자원 관리
                res.print(brdpwdOk); // 클라이언트에 응답 전송
            }
            
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 잘못된 요청
            e.printStackTrace();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 서버 오류
            e.printStackTrace();
        }
    }
}
