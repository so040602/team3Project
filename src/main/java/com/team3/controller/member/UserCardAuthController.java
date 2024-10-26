package com.team3.controller.member;

import java.io.File;
import java.util.Enumeration;

import org.json.JSONObject;

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
	    System.out.println("responseJsonData : " + responseJsonData);

        try {
            // JSON 객체 생성
            JSONObject jsonObject = new JSONObject(responseJsonData);
            
        	// 결과 값 가져오기
            String resResult = jsonObject.getString("result");
            //String resFileName = jsonObject.getString("file");
            //String resCardType = jsonObject.getString("cardType");
            //String resUserName = jsonObject.getString("userName");

    	    if(resResult.equalsIgnoreCase("FAILURE")) {
    			String message = "사용자 인증 정보가 잘못 되었습니다.";
    			super.setAlertMessage(message);
    	    	super.gotoPage("member/userAuthStartForm.jsp");

    	    } else {

                // cardData 객체 가져오기
                JSONObject cardData = jsonObject.getJSONObject("cardData");
    	    	
    	        // 각 키에 해당하는 값 가져오기
    	        String username = cardData.getString("username");
    	        String birth = cardData.getString("birth");
    	        String gender = cardData.isNull("gender") ? null : cardData.getString("gender");
    	        String addr01 = cardData.getString("addr01");
    	        String addr02 = cardData.getString("addr02");
    	        String issued = cardData.getString("issued");
    	        String office = cardData.getString("office");
    	        
    		    request.setAttribute("parsedName", username);
    		    request.setAttribute("parsedBirth", birth);
    		    request.setAttribute("parsedGender", gender);
    		    request.setAttribute("parsedAddr01", addr01);
    		    request.setAttribute("parsedAddr02", addr02);
    		    
    	    	super.gotoPage("member/memInsertForm.jsp");
    	    } 	
			
		} catch (Exception e) {
			
			String message = "사용자 인증 서버가 작동중이지 않습니다.";
			super.setAlertMessage(message);
	    	super.gotoPage("member/userAuthStartForm.jsp");
	    	
			e.printStackTrace();
		}
	    
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
