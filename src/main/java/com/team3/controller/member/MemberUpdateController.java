package com.team3.controller.member;


import com.team3.controller.HomeController;
import com.team3.controller.SuperClass;
import com.team3.model.bean.Board;
import com.team3.model.bean.Member;
import com.team3.model.dao.ReviewDao;
import com.team3.model.dao.MemberDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MemberUpdateController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		String memid = super.loginfo.getMemid();
		//String id = request.getParameter("memid");
		MemberDao dao = new MemberDao() ;
		Member bean = dao.getMemDataByMemId(memid);
		request.setAttribute("bean", bean); 
		
		super.gotoPage("member/memUpdateForm.jsp"); 
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
		bean.setRemark(request.getParameter("remark"));

		MemberDao dao = new MemberDao() ; 
		int cnt = -99999 ; // 부정(negative)의 의미
		
		cnt = dao.updateData(bean) ;
		
		if(cnt == -99999) { // 가입 실패
			new MemberUpdateController().doGet(request, response); 
			
		} else { 			
			new HomeController().doGet(request, response);
		}
	}
}
