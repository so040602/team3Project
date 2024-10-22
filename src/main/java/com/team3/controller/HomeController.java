package com.team3.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class HomeController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest requset, HttpServletResponse response) throws Exception {	
		super.doGet(requset, response);
		System.out.println("홈페이지로 이동");
		super.gotoPage("common/home.jsp");
	}
}
