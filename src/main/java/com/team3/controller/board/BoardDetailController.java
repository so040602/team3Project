package com.team3.controller.board;

import java.io.File;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Board;
import com.team3.model.dao.BoardDao;
import com.team3.utility.AppConfig;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardDetailController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		// 상세하게 보고 싶은 게시물 번호
		int brdidx = Integer.parseInt(request.getParameter("brdidx"));
		
		BoardDao dao = new BoardDao() ;
		Board bean = null ;
		
		bean = dao.getBoardDataByPk(brdidx);
		
		if(bean == null) {
			super.setAlertMessage("잘못된 게시물 번호입니다.");
			super.gotoPage("common/home.jsp");
			
		} else {
			
			String os = System.getProperty("os.name").toLowerCase();
			String filePath = null;
			
			if (os.contains("win")) {
				//filePath = AppConfig.getInstance().getFileUploadPath() + File.separator;
				filePath = "team3_uploads";
			} else {
			    String scheme = request.getScheme(); // "http"||"https"
			    String serverName = request.getServerName();
				//filePath = scheme + "://" + serverName + "/team3_uploads/";
				filePath = "./../team3_uploads";
			}
			
			request.setAttribute("filePath", filePath);
			request.setAttribute("bean", bean) ; 
			super.gotoPage("board/brdDetail.jsp");
		}
	}
}