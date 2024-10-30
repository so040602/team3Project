<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="com.team3.model.bean.Notice"%>
<%@ page import="com.team3.model.dao.NoticeDao"%>

<%
int noticeId = Integer.parseInt(request.getParameter("id"));
NoticeDao dao = new NoticeDao();
Notice notice = dao.selectNoticeById(noticeId);

String appName = request.getContextPath();
String mappingName = "/coolapp";
String postForm = appName + mappingName;
String getEnvs = appName + mappingName + "?opsmode=";
%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 상세보기</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

.notice-detail {
   background: var(--card-background);
   border-radius: 16px;
   box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
   padding: 2rem;
}

.notice-header {
   border-bottom: 1px solid var(--border-color);
   padding-bottom: 1.5rem;
   margin-bottom: 1.5rem;
}

.notice-title {
   font-size: 1.75rem;
   font-weight: 700;
   color: var(--text-primary);
   margin-bottom: 1rem;
}

.notice-meta {
   display: flex;
   justify-content: space-between;
   color: var(--text-secondary);
   font-size: 0.95rem;
}

.notice-meta-left {
   display: flex;
   gap: 1.5rem;
}

.notice-content {
   line-height: 1.8;
   font-size: 1.05rem;
   color: var(--text-primary);
   min-height: 200px;
   white-space: pre-line;
   padding: 2rem 0;
   word-break: keep-all;
   letter-spacing: -0.025em;
}

.content-wrapper {
   max-width: 100%;
   margin: 0 auto;
}

.attachment-section {
   margin-top: 2rem;
   padding-top: 1.5rem;
   border-top: 1px solid var(--border-color);
}

.attachment-title {
   font-weight: 600;
   margin-bottom: 1rem;
   color: var(--text-primary);
}

.attachment-list {
   display: flex;
   gap: 1rem;
   flex-wrap: wrap;
}

.attachment-item {
   display: flex;
   align-items: center;
   gap: 0.5rem;
   padding: 0.5rem 1rem;
   background-color: var(--background-color);
   border-radius: 8px;
   color: var(--primary-color);
   text-decoration: none;
}

.attachment-item:hover {
   background-color: #E8F0FE;
}

.button-group {
   display: flex;
   justify-content: space-between;
   align-items: center;
   gap: 1rem;
   margin-top: 2rem;
}

.button-group-right {
   display: flex;
   gap: 1rem;
}

.btn {
   padding: 0.75rem 2rem;
   border-radius: 8px;
   font-weight: 500;
   text-decoration: none;
   display: inline-flex;
   align-items: center;
   gap: 0.5rem;
   transition: all 0.2s ease;
   border: none;
   cursor: pointer;
}

.btn-back {
   background-color: var(--background-color);
   color: var(--text-primary);
}

.btn-back:hover {
   background-color: var(--border-color);
}

.btn-edit {
   background-color: var(--primary-color);
   color: white;
}

.btn-edit:hover {
   background-color: var(--hover-color);
}

.btn-delete {
   background-color: var(--error-color);
   color: white;
}

.btn-delete:hover {
   background-color: #C0392B;
}

@media (max-width: 768px) {
   .container {
       padding: 1rem;
   }
   
   .notice-detail {
       padding: 1.5rem;
   }
   
   .notice-title {
       font-size: 1.5rem;
   }
   
   .notice-content {
       padding: 1.5rem 0;
       font-size: 1rem;
   }
   
   .notice-meta {
       flex-direction: column;
       gap: 0.5rem;
   }
   
   .button-group {
       flex-direction: column;
   }
   
   .button-group-right {
       width: 100%;
       justify-content: space-between;
   }
   
   .btn {
       flex: 1;
       justify-content: center;
       padding: 0.75rem 1rem;
   }
}
</style>
</head>
<body>
	<div class="container">
		<div class="notice-detail">
			<div class="notice-header">
				<h1 class="notice-title"><%=notice.getNoticeTitle()%></h1>
				<div class="notice-meta">
					<div class="notice-meta-left">
						<span><i class="fas fa-user"></i> <%=notice.getNoticeAuthor()%></span>
						<span><i class="far fa-calendar"></i> <%=notice.getFormattedNoticeCreated()%></span>
					</div>
					<div class="notice-meta-right">
						<span><i class="far fa-eye"></i> 조회수 <%=notice.getNoticeViews()%></span>
					</div>
				</div>
			</div>

			<div class="content-wrapper">
				<div class="notice-content">
					<%=notice.getNoticeContent().replaceAll("\n", "<br/>")%>
				</div>
			</div>

			<%
			if (notice.getNoticeAttachments() != null && !notice.getNoticeAttachments().isEmpty()) {
			%>
			<div class="attachment-section">
				<div class="attachment-title">
					<i class="fas fa-paperclip"></i> 첨부파일
				</div>
				<div class="attachment-list">
					<%
					String[] attachments = notice.getNoticeAttachments().split(",");
					for (String attachment : attachments) {
						if (!attachment.trim().isEmpty()) {
					%>
					<a href="download.jsp?file=<%=attachment.trim()%>"
						class="attachment-item"> <i class="fas fa-file"></i> <%=attachment.trim()%>
					</a>
					<%
					}
					}
					%>
				</div>
			</div>
			<%
			}
			%>

			<div class="button-group">
    <div class="button-group-left">
        <a href="<%=getEnvs%>noticeList" class="btn btn-back">
            <i class="fas fa-arrow-left"></i> 목록으로
        </a>
    </div>
    <div class="button-group-right">
        <a href="<%=getEnvs%>noticeUpdate&id=<%=notice.getNoticeId()%>" class="btn btn-edit">
            <i class="fas fa-edit"></i> 수정
        </a>
        <a href="#" onclick="confirmDelete(<%=notice.getNoticeId()%>); return false;" class="btn btn-delete">
            <i class="fas fa-trash-alt"></i> 삭제
        </a>
    </div>
</div>


			<!-- JavaScript 추가 -->
<script>
function confirmDelete(noticeId) {
    if (confirm('정말 이 공지사항을 삭제하시겠습니까?')) {
        window.location.href = '<%=getEnvs%>noticeDelete&id=' + noticeId;
    }
}
</script>
		</div>
	</div>
</body>
</html>