package com.team3.controller.member;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Member;
import com.team3.model.dao.MemberDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MemberDetailController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		String memid = request.getParameter("memid");
		
		MemberDao dao = new MemberDao() ;
		Member bean = dao.getMemDataByMemId(memid) ;
		
		if(bean == null) {
			super.setAlertMessage("찾으시는 회원의 정보가 존재하지 않습니다.");
			super.gotoPage("member/memList.jsp");
			
		}else {
			request.setAttribute("bean", bean) ;
			super.gotoPage("member/memDetail.jsp");
		}
	}
}
