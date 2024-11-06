package com.team3.controller.book;

import java.io.BufferedReader;
import java.io.OutputStream;

import org.json.JSONObject;

import com.team3.controller.SuperClass;
import com.team3.utility.WordCloud;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BookWordCloudController extends SuperClass{
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		
		StringBuilder jsonBuilder = new StringBuilder();
		String line;
		
		try(BufferedReader reader = request.getReader()){
			while((line = reader.readLine()) != null) {
				jsonBuilder.append(line);
			}
		}
		
		JSONObject jsonObject = new JSONObject(jsonBuilder.toString());
		String discription = jsonObject.optString("bookdiscription", "");
		
		if (discription.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Error: No description provided.");
            return;
        }
		
		WordCloud wordclouds = new WordCloud();
		
		byte[] wordCloudImage = wordclouds.sendJsonData(discription);
		
		if(wordCloudImage != null) {
			// 이미지 응답 설정
			response.setContentType("image/png");
			response.setContentLength(wordCloudImage.length);
			
			try (OutputStream os = response.getOutputStream()){
				os.write(wordCloudImage);
			}
		}else {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("Error generating word cloud image.");		
		}
	}
}
