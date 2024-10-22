package com.team3.controller.member;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Member;
import com.team3.model.dao.MemberDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 회원 가입을 위한 컨트롤러 입니다.
public class MemberInsertController extends SuperClass  {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		super.gotoPage("member/memInsertForm.jsp"); 
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		Member bean = new Member() ; 

		bean.setMemid(request.getParameter("memid"));
		bean.setMempwd(request.getParameter("mempwd"));
		bean.setMemname(request.getParameter("memname"));
		bean.setGender(request.getParameter("gender"));
		bean.setBirth(request.getParameter("birth"));
		bean.setMobile(request.getParameter("mobile"));
		bean.setEmail(request.getParameter("email"));
		bean.setAddr01(request.getParameter("addr01"));
		bean.setAddr02(request.getParameter("addr02"));
		
		MemberDao dao = new MemberDao() ; 
		int cnt = -99999 ; // 부정(negative)의 의미
		
		cnt = dao.insertData(bean) ;
		
		if(cnt == -99999) { // 가입 실패
			new MemberInsertController().doGet(request, response); 
			
		} else { // 가입 성공, 자동으로 로그인 되도록 Post 방식 요청함			
			new MemberLoginController().doPost(request, response);
		}
		
	}
}