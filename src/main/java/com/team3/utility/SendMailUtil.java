package com.team3.utility;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;

public class SendMailUtil {
   
    //public static void main(String[] args) {
    //    sendEmailTo("recipient@example.com", "테스트 이메일", "안녕하세요, 이것은 테스트 이메일입니다.");
    //}

    public static void sendEmailTo(String mailto, String subject, String body) {
        // SMTP 서버 정보 설정
        String host = "smtp.naver.com"; // SMTP 서버 주소
        final String user = "greenpkk@naver.com"; // SMTP 서버 사용자명
        final String password = "greenpkk_9945"; // SMTP 서버 비밀번호

        // 이메일 속성 설정
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587"); // 일반적으로 587 사용
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true"); // TLS 사용

        // 세션 생성
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            // 이메일 메시지 생성
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailto));
            message.setSubject(subject);
            message.setText(body);

            // 이메일 전송
            Transport.send(message);

            System.out.println("이메일이 성공적으로 전송되었습니다.");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

}

