package com.team3.utility;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpRequest.BodyPublishers;
import java.nio.file.Files;

public class FileTransferApi {

    public String sendFileToServer(File file, String targetUrl, String jsonData) {
        System.out.println("Entering sendFileToServer() ++++++++++++++++");
        System.out.println("File: " + file);
        System.out.println("Target URL: " + targetUrl);
        System.out.println("JSON Data: " + jsonData);

        HttpClient client = HttpClient.newHttpClient();
        String jsonResponse = null;

        try {
            // Determine content type based on the file's MIME type
            String mimeType = Files.probeContentType(file.toPath());
            if (mimeType == null) {
                mimeType = "application/octet-stream"; // Default to binary if type cannot be determined
            }

            // Create a unique boundary for multipart data
            String boundary = Long.toHexString(System.currentTimeMillis());

            // Build the multipart body using StringBuilder
            StringBuilder requestBody = new StringBuilder();
            requestBody.append("--").append(boundary).append("\r\n")
                       .append("Content-Disposition: form-data; name=\"json\"\r\n\r\n")
                       .append(jsonData).append("\r\n")
                       .append("--").append(boundary).append("\r\n")
                       .append("Content-Disposition: form-data; name=\"file\"; filename=\"").append(file.getName()).append("\"\r\n")
                       .append("Content-Type: ").append(mimeType).append("\r\n\r\n");

            // Read file as bytes
            byte[] fileBytes = Files.readAllBytes(file.toPath());
            requestBody.append(new String(fileBytes)).append("\r\n")
                       .append("--").append(boundary).append("--\r\n");

            // Create the HTTP request
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(targetUrl))
                    .header("Content-Type", "multipart/form-data; boundary=" + boundary)
                    .POST(BodyPublishers.ofString(requestBody.toString()))
                    .build();

            // Send the request
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            System.out.println("Response status code: " + response.statusCode());

            // Check for successful response
            if (response.statusCode() == 200) {
                jsonResponse = response.body();
                System.out.println("Response body: " + jsonResponse);
            } else {
                System.out.println("Failed to upload file. Server responded with: " + response.body());
            }
        } catch (IOException e) {
            System.err.println("IOException occurred: " + e.getMessage());
            e.printStackTrace();
        } catch (InterruptedException e) {
            System.err.println("Request was interrupted: " + e.getMessage());
            Thread.currentThread().interrupt(); // Restore interrupted status
        }

        System.out.println("jsonResponse +++++++++++++++");
        System.out.println(jsonResponse);
        System.out.println("jsonResponse +++++++++++++++");

        return jsonResponse; // Return the JSON response if successful
    }
}
