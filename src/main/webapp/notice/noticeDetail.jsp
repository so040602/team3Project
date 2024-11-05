<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="com.team3.model.bean.Notice"%>
<%@ page import="com.team3.model.dao.NoticeDao"%>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

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
    font-family: 'Noto Sans KR', -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
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

.notice-detail {
    background: var(--card-background);
    border: 1px solid var(--border-color);
    border-radius: 8px;
}

.notice-header {
    padding: 30px;
    border-bottom: 1px solid var(--border-color);
}

.notice-title {
    font-size: 24px;
    font-weight: 600;
    color: var(--text-primary);
    margin: 0 0 20px 0;
    line-height: 1.4;
}

.notice-meta {
    display: flex;
    justify-content: space-between;
    color: var(--text-secondary);
    font-size: 14px;
}

.notice-meta-left {
    display: flex;
    gap: 20px;
}

.notice-meta-left span,
.notice-meta-right span {
    display: flex;
    align-items: center;
    gap: 6px;
}

.notice-meta i {
    color: #999;
    font-size: 14px;
}

.content-wrapper {
    padding: 30px;
}

.notice-content {
    color: var(--text-primary);
    font-size: 15px;
    line-height: 1.8;
    white-space: pre-line;
    word-break: keep-all;
}

.attachment-section {
    margin-top: 30px;
    padding: 20px 30px;
    background-color: #f9fafb;
    border-top: 1px solid var(--border-color);
}

.attachment-title {
    font-size: 15px;
    font-weight: 600;
    color: var(--text-primary);
    margin-bottom: 15px;
    display: flex;
    align-items: center;
    gap: 8px;
}

.attachment-list {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.attachment-item {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 8px 12px;
    background-color: white;
    border: 1px solid var(--border-color);
    border-radius: 4px;
    color: var(--text-primary);
    text-decoration: none;
    font-size: 14px;
}

.attachment-item:hover {
    background-color: #f8f9fa;
    border-color: var(--primary-color);
}

.button-group {
    padding: 20px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-top: 1px solid var(--border-color);
}

.button-group-right {
    display: flex;
    gap: 8px;
}

.btn {
    padding: 8px 16px;
    border-radius: 4px;
    font-size: 14px;
    font-weight: 500;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 6px;
    transition: all 0.2s;
}

.btn-back {
    background-color: #f8f9fa;
    color: var(--text-primary);
    border: 1px solid #dde0e4;
}

.btn-back:hover {
    background-color: #eceef0;
}

.btn-edit {
    background-color: var(--primary-color);
    color: white;
    border: none;
}

.btn-edit:hover {
    background-color: var(--hover-color);
}

.btn-delete {
    background-color: white;
    color: var(--error-color);
    border: 1px solid var(--error-color);
}

.btn-delete:hover {
    background-color: #fff1f1;
}

@media (max-width: 768px) {
    .container {
        margin: 20px auto;
    }

    .notice-header,
    .content-wrapper,
    .button-group {
        padding: 20px;
    }

    .notice-title {
        font-size: 20px;
        margin-bottom: 15px;
    }

    .notice-meta {
        flex-direction: column;
        gap: 10px;
    }

    .notice-meta-left {
        gap: 15px;
    }

    .button-group {
        flex-direction: column-reverse;
        gap: 15px;
    }

    .button-group-left,
    .button-group-right {
        width: 100%;
        display: flex;
        gap: 8px;
    }

    .btn {
        flex: 1;
        justify-content: center;
    }

    .attachment-section {
        padding: 15px 20px;
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