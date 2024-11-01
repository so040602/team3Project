package com.team3.controller.book;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.team3.controller.SuperClass;
import com.team3.model.dao.BookDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BookListOutController extends SuperClass{
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
		int midx = super.loginfo.getMemidx();
		
		System.out.println(bookId);
		
		BookDao dao = new BookDao();
		
		String check = dao.getCheckOut(bookId);
		int recOutState = dao.getCheckOutCount(midx);
		
		if(recOutState < 4) {
			if(check.equals("불가능")) {
				sendJsonResPonse(response, check);
			}else {
				int checkMark = dao.updateOutCart(bookId, midx);
				if(checkMark > 0) {
					int checkOut = dao.insertbookOut(bookId, midx);
					if(checkOut > 0) {
						String status = "성공";
						sendJsonResPonse(response, status);					
					}else {
						String status = "실패";
						sendJsonResPonse(response, status);
					}
				}else {
					String status = "오류";
					sendJsonResPonse(response, status);
				}
			}
		}else {
			String status = "초과";
			sendJsonResPonse(response, status);
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
