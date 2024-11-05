package com.team3.controller.book;

import java.io.BufferedReader;

import org.json.JSONObject;

import com.team3.controller.SuperClass;

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
		String discription = jsonObject.getString("bookdiscription");
		
		System.out.println(discription);
		
	}

}
