package com.team3.controller.member;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Member;
import com.team3.model.dao.MemberDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MemberMyPageController extends SuperClass{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		String memid = super.loginfo.getMemid();
		MemberDao dao = new MemberDao();
		Member bean = dao.getMemDataByMemId(memid);
		
		System.out.println(bean);
		
		request.setAttribute("mbean", bean);
		super.gotoPage("member/memMyPage.jsp");
	}
}
