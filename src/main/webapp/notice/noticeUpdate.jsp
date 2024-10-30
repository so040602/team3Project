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
   --primary-color: #03C75A;
   --hover-color: #02b350;
   --background-color: #f5f6f8;
   --card-background: #FFFFFF;
   --text-primary: #222222;
   --text-secondary: #666666;
   --border-color: #e5e5e5;
   --error-color: #ff3b3b;
}

body {
   background-color: var(--background-color);
   font-family: 'Pretendard', -apple-system, BlinkMacSystemFont, system-ui, sans-serif;
   margin: 0;
   padding: 0;
   color: var(--text-primary);
   line-height: 1.5;
}

.container {
   max-width: 900px;
   margin: 40px auto;
   padding: 0 20px;
}

.notice-form {
   background: var(--card-background);
   border: 1px solid var(--border-color);
   border-radius: 8px;
}

.form-title {
   font-size: 24px;
   font-weight: 600;
   color: var(--text-primary);
   margin: 0;
   padding: 25px 30px;
   border-bottom: 1px solid var(--border-color);
}

.form-group {
   margin: 0;
   padding: 20px 30px;
   border-bottom: 1px solid var(--border-color);
}

.form-group:last-of-type {
   border-bottom: none;
}

label {
   display: block;
   margin-bottom: 10px;
   font-size: 14px;
   font-weight: 500;
   color: var(--text-primary);
}

input[type="text"],
textarea {
   width: 100%;
   padding: 12px 16px;
   border: 1px solid var(--border-color);
   border-radius: 4px;
   font-size: 14px;
   color: var(--text-primary);
   transition: all 0.2s;
   box-sizing: border-box;
   font-family: inherit;
}

input[type="text"]:focus,
textarea:focus {
   outline: none;
   border-color: var(--primary-color);
   background-color: #fafafa;
}

input[type="text"]::placeholder,
textarea::placeholder {
   color: #aaa;
}

textarea {
   min-height: 400px;
   resize: vertical;
   line-height: 1.6;
}

.button-group {
   padding: 20px 30px;
   display: flex;
   justify-content: center;
   gap: 12px;
   border-top: 1px solid var(--border-color);
   background-color: #fafbfc;
   margin: 0;
}

.btn {
   min-width: 120px;
   padding: 12px 24px;
   border-radius: 4px;
   font-size: 14px;
   font-weight: 500;
   text-decoration: none;
   display: inline-flex;
   align-items: center;
   justify-content: center;
   gap: 6px;
   transition: all 0.2s;
   cursor: pointer;
}

.btn i {
   font-size: 14px;
}

.btn-primary {
   background-color: var(--primary-color);
   color: white;
   border: none;
}

.btn-primary:hover {
   background-color: var(--hover-color);
}

.btn-cancel {
   background-color: white;
   color: var(--text-primary);
   border: 1px solid #dde0e4;
}

.btn-cancel:hover {
   background-color: #f8f9fa;
}

.error-message {
   color: var(--error-color);
   font-size: 14px;
   padding: 12px 16px;
   background-color: #fff8f8;
   border: 1px solid #ffe8e8;
   border-radius: 4px;
   margin: 20px 30px;
}

.required::after {
   content: "*";
   color: var(--error-color);
   margin-left: 4px;
}

@media (max-width: 768px) {
   .container {
       margin: 20px auto;
       padding: 0 15px;
   }

   .form-title {
       padding: 20px;
       font-size: 20px;
   }

   .form-group {
       padding: 15px 20px;
   }

   .button-group {
       padding: 15px 20px;
       flex-direction: column;
   }

   .btn {
       width: 100%;
   }

   .error-message {
       margin: 15px 20px;
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