package com.team3.controller.board;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Board;
import com.team3.model.dao.BoardDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardUpdateController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		// 수정할 게시물 번호를 우선 챙깁니다.
		int brdidx = Integer.parseInt(request.getParameter("brdidx"));
		BoardDao dao = new BoardDao() ;
		Board bean = dao.getBoardDataByPk(brdidx);
		request.setAttribute("bean", bean); 
		
		super.gotoPage("board/brdUpdateForm.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		
		Board bean = new Board() ;
		
		bean.setBrdidx(Integer.parseInt(request.getParameter("brdidx")));
		bean.setMemid(request.getParameter("memid"));
		bean.setBoardpwd(request.getParameter("boardpwd"));
		bean.setSubtitle(request.getParameter("subtitle"));
		bean.setContents(request.getParameter("contents"));
		bean.setAttach01((String)request.getAttribute("attach01"));
		bean.setAttach02((String)request.getAttribute("attach02"));
		bean.setAttach03((String)request.getAttribute("attach03"));
		bean.setAttach04((String)request.getAttribute("attach04"));
		
		BoardDao dao = new BoardDao() ;
		int book_idx = -999999;
		try {
			book_idx = dao.updateBoardData(bean);	
			
			if(book_idx == -999999) { // 등록 실패
				new BoardUpdateController().doGet(request, response);
				
			} else { // 성공
				// 게시물 목록 보기 페이지로 이동
				new BoardListController().doGet(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			new BoardUpdateController().doGet(request, response);
		}

	}
}
