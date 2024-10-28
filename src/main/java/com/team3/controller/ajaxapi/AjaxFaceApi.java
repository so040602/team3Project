package com.team3.controller.ajaxapi;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AjaxFaceApi") // ajax url에서 설정한 값 
public class AjaxFaceApi extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter res = response.getWriter();

        String name = request.getParameter("name");
        res.println("Hello, " + name + "!"); // 클라이언트에게 응답
	}
}
