package com.team3.utility;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.http.entity.mime.content.FileBody;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

public class IdCardTransfer_bak {

    String fileUploadPath = AppConfig.getInstance().getFileUploadPath();
    private final String uploadUrl = "http://localhost:5050/idcard"; // 파일 업로드 URL

    public String sendIdCardAndData(String fileName, String jsonData) {
        Path filePath = Paths.get(fileUploadPath, fileName);
        File file = filePath.toFile();
        String responseJson = null; // 응답 JSON 초기화

        if (file.exists()) {
            try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
                HttpPost uploadFile = new HttpPost(uploadUrl);

                // MultipartEntityBuilder 사용
                MultipartEntityBuilder builder = MultipartEntityBuilder.create();
                builder.addTextBody("json", jsonData, ContentType.APPLICATION_JSON);
                builder.addPart("file", new FileBody(file, ContentType.APPLICATION_OCTET_STREAM));

                uploadFile.setEntity(builder.build());

                // 요청 전송 및 응답 수신
                HttpResponse response = httpClient.execute(uploadFile);

                // 응답 확인
                if (response.getStatusLine().getStatusCode() == 200) {
                    responseJson = EntityUtils.toString(response.getEntity()); // 응답을 문자열로 변환
                    System.out.println("Response from server: " + responseJson);
                } else {
                    System.out.println("Failed to send data: " + response.getStatusLine().getStatusCode());
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            // 파일이 존재하지 않을 경우 메시지를 기록
            System.out.println("File not found: " + file.getAbsolutePath());
        }
        
        return responseJson; // 응답 JSON 반환
    }
}
