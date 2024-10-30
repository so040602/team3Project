<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="com.team3.model.bean.Notice"%>
<%
String appName = request.getContextPath();
String mappingName = "/coolapp";
String postForm = appName + mappingName;
String getEnvs = appName + mappingName + "?opsmode=";

Notice notice = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 수정</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #4A90E2;
            --hover-color: #357ABD;
            --background-color: #F5F7FA;
            --card-background: #FFFFFF;
            --text-primary: #2C3E50;
            --text-secondary: #7F8C8D;
            --border-color: #E0E6ED;
            --error-color: #E74C3C;
            --success-color: #2ECC71;
        }

        body {
            background-color: var(--background-color);
            font-family: 'Pretendard', -apple-system, BlinkMacSystemFont, system-ui, Roboto, sans-serif;
            margin: 0;
            padding: 20px;
            color: var(--text-primary);
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 2rem;
        }

        .notice-form {
            background: var(--card-background);
            border-radius: 16px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            padding: 2rem;
        }

        .form-title {
            font-size: 1.75rem;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid var(--border-color);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--text-primary);
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            font-size: 1rem;
            color: var(--text-primary);
            transition: all 0.2s ease;
        }

        input[type="text"]:focus,
        textarea:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(74, 144, 226, 0.1);
        }

        textarea {
            min-height: 300px;
            resize: vertical;
        }

        .button-group {
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn {
            padding: 0.75rem 2rem;
            border-radius: 8px;
            font-weight: 500;
            text-decoration: none;
            border: none;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-primary:hover {
            background-color: var(--hover-color);
        }

        .btn-cancel {
            background-color: var(--background-color);
            color: var(--text-primary);
        }

        .btn-cancel:hover {
            background-color: var(--border-color);
        }

        .error-message {
            color: var(--error-color);
            font-size: 0.9rem;
            margin-top: 0.5rem;
        }

        .required::after {
            content: "*";
            color: var(--error-color);
            margin-left: 4px;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            .notice-form {
                padding: 1.5rem;
            }

            .button-group {
                flex-direction: column;
            }

            .btn {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <form class="notice-form" action="<%=getEnvs%>noticeUpdate" method="post">
            <h1 class="form-title">공지사항 수정</h1>

            <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("errorMessage") %>
            </div>
            <% } %>

            <input type="hidden" name="id" value="<%= notice.getNoticeId() %>">

            <div class="form-group">
                <label class="required" for="title">제목</label>
                <input type="text" id="title" name="title" required
                       value="<%= notice.getNoticeTitle() %>" 
                       placeholder="제목을 입력하세요">
            </div>

            <div class="form-group">
                <label class="required" for="author">작성자</label>
                <input type="text" id="author" name="author" required
                       value="<%= notice.getNoticeAuthor() %>" 
                       placeholder="작성자를 입력하세요">
            </div>

            <div class="form-group">
                <label class="required" for="content">내용</label>
                <textarea id="content" name="content" required
                          placeholder="내용을 입력하세요"><%= notice.getNoticeContent() %></textarea>
            </div>

            <div class="form-group">
                <label for="attachments">첨부파일</label>
                <input type="text" id="attachments" name="attachments"
                       value="<%= notice.getNoticeAttachments() != null ? notice.getNoticeAttachments() : "" %>" 
                       placeholder="첨부파일 경로를 입력하세요">
            </div>

            <div class="button-group">
                <a href="<%=getEnvs%>noticeDetail&id=<%= notice.getNoticeId() %>" class="btn btn-cancel">취소</a>
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> 수정완료
                </button>
            </div>
        </form>
    </div>
</body>
</html>