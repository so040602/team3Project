<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.team3.model.bean.Notice"%>
<%@ page import="com.team3.model.dao.NoticeDao"%>

<%
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
<title>공지사항</title>
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
	max-width: 1200px;
	margin: 0 auto;
	padding: 2rem;
}

.board-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 2rem;
}

h1 {
	font-size: 2rem;
	font-weight: 700;
	color: var(--text-primary);
	margin: 0;
}

.notice-card {
	background: var(--card-background);
	border-radius: 16px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
	overflow: hidden;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th {
	background-color: var(--card-background);
	color: var(--text-primary);
	font-weight: 600;
	padding: 1.25rem 1rem;
	text-align: left;
	border-bottom: 2px solid var(--border-color);
	position: sticky;
	top: 0;
	z-index: 10;
}

td {
	padding: 1.25rem 1rem;
	border-bottom: 1px solid var(--border-color);
	color: var(--text-primary);
}

tr:hover {
	background-color: rgba(74, 144, 226, 0.05);
	transition: background-color 0.2s ease;
}

.notice-title {
	color: var(--primary-color);
	font-weight: 500;
	display: flex;
	align-items: center;
	gap: 0.5rem;
}

.notice-title:hover {
	color: var(--hover-color);
}

.notice-meta {
	color: var(--text-secondary);
	font-size: 0.9rem;
}

.views-count {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 0.25rem;
	color: var(--text-secondary);
}

.no-data {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 4rem 2rem;
	text-align: center;
	color: var(--text-secondary);
	background: var(--card-background);
	border-radius: 16px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
}

.no-data i {
	font-size: 3rem;
	margin-bottom: 1rem;
	color: var(--border-color);
}

@media ( max-width : 768px) {
	.container {
		padding: 1rem;
	}
	h1 {
		font-size: 1.5rem;
	}
	th, td {
		padding: 1rem 0.75rem;
	}
	.notice-meta {
		font-size: 0.8rem;
	}
	.mobile-hide {
		display: none;
	}
}
</style>
</head>
<body>
	<div class="container">
		<div class="board-header">
			<h1>공지사항</h1>
		</div>

		<%
		NoticeDao dao = new NoticeDao();
		List<Notice> notices = dao.selectAllNotices();

		if (notices.isEmpty()) {
		%>
		<div class="no-data">
			<i class="fas fa-clipboard-list"></i>
			<p>등록된 공지사항이 없습니다.</p>
		</div>
		<%
		} else {
		%>
		<div class="notice-card">
			<table>
				<thead>
					<tr>
						<th style="width: 50%">제목</th>
						<th class="mobile-hide">작성자</th>
						<th>작성일</th>
						<th style="width: 100px; text-align: center;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Notice notice : notices) {
					%>
					<tr>
						<!-- NoticeMain.jsp의 제목 링크 부분 -->
						<td>
							<div class="notice-title">
								<a
									href="<%=getEnvs%>noticeDetail&id=<%=notice.getNoticeId()%>">
									<%=notice.getNoticeTitle()%>
								</a>
							</div>
						</td>
						<td class="notice-meta mobile-hide"><%=notice.getNoticeAuthor()%></td>
						<td class="notice-meta"><%=notice.getFormattedNoticeCreated()%></td>
						<td>
							<div class="views-count">
								<i class="far fa-eye"></i>
								<%=notice.getNoticeViews()%>
							</div>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>