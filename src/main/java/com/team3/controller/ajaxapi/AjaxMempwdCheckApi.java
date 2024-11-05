package com.team3.controller.ajaxapi;

import java.io.IOException;
import java.io.PrintWriter;

import com.team3.model.bean.Member;
import com.team3.model.dao.MemberDao;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AjaxMempwdCheck")
public class AjaxMempwdCheckApi extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String mempwdOk = "WRONGPWD";
        
        String memid = request.getParameter("memid");
        String mempwd = request.getParameter("mempwd");
        
        MemberDao dao = new MemberDao();
        Member bean = dao.getDataByPk(memid, mempwd);
        
        if (bean != null) { // 해당 아이디와 패스워드가 존재하는 경우
            mempwdOk = "CORRECTPWD";
            System.out.println("===> " + bean.toString());
        } else {
            System.out.println("===> no user found");
        }
        
        response.setContentType("text/plain;charset=UTF-8"); // text/plain으로 변경
        PrintWriter res = response.getWriter();
        
        res.print(mempwdOk); // 클라이언트에 응답 전송
        res.flush();
    }
}
