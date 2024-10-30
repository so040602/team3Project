package com.team3.aibbs;

import java.util.List;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Aibbs;
import com.team3.model.dao.AibbsDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AibbsListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		AibbsDao dao = new AibbsDao() ;
		List<Aibbs> lists = dao.selectAll();
		request.setAttribute("datalist", lists);
		
		super.gotoPage("aibbs/aibbsList.jsp"); 
	}
}
