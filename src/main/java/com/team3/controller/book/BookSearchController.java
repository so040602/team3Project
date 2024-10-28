package com.team3.controller.book;

import java.util.ArrayList;
import java.util.List;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Book;
import com.team3.model.bean.Paging;
import com.team3.model.dao.BookDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BookSearchController extends SuperClass{
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		
		String category = request.getParameter("category");		
		String text = request.getParameter("keyword");
		
		System.out.println(category);
		System.out.println(text);
		if(category == null || category.equals("전체보기")) {
			category = "all";
		}
		
		BookDao dao = new BookDao();
		
		List<String> category_List = new ArrayList<String>();
		category_List = dao.getCategory();
		
		int totalCount = dao.getSearchTotalCount(category, text);
		
		String pageNumberParam = request.getParameter("pageNumber");
		String url = "";
		String keyword = "";
		
		String pageNumber = (pageNumberParam == null || pageNumberParam.isEmpty()) ? "1" : pageNumberParam;
		
		Paging pageInfo = new Paging(pageNumber, "10", totalCount, url, category, keyword);
		
		List<Book> bookList = dao.getCategorySearch(pageInfo ,text);
		
		request.setAttribute("keyword", text);
		request.setAttribute("selectedCategory", category);
		request.setAttribute("category_List", category_List);
		request.setAttribute("datalist", bookList);	
		request.setAttribute("pagelist", pageInfo);
		
		
		super.gotoPage("book/bookList.jsp"); 
	} 
}
