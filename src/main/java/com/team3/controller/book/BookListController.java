package com.team3.controller.book;

import java.util.ArrayList;
import java.util.List;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Book;
import com.team3.model.bean.Paging;
import com.team3.model.dao.BoardDao;
import com.team3.model.dao.BookDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BookListController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		String mode = request.getParameter("category");
		
		if(mode == null || mode.equals("전체보기")) {
			mode = "all";
		}
		
		System.out.println(mode);
		
		BookDao dao = new BookDao();
		
		List<String> category_List = new ArrayList<String>();
		
		category_List = dao.getCategory();
		
		int totalCount = dao.getTotalCount(mode);
		
		
		String pageNumberParam = request.getParameter("pageNumber");
		String url = "";
		String keyword = "";
		
		String pageNumber = (pageNumberParam == null || pageNumberParam.isEmpty()) ? "1" : pageNumberParam;
		
		Paging pageInfo = new Paging(pageNumber, "10", totalCount, url, mode, keyword);
		
		List<Book> bookList = dao.getPaginationData(pageInfo);
		
		int beginpage = pageInfo.getBeginPage();

		
		request.setAttribute("category_List", category_List);
		request.setAttribute("datalist", bookList);	
		request.setAttribute("pagelist", pageInfo);
		
		
		super.gotoPage("book/bookList.jsp"); 
	}

}
