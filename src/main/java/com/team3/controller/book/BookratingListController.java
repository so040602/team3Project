package com.team3.controller.book;

import java.util.ArrayList;
import java.util.List;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Book;
import com.team3.model.bean.Paging;
import com.team3.model.dao.BookDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BookratingListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		String category = request.getParameter("currCategory");
		String keyword = request.getParameter("search");
		int totalCount = 0;
		BookDao dao = new BookDao();
		
		
		if(category == null || category.equals("전체보기")) {
			category = "all";
		}
		if(keyword == null || keyword.equals("")) {
			keyword = "";
			totalCount = dao.getTotalCount(category);
		}else {
			totalCount = dao.getSearchTotalCount(category, keyword);
		}
		
		System.out.println("category = " + category);
		System.out.println("keyword = " + keyword);
		System.out.println("totalCount = " + totalCount);
		
		List<String> category_List = new ArrayList<String>();
		
		category_List = dao.getCategory();
	
		String pageNumberParam = request.getParameter("pageNumber");
		String url = "";
		
		String pageNumber = (pageNumberParam == null || pageNumberParam.isEmpty()) ? "1" : pageNumberParam;
		Paging pageInfo = new Paging(pageNumber, "12", totalCount, url, category, keyword);
		
		List<Book> bookList = dao.getRatingPaginationData(pageInfo);
		
		int beginpage = pageInfo.getBeginPage();
		
		request.setAttribute("selectedCategory", category);
		request.setAttribute("keyword", keyword);
		request.setAttribute("category_List", category_List);
		request.setAttribute("datalist", bookList);	
		request.setAttribute("pagelist", pageInfo);				
		super.gotoPage("book/bookratingList.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");
		int totalCount = 0;
		BookDao dao = new BookDao();
		
		
		if(category == null || category.equals("전체보기")) {
			category = "all";
		}
		if(keyword == null || keyword.equals("")) {
			keyword = "";
			totalCount = dao.getTotalCount(category);
		}else {
			totalCount = dao.getSearchTotalCount(category, keyword);
		}
		
		System.out.println("category = " + category);
		System.out.println("keyword = " + keyword);
		System.out.println("totalCount = " + totalCount);
		
		List<String> category_List = new ArrayList<String>();
		
		category_List = dao.getCategory();
	
		String pageNumberParam = request.getParameter("pageNumber");
		String url = "";
		
		String pageNumber = (pageNumberParam == null || pageNumberParam.isEmpty()) ? "1" : pageNumberParam;
		Paging pageInfo = new Paging(pageNumber, "12", totalCount, url, category, keyword);
		
		List<Book> bookList = dao.getRatingPaginationData(pageInfo);
		
		int beginpage = pageInfo.getBeginPage();
		
		
		request.setAttribute("selectedCategory", category);
		request.setAttribute("keyword", keyword);
		request.setAttribute("category_List", category_List);
		request.setAttribute("datalist", bookList);	
		request.setAttribute("pagelist", pageInfo);
		super.gotoPage("book/bookratingList.jsp");
	}

}
