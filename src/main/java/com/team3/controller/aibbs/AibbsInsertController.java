package com.team3.controller.aibbs;

import com.team3.controller.HomeController;
import com.team3.controller.SuperClass;
import com.team3.model.bean.Aibbs;
import com.team3.model.dao.AibbsDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AibbsInsertController extends SuperClass {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		super.gotoPage("aibbs/aibbsInsertForm.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		
		Aibbs bean = new Aibbs() ;
		bean.setMemid(request.getParameter("memid"));
		bean.setBoardpwd(request.getParameter("boardpwd"));
		bean.setSubtitle(request.getParameter("subtitle"));
		bean.setContents(request.getParameter("contents"));
		
		bean.setAttach01((String)request.getAttribute("attach01"));
		bean.setAttach02((String)request.getAttribute("attach02"));
		bean.setAttach03((String)request.getAttribute("attach03"));
		bean.setAttach04((String)request.getAttribute("attach04"));
		
		System.out.println("bean : " + bean.toString());
		
		AibbsDao dao = new AibbsDao() ;
		int cnt = -999999;
		try {
			cnt = dao.insertAibbsData(bean); 
			
			if(cnt == -999999) { // 등록 실패
				new AibbsInsertController().doGet(request, response);
				
			} else { 
				// 게시물 목록 보기 페이지로 이동
				//new HomeController().doGet(request, response);
				//super.gotoPage("board/brdList.jsp");
				new AibbsListController().doGet(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			new AibbsInsertController().doGet(request, response);
		}
	}


}
