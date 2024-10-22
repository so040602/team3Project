package com.team3.controller.book;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Book;
import com.team3.model.dao.BookDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BookDetailController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		System.out.println(0);
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		
		BookDao dao = new BookDao() ;
		Book bean = dao.getDataByPk(cnt) ;
		

		if(bean == null) {
			super.setAlertMessage("찾으시는 도서가 존재하지 않습니다.");
			super.gotoPage("book/bookList.jsp");
		
			
		}else {
			request.setAttribute("bean", bean) ;
			super.gotoPage("book/bookDetail.jsp");
			
		}
	}
		
	}


