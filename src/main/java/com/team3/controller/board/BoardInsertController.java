package com.team3.controller.board;

import com.team3.controller.HomeController;
import com.team3.controller.SuperClass;
import com.team3.model.bean.Board;
import com.team3.model.dao.BoardDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardInsertController extends SuperClass {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		super.gotoPage("board/brdInsertForm.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		
		Board bean = new Board() ;
		bean.setMemid(request.getParameter("memid"));
		bean.setBoardpwd(request.getParameter("boardpwd"));
		bean.setSubtitle(request.getParameter("subtitle"));
		bean.setContents(request.getParameter("contents"));
		
		bean.setAttach01((String)request.getAttribute("attach01"));
		bean.setAttach02((String)request.getAttribute("attach02"));
		bean.setAttach03((String)request.getAttribute("attach03"));
		bean.setAttach04((String)request.getAttribute("attach04"));
		
		BoardDao dao = new BoardDao() ;
		int cnt = -999999;
		try {
			cnt = dao.insertBoardData(bean);	
			
			if(cnt == -999999) { // 등록 실패
				new BoardInsertController().doGet(request, response);
				
			} else { 
				// 게시물 목록 보기 페이지로 이동
				//new HomeController().doGet(request, response);
				//super.gotoPage("board/brdList.jsp");
				new BoardListController().doGet(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			new BoardInsertController().doGet(request, response);
		}
	}


}
