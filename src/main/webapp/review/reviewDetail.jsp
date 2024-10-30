<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.team3.model.bean.Review" %>
<%
    Review review = (Review) request.getAttribute("review");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>서평 상세보기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 20px;
        }
        h1 {
            color: #333;
        }
        .review-container {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .review-title {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .review-body {
            margin-bottom: 15px;
        }
        .review-meta {
            font-size: 14px;
            color: #666;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #007BFF;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>서평 상세보기</h1>
    <div class="review-container">
        <% if (review != null) { %>
            <div class="review-title"><%= review.getReview_title() %></div>
            <div class="review-body"><%= review.getReview_body() %></div>
            <div class="review-meta">
                <p>조회수: <%= review.getReview_cnt() %></p>
                <p>작성일: <%= review.getReview_regdate() %></p>
                <p>책 제목: <%= review.getBook_name() %></p>
                <p>작성자: <%= review.getMemid() %></p>
            </div>
        <% } else { %>
            <p>서평 정보를 불러오는 데 실패했습니다.</p>
        <% } %>
    </div>
    <a class="back-link" href="reviewList.jsp">목록으로 돌아가기</a>
</body>
</html>
