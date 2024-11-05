<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.team3.model.bean.Review" %>
<%@ page import="java.util.List" %>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<%
String appName = request.getContextPath();
String mappingName = "/coolapp";
String postForm = appName + mappingName;
String getEnvs = appName + mappingName + "?opsmode=";
Review review = (Review) request.getAttribute("review");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰 상세보기 - <%= review.getReview_title() %></title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    :root {
        --primary-color: #03C75A;
        --hover-color: #02b350;
        --error-color: #ff3b3b;
        --border-color: #e1e1e1;
        --bg-color: #f8f9fa;
        --text-color: #333;
        --text-secondary: #666;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Noto Sans KR', -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
        background-color: var(--bg-color);
        color: var(--text-color);
        line-height: 1.6;
    }

    .container {
        max-width: 800px;
        margin: 2rem auto;
        padding: 2rem;
        background: white;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    .header {
        margin-bottom: 2rem;
        padding-bottom: 1rem;
        border-bottom: 2px solid var(--border-color);
    }

    .header h1 {
        font-size: 1.8rem;
        color: var(--text-color);
        margin-bottom: 0.5rem;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .meta-info {
        display: flex;
        gap: 1.5rem;
        color: var(--text-secondary);
        font-size: 0.9rem;
        margin-top: 1rem;
    }

    .meta-item {
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .review-content {
        margin: 2rem 0;
        padding: 1.5rem;
        background-color: var(--bg-color);
        border-radius: 8px;
        white-space: pre-wrap;
        line-height: 1.8;
    }

    .button-group {
        display: flex;
        gap: 1rem;
        margin-top: 2rem;
        border-top: 1px solid var(--border-color);
        padding-top: 1.5rem;
    }

    .btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 0.75rem 1.5rem;
        border: none;
        border-radius: 5px;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
        gap: 0.5rem;
    }

    .btn-primary {
        background-color: var(--primary-color);
        color: white;
    }

    .btn-primary:hover {
        background-color: var(--hover-color);
    }

    .btn-secondary {
        background-color: var(--bg-color);
        color: var(--text-color);
    }

    .btn-secondary:hover {
        background-color: #e9ecef;
    }

    .btn-danger {
        background-color: var(--error-color);
        color: white;
    }

    .btn-danger:hover {
        background-color: #dc3545;
    }

    .book-info {
        background-color: #f8f9fa;
        border-left: 4px solid var(--primary-color);
        padding: 1rem;
        margin: 1rem 0;
        border-radius: 0 4px 4px 0;
    }

    .book-info h3 {
        font-size: 1rem;
        color: var(--text-secondary);
        margin-bottom: 0.5rem;
    }

    @media (max-width: 768px) {
        .container {
            margin: 1rem;
            padding: 1rem;
        }

        .header h1 {
            font-size: 1.5rem;
        }

        .meta-info {
            flex-wrap: wrap;
            gap: 1rem;
        }

        .button-group {
            flex-wrap: wrap;
        }

        .btn {
            width: 100%;
            justify-content: center;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>
                <i class="fas fa-book-open"></i>
                <%= review.getReview_title() %>
            </h1>
            
            <div class="book-info">
                <h3>리뷰 도서</h3>
                <strong><%= review.getBook_name() %></strong>
            </div>

            <div class="meta-info">
                <div class="meta-item">
                    <i class="fas fa-user"></i>
                    <%= review.getMemid() %>
                </div>
                <div class="meta-item">
                    <i class="far fa-eye"></i>
                    조회수 <%= review.getReview_cnt() %>
                </div>
                <div class="meta-item">
                    <i class="far fa-calendar-alt"></i>
                    <%= review.getReview_regdate() %>
                </div>
                <% if (review.getReview_updated() != null) { %>
                <div class="meta-item">
                    <i class="fas fa-edit"></i>
                    수정일 <%= review.getReview_updated() %>
                </div>
                <% } %>
            </div>
        </div>

        <div class="review-content">
            <%= review.getReview_body() %>
        </div>

        <div class="button-group">
            <a href="<%= getEnvs %>reviewList" class="btn btn-secondary">
                <i class="fas fa-list"></i> 목록으로
            </a>
            <a href="<%= getEnvs %>reviewUpdate&reviewidx=<%= review.getReviewidx() %>" class="btn btn-primary">
                <i class="fas fa-edit"></i> 수정
            </a>
            <a href="#" onclick="confirmDelete(<%= review.getReviewidx() %>)" class="btn btn-danger">
                <i class="fas fa-trash-alt"></i> 삭제
            </a>
        </div>
    </div>

    <script>
    function confirmDelete(reviewidx) {
        if (confirm('정말로 이 리뷰를 삭제하시겠습니까?')) {
            window.location.href = '<%= getEnvs %>reviewDelete&reviewidx=' + reviewidx;
        }
    }
    </script>
</body>
</html>