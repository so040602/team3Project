package com.team3.controller.board;

import java.util.List;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Board;
import com.team3.model.dao.BoardDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		BoardDao dao = new BoardDao() ;
		List<Board> lists = dao.selectAll();
		request.setAttribute("datalist", lists);
		
		super.gotoPage("board/brdList.jsp"); 
	}
}
