package com.team3.controller.book;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.slack.api.util.json.GsonAppWorkflowStepInputValueFactory;
import com.team3.controller.SuperClass;
import com.team3.model.bean.Member;
import com.team3.model.bean.OutCart;
import com.team3.model.dao.BookDao;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/team3/coolapp?opsmode=bookDetail")
public class BookOutCartController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		super.gotoPage("book/bookOutCart.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		
		if(super.loginfo==null) {
			super.youNeedLogin();
			return ;
		}
//		
		System.out.println("로그인 정보 : " + super.loginfo);
	
		System.out.println(super.loginfo.getMemidx());

		
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
		
		BookDao dao = new BookDao();
		String book_avail = dao.getCheckOut(bookId);
		
		int midx = super.loginfo.getMemidx();
		System.out.println(midx);
				
		int outCartCnt = dao.getOutCartCnt(midx);
		
		if(outCartCnt > 5) {						
			String outCartState = "초과";
			sendJsonResPonse(response, outCartState);
		}else{
			if(book_avail.equals("가능")) {
				int cnt = -99999;
				cnt = dao.insertOutCart(bookId, midx);
				// 응답 보내기
				if(cnt == 0) {
					String book_state = "중복";
					sendJsonResPonse(response, book_state);
				}else if(cnt != -99999) {
					sendJsonResPonse(response, book_avail);
				}else {
					String book_st = "오류";
					sendJsonResPonse(response, book_st);
				}
			}else {		
				// 응답 보내기
				sendJsonResPonse(response, book_avail);
			}			
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
