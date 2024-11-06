package com.team3.controller.aibbs;

import java.util.ArrayList;
import java.util.List;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Aibbs;
import com.team3.model.bean.Book;
import com.team3.model.bean.Paging;
import com.team3.model.dao.AibbsDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AibbsListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		String mode = request.getParameter("currCategory");
		int totalCount = 0;
		
		if(mode == null || mode.equals("전체보기")) {
			mode = "all";
		}
		
		AibbsDao dao = new AibbsDao();

		totalCount = dao.getAibbsTotalCount(mode);

		List<String> categoryList = new ArrayList<String>();
		
		//categoryList = dao.getAibbsCategory();
		categoryList.add("머신러닝");
		categoryList.add("인공지능");
		
		String pageNumberParam = request.getParameter("pageNumber");
		String url = "";
		
		String pageNumber = (pageNumberParam == null || pageNumberParam.isEmpty()) ? "1" : pageNumberParam;
		System.out.println(mode);

		String keyword = "";
		Paging pageInfo = new Paging(pageNumber, "12", totalCount, url, mode, keyword);
		
		List<Aibbs> aibbsList = dao.getAibbsPagingData(pageInfo);
		
		System.out.println(aibbsList);
		
		int beginpage = pageInfo.getBeginPage();

		//request.setAttribute("keyword", keyword);
		request.setAttribute("selectedCategory", mode);
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("datalist", aibbsList);	
		request.setAttribute("pagelist", pageInfo);
		
		super.gotoPage("aibbs/aibbsList.jsp"); 
	}
}
