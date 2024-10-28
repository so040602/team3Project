package com.team3.controller.member;

import com.team3.controller.SuperClass;
import com.team3.utility.SendMailUtil;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserAuthStartController extends SuperClass {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
	    try {
	        SendMailUtil sendMailUtil = new SendMailUtil();
	        //sendMailUtil.sendEmailTo("greenstan@naver.com", "테스트 이메일", "안녕하세요, 이것은 테스트 이메일입니다.");
	    } catch (Exception e) {
	        e.printStackTrace(); // 예외가 발생하면 로그에 출력
	    }
		
		super.gotoPage("member/userAuthStartForm.jsp");
	}


}
