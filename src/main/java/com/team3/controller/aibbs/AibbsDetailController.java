package com.team3.aibbs;

import java.io.File;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Aibbs;
import com.team3.model.dao.AibbsDao;
import com.team3.utility.AppConfig;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AibbsDetailController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		// 상세하게 보고 싶은 게시물 번호
		int brdidx = Integer.parseInt(request.getParameter("brdidx"));
		
		AibbsDao dao = new AibbsDao() ;
		Aibbs bean = null ;
		
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
			super.gotoPage("aibbs/aibbsDetail.jsp");
		}
	}
}