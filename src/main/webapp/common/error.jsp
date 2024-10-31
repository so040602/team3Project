<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>오류 발생</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            color: #721c24;
            padding: 20px;
        }
        .error-container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
            padding: 20px;
        }
        h1 {
            font-size: 24px;
        }
        p {
            font-size: 16px;
        }
        a {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>오류 발생</h1>
        <p>죄송합니다. 오류가 발생했습니다. 다음의 오류 메시지를 참고해 주세요:</p>
        
        <p>
            <strong>오류 메시지:</strong> ${errorMessage}
        </p>
        
        <a href="<%=request.getHeader("Referer")%>">이전 페이지로 돌아가기</a>
    </div>
</body>
</html>
