package com.team3.controller.ajaxapi;

import java.io.IOException;
import java.io.PrintWriter;

import com.team3.model.bean.Member;
import com.team3.model.dao.MemberDao;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AjaxMemidCheck") // ajax url에서 설정한 값 
public class AjaxMemidCheck extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String memidUseOk = "NOGOOD";
		
        String memid = request.getParameter("memid");
        MemberDao dao = new MemberDao();
        Member bean = dao.getMemberByMemid(memid);
       
        if(bean == null) { // 기존에 해당 아이디 정보가 없으면 null
        	memidUseOk = "USEOK";
        } 
		
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter res = response.getWriter();
        
        res.println(memidUseOk); // 클라이언트에게 응답
	}
}
