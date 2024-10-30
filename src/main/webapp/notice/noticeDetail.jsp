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
	--success-color: #2ECC71;
}

body {
	background-color: var(--background-color);
	font-family: 'Pretendard', -apple-system, BlinkMacSystemFont, system-ui,
		Roboto, sans-serif;
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
	white-space: pre-wrap;
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
	justify-content: center;
	gap: 1rem;
	margin-top: 2rem;
}

.btn {
	padding: 0.75rem 2rem;
	border-radius: 8px;
	font-weight: 500;
	text-decoration: none;
	transition: all 0.2s ease;
}

.btn-back {
	background-color: var(--background-color);
	color: var(--text-primary);
}

.btn-back:hover {
	background-color: var(--border-color);
}

@media ( max-width : 768px) {
	.container {
		padding: 1rem;
	}
	.notice-detail {
		padding: 1.5rem;
	}
	.notice-title {
		font-size: 1.5rem;
	}
	.notice-meta {
		flex-direction: column;
		gap: 0.5rem;
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

			<div class="notice-content">
				<%=notice.getNoticeContent()%>
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
				<a href="<%=getEnvs%>noticeList" class="btn btn-back"> <i
					class="fas fa-arrow-left"></i> 목록으로 돌아가기
				</a>
			</div>
		</div>
	</div>
</body>
</html>