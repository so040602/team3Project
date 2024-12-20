package com.team3.controller.member;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.team3.controller.SuperClass;
import com.team3.model.bean.BookOutCur;
import com.team3.model.bean.Member;
import com.team3.model.dao.BookDao;
import com.team3.model.dao.MemberDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MemberMyPageController extends SuperClass{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		String memid = super.loginfo.getMemid();
		int memidx = super.loginfo.getMemidx();
		MemberDao dao = new MemberDao();
		Member bean = dao.getMemDataByMemId(memid);
		
		BookDao bookdao = new BookDao();
		
		System.out.println(memidx);
		
		List<BookOutCur> outlist = bookdao.CurrentBookOut(memidx);
		
		List<BookOutCur> overList = new ArrayList<BookOutCur>();
		DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy년MM월dd일");
		LocalDate date = null;
		LocalDate limitDate = null;
		LocalDate currentDate = LocalDate.now();
		List<BookOutCur> copyList = new ArrayList<BookOutCur>(outlist);
		
		for(BookOutCur bean2 : copyList) {
			String curDate = bean2.getRegdate();
			date = LocalDate.parse(curDate, dateFormat);
			limitDate = date.plusDays(14);
			
			if(limitDate.isBefore(currentDate)) {
				overList.add(bean2);
				outlist.remove(bean2);
			}
		}
			
		request.setAttribute("mbean", bean);
		request.setAttribute("datalist", outlist);
		request.setAttribute("limitdate", overList);
		super.gotoPage("member/memMyPage.jsp");
		
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		
		BookDao dao = new BookDao();
		
		StringBuilder jsonBuilder = new StringBuilder();
		String line;
		
		try(BufferedReader reader = request.getReader()){
			while((line = reader.readLine()) != null) {
				jsonBuilder.append(line);
			}
		}
		
		JSONObject jsonObject = new JSONObject(jsonBuilder.toString());
		int memidx = super.loginfo.getMemidx();
		int bookId = jsonObject.getInt("bookId");
		System.out.println(bookId);
		int cnt = -99999;
		cnt = dao.updateBookOut(bookId, memidx);
		
		if(cnt != -99999) {
			String message = "완료";
			sendJsonResPonse(response, message);
		}else {
			String error_message = "실패";
			sendJsonResPonse(response, error_message);
		}
		System.out.println("cnt" + cnt);
		
	}
	private void sendJsonResPonse(HttpServletResponse response, String message) throws IOException {
		// TODO Auto-generated method stub
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonResponse = objectMapper.writeValueAsString(message);			
		// 응답 보내기
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonResponse);
		out.flush();
		
	}
}
