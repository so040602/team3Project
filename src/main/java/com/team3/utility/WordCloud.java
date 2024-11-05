package com.team3.utility;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

import java.io.IOException;

public class WordCloud {

    private String fileUploadPath = AppConfig.getInstance().getFileUploadPath();

    // 파일 없이 JSON 데이터를 보내는 메서드
    public String sendJsonData(String jsonData) {
        System.out.println("jsonData in sendJsonData(): " + jsonData);

        String responseJson = null; // 응답 JSON 초기화

        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            // 서버로 전송할 URL을 설정
            HttpPost uploadFile = new HttpPost(PythonApiUtil.getWordCloudUploadUrlTest());

            // StringEntity를 사용하여 JSON 데이터 설정
            StringEntity entity = new StringEntity(jsonData);

            // JSON 데이터를 Content-Type: application/json 으로 설정
            entity.setContentType("application/json");

            // 요청에 entity 추가
            uploadFile.setEntity(entity);

            // 요청 전송 및 응답 수신
            HttpResponse response = httpClient.execute(uploadFile);

            // 응답 본문을 문자열로 변환
            String responseBody = EntityUtils.toString(response.getEntity());

            // JSON 문자열을 JSONObject로 변환
            JSONObject jsonObject = new JSONObject(responseBody);

            // 응답 JSON 반환
            responseJson = jsonObject.toString();
            
            // 결과 출력 (옵션)
            System.out.println("Response JSON: " + responseJson);

        } catch (IOException e) {
            e.printStackTrace(); // 에러 출력
        } catch (Exception e) {
            e.printStackTrace(); // 다른 에러 출력
        }

        return responseJson; // 응답 JSON 반환
    }
}