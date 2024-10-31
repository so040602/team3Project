package com.team3.controller.aibbs;

import java.util.List;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Aibbs;
import com.team3.model.dao.AibbsDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AiBigDataViewController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		AibbsDao dao = new AibbsDao() ;
		Aibbs aibbs = dao.getAibbsDataByPk(Integer.parseInt(request.getParameter("brdidx")));
		request.setAttribute("dataview", aibbs);
		
		super.gotoPage("aibbs/aiBigDataView.jsp"); 
	}
}
