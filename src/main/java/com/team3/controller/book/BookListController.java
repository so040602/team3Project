package com.team3.controller.book;

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
		
		String mode = "all";
		BookDao dao = new BookDao();
		
		int totalCount = dao.getTotalCount(mode);
		
		String pageNumberParam = request.getParameter("pageNumber");
		String url = "";
		String keyword = "";
		
		String pageNumber = (pageNumberParam == null || pageNumberParam.isEmpty()) ? "1" : pageNumberParam;
		
		Paging pageInfo = new Paging(pageNumber, "18", totalCount, url, mode, keyword);
		
		List<Book> bookList = dao.getPaginationData(pageInfo);
		
		int beginpage = pageInfo.getBeginPage();
		
		System.out.println(bookList);
		
		request.setAttribute("datalist", bookList);	
		request.setAttribute("pagelist", pageInfo);
		
		
		super.gotoPage("book/bookList.jsp"); 
	}

}
