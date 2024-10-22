package com.team3.controller.view;

import java.util.List;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Combo04;
import com.team3.model.dao.CompositeDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class View04Controller extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		CompositeDao dao = new CompositeDao() ;
		
		List<Combo04> lists = null ;
		
		try {
			lists = dao.view04();
			request.setAttribute("lists", lists);
			super.gotoPage("view/View04.jsp"); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

