package com.team3.utility;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;
import org.apache.http.entity.mime.content.FileBody;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

public class IdCardTransfer {

    private String fileUploadPath = AppConfig.getInstance().getFileUploadPath();

    public String sendIdCardAndData(String fileName, String jsonData) {
        System.out.println("jsonData in sendIdCardAndData() : " + jsonData);
        
        Path filePath = Paths.get(fileUploadPath, fileName);
        File file = filePath.toFile();
        String responseJson = null; // 응답 JSON 초기화

        if (file.exists()) {
            try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
                HttpPost uploadFile = new HttpPost(TeamUtility.getIdCardUploadUrl());

                // MultipartEntityBuilder 사용
                MultipartEntityBuilder builder = MultipartEntityBuilder.create();
                builder.addTextBody("data", jsonData, ContentType.APPLICATION_JSON);
                builder.addPart("file", new FileBody(file, ContentType.APPLICATION_OCTET_STREAM));
               
                uploadFile.setEntity(builder.build());

                // 요청 전송 및 응답 수신
                HttpResponse response = httpClient.execute(uploadFile);

                // 응답 본문을 문자열로 변환
                String responseBody = EntityUtils.toString(response.getEntity());

                // JSON 문자열을 JSONObject로 변환
                JSONObject jsonObject = new JSONObject(responseBody);

                // HashMap에 JSON 데이터 넣기
                Map<String, Object> hashMap = new HashMap<>();
                for (String key : jsonObject.keySet()) {
                    hashMap.put(key, jsonObject.get(key));
                    // 결과 확인
                    System.out.println("key: " + key + " / " + "val: " + jsonObject.get(key));
                }
                
                // 응답 JSON 반환
                responseJson = jsonObject.toString();

            } catch (IOException e) {
                e.printStackTrace(); // 에러 출력
            } catch (Exception e) {
                e.printStackTrace(); // 다른 에러 출력
            }
        } else {
            // 파일이 존재하지 않을 경우 메시지를 기록
            System.out.println("File not found: " + file.getAbsolutePath());
        }
        
        return responseJson; // 응답 JSON 반환
    }
}
