package com.team3.controller.member;

import java.io.File;
import java.util.Enumeration;

import com.team3.controller.SuperClass;
import com.team3.controller.SuperController;
import com.team3.utility.IdCardTransfer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class UserCardAuthController extends SuperClass {
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
	    // 요청 속성 이름 출력
	    Enumeration<?> attributeNames = request.getAttributeNames();
	    System.out.println("request.getAttributeNames() : ");
	    while (attributeNames.hasMoreElements()) {
	        System.out.println(attributeNames.nextElement());
	    }

	    // userName 가져오기
	    String userName = (String) request.getParameter("userName");
	    if (userName != null) {
	        System.out.println("userName in UserCardAuthController : " + userName);
	    } else {
	        System.out.println("userName attribute not found.");
	    }

	    // cardType 가져오기
	    String cardType = (String) request.getParameter("cardType");
	    if (cardType != null) {
	        System.out.println("cardType in UserCardAuthController : " + cardType);
	    } else {
	        System.out.println("cardType attribute not found.");
	    }

	    // idCardFile 가져오기
	    String idCardFileName = (String) request.getAttribute("idCardFile");
	    if (idCardFileName != null) {
	        System.out.println("Saved Id Card File name : " + idCardFileName);
	    } else {
	        System.out.println("idCardFile attribute not found.");
	    }
		
	    String jsonData = "{\"userName\":\"" + userName + "\", \"cardType\":\"" + cardType + "\"}";

	    String responseJsonData = sendFileAndData(idCardFileName, jsonData);
	    System.out.println(responseJsonData); 
	    
	}
	
	private String sendFileAndData(String fileName, String jsonData) {
		
	    IdCardTransfer transfer = new IdCardTransfer();
	    String rcvdJsonData = null; // 응답 데이터 초기화

	    try {
	        rcvdJsonData = transfer.sendIdCardAndData(fileName, jsonData); // 응답 JSON 받기
	    } catch (Exception e) {
	        e.printStackTrace(); // 예외 로그
	    }

	    return rcvdJsonData; // 응답 데이터 반환
	}

}
