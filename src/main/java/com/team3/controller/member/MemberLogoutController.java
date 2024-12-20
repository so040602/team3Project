package com.team3.controller.member;

import com.team3.controller.SuperClass;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MemberLogoutController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		System.out.println("로그아웃");
		
		// 나의 세션 관련 정보를 깔끔히 비워 주세요.
		super.session.invalidate();
		
		response.sendRedirect(request.getContextPath() + "/coolapp?opsmode=bookMain");

	}
}
