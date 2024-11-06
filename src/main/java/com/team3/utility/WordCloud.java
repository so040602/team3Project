package com.team3.utility;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.imageio.ImageIO;

public class WordCloud {

//    private String fileUploadPath = "http://127.0.0.1:5000/wordcloud";

    // 파일 없이 JSON 데이터를 보내는 메서드
    public byte[] sendJsonData(String jsonData) {
//        System.out.println("jsonData in sendJsonData(): " + jsonData);
            	
        String cleanedJsonData = removeSpecialCharacters(jsonData);
        
        System.out.println("cleanedJsonData in sendJsonData(): " + cleanedJsonData);

        String responseJson = null; // 응답 JSON 초기화
        
        byte[] imageData = null;

        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            // 서버로 전송할 URL을 설정
        	HttpPost uploadFile = new HttpPost(PythonApiUtil.getWordCloudUploadUrl());
//            HttpPost uploadFile = new HttpPost(fileUploadPath);
         // cleanedJsonData를 JSON 객체로 감싸기
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("text", cleanedJsonData);  // cleanedJsonData를 "text" 키로 감쌈

            // JSON 객체를 StringEntity로 변환
            StringEntity entity = new StringEntity(jsonObject.toString(), "UTF-8");
         
            // JSON 데이터를 Content-Type: application/json 으로 설정
            entity.setContentType("application/json; charset=UTF-8");
            
            System.out.println("entity in json: " + entity);

            // 요청에 entity 추가
            uploadFile.setEntity(entity);

            // 요청 전송 및 응답 수신
            HttpResponse response = httpClient.execute(uploadFile);

            // 응답 본문을 바이트 배열로 변환 (이미지 데이터)
            byte[] responseBody = EntityUtils.toByteArray(response.getEntity());
            
            
            // 바이트 배열을 BufferedImage로 변환
            InputStream byteArrayInputStream = new ByteArrayInputStream(responseBody);
            BufferedImage image = ImageIO.read(byteArrayInputStream); // 워드 클라우드 이미지 생성 메서드 호출
            
            // 이미지를 바이트 배열로 변환
            try(ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream()){
            	ImageIO.write(image, "PNG", byteArrayOutputStream);
            	imageData = byteArrayOutputStream.toByteArray();
            }
        }catch (IOException e) {
			// TODO: handle exception
            e.printStackTrace();
		}
            
        return imageData;
            
    }

	private BufferedImage generateWordCloudImage(JSONObject jsonObject) {
		// TODO Auto-generated method stub
		return new BufferedImage(400, 400, BufferedImage.TYPE_INT_ARGB);
	}
	
	private String removeSpecialCharacters(String input) {
	    // 정규 표현식으로 특수 문자를 제거 (알파벳과 숫자만 허용)
	    return input.replaceAll("[^a-zA-Z0-9가-힣\\s]", "");
	}
}