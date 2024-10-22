package com.team3.controller.member;

import java.util.List;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Member;
import com.team3.model.dao.MemberDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MemberListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		MemberDao dao = new MemberDao() ;
		List<Member> lists = dao.selectAll();
		request.setAttribute("datalist", lists);
		
		super.gotoPage(	"member/memList.jsp"); 
	}
}
