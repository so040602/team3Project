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
<title>리뷰 수정</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    :root {
        --primary-color: #03C75A;
        --hover-color: #02b350;
        --error-color: #ff3b3b;
        --border-color: #e1e1e1;
        --bg-color: #f8f9fa;
        --text-color: #333;
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

    .form-group {
        margin-bottom: 1.5rem;
    }

    label {
        display: block;
        font-weight: 600;
        margin-bottom: 0.5rem;
        color: var(--text-color);
    }

    input[type="text"],
    input[type="number"],
    textarea {
        width: 100%;
        padding: 0.75rem;
        border: 1px solid var(--border-color);
        border-radius: 5px;
        font-size: 1rem;
        transition: border-color 0.3s ease;
    }

    input[type="text"]:focus,
    textarea:focus {
        outline: none;
        border-color: var(--primary-color);
        box-shadow: 0 0 0 3px rgba(3, 199, 90, 0.1);
    }

    textarea {
        min-height: 200px;
        resize: vertical;
    }

    .readonly-field {
        background-color: var(--bg-color);
        cursor: not-allowed;
    }

    .button-group {
        display: flex;
        gap: 1rem;
        margin-top: 2rem;
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

    .error-message {
        color: var(--error-color);
        font-size: 0.875rem;
        margin-top: 0.25rem;
        display: none;
    }

    .meta-info {
        background-color: var(--bg-color);
        padding: 1rem;
        border-radius: 5px;
        margin-bottom: 1.5rem;
    }

    .meta-info p {
        margin: 0;
        display: flex;
        align-items: center;
        gap: 0.5rem;
        color: var(--text-color);
        font-size: 0.9rem;
    }

    @media (max-width: 768px) {
        .container {
            margin: 1rem;
            padding: 1rem;
        }

        .header h1 {
            font-size: 1.5rem;
        }

        .btn {
            padding: 0.5rem 1rem;
        }

        .button-group {
            flex-direction: column;
        }

        .btn {
            width: 100%;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>
                <i class="fas fa-edit"></i>
                리뷰 수정
            </h1>
        </div>

        <form id="updateForm" action="<%=getEnvs%>reviewUpdate" method="post">
            <input type="hidden" name="reviewidx" value="<%= review.getReviewidx() %>">
            
            <div class="meta-info">
                <p>
                    <i class="fas fa-book"></i>
                    <strong>도서:</strong> <%= review.getBook_name() %>
                </p>
                <p>
                    <i class="fas fa-user"></i>
                    <strong>작성자:</strong> <%= review.getMemid() %>
                </p>
                <p>
                    <i class="far fa-eye"></i>
                    <strong>조회수:</strong> <%= review.getReview_cnt() %>
                </p>
            </div>

            <div class="form-group">
                <label for="review_title">제목 <span style="color: var(--error-color)">*</span></label>
                <input type="text" id="review_title" name="review_title" 
                       value="<%= review.getReview_title() %>" 
                       maxlength="100" required>
                <div id="titleError" class="error-message">제목을 입력해주세요.</div>
            </div>

            <div class="form-group">
                <label for="review_body">내용 <span style="color: var(--error-color)">*</span></label>
                <textarea id="review_body" name="review_body" required><%= review.getReview_body() %></textarea>
                <div id="bodyError" class="error-message">내용을 입력해주세요.</div>
            </div>

            <div class="button-group">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> 수정 완료
                </button>
                <a href="<%=getEnvs%>reviewDetail&reviewidx=<%= review.getReviewidx() %>" class="btn btn-secondary">
                    <i class="fas fa-times"></i> 취소
                </a>
            </div>
        </form>
    </div>

    <script>
    document.getElementById('updateForm').addEventListener('submit', function(e) {
        let isValid = true;
        const title = document.getElementById('review_title');
        const body = document.getElementById('review_body');
        
        // 제목 검증
        if (!title.value.trim()) {
            document.getElementById('titleError').style.display = 'block';
            isValid = false;
        } else {
            document.getElementById('titleError').style.display = 'none';
        }
        
        // 내용 검증
        if (!body.value.trim()) {
            document.getElementById('bodyError').style.display = 'block';
            isValid = false;
        } else {
            document.getElementById('bodyError').style.display = 'none';
        }
        
        // 제목 길이 검증
        if (title.value.length > 100) {
            alert('제목은 100자를 초과할 수 없습니다.');
            isValid = false;
        }
        
        if (!isValid) {
            e.preventDefault();
        }
    });

    // 입력 필드 변경 시 에러 메시지 숨기기
    ['review_title', 'review_body'].forEach(id => {
        document.getElementById(id).addEventListener('input', function() {
            const errorElement = document.getElementById(id.replace('review_', '') + 'Error');
            if (errorElement) {
                errorElement.style.display = 'none';
            }
        });
    });
    </script>
</body>
</html>