package com.team3.controller.book;

import java.io.BufferedReader;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.team3.controller.SuperClass;
import com.team3.model.bean.OutCart;
import com.team3.model.dao.BookDao;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/coolapp/bookOut")
public class BookOutController extends SuperClass{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		
		if(super.loginfo==null) {
			super.youNeedLogin();
			return ;
		}

		StringBuilder jsonBuilder = new StringBuilder();
		String line;
		
		try(BufferedReader reader = request.getReader()){
			while((line = reader.readLine()) != null) {
				jsonBuilder.append(line);
			}
		}
		
		JSONObject jsonObject = new JSONObject(jsonBuilder.toString());
		int bookId = jsonObject.getInt("bookId");

		System.out.println(bookId);
		
		int midx = super.loginfo.getMemidx();
		BookDao dao = new BookDao();
				
		int scnt = -99999;
		
		scnt = dao.searchOutBook(bookId, midx);
		if(scnt == 0) {
			String bookState = "대여중";
			sendJsonResPonse(response, bookState);
		}else if(scnt == -1) {
			String book_avail = dao.getCheckOut(bookId);
			if(book_avail.equals("가능")) {
				int bookOutCount = dao.getCheckOutCount(midx);
				if(bookOutCount < 4) {
					int cnt = -99999;
					cnt = dao.insertbookOut(bookId, midx);
					if(cnt != -99999) {
						int ucnt = -99999;
						ucnt = dao.updateOutCart(bookId, midx);
						if(ucnt != -99999) {
							String bookState = "완료";
							sendJsonResPonse(response, bookState);
						}
					}
				}else {
					String bookState = "초과";
					sendJsonResPonse(response, bookState);
				}
			}else {
				sendJsonResPonse(response, book_avail);
			}
		}else {
			String dbState = "오류";
			sendJsonResPonse(response, dbState);
		}				
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
