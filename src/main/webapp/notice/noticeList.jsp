<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.team3.model.bean.Notice"%>
<%@ page import="com.team3.model.dao.NoticeDao"%>
<%@ include file="./../common/common.jsp"%>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
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
    --primary-color: #03C75A;  /* 네이버 메인 컬러 */
    --hover-color: #02b350;
    --background-color: #f5f6f8;
    --card-background: #FFFFFF;
    --text-primary: #222222;
    --text-secondary: #666666;
    --border-color: #e5e5e5;
    --success-color: #2ECC71;
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
    max-width: 1000px;
    margin: 0 auto;
    padding: 40px 20px;
}

/* 헤더 스타일 */
.board-header {
    margin-bottom: 30px;
    padding-bottom: 20px;
    border-bottom: 1px solid var(--border-color);
}

h1 {
    font-size: 26px;
    font-weight: 700;
    color: var(--text-primary);
    margin: 0 0 20px 0;
}

.button-group {
    display: flex;
    gap: 10px;
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
    transition: all 0.2s ease;
}

.btn-back {
    background-color: #f8f9fa;
    color: var(--text-primary);
    border: 1px solid #dde0e4;
}

.btn-back:hover {
    background-color: #eceef0;
}

.btn-primary {
    background-color: var(--primary-color);
    color: white;
    border: none;
}

.btn-primary:hover {
    background-color: var(--hover-color);
}

/* 테이블 스타일 */
.notice-card {
    background: var(--card-background);
    border: 1px solid var(--border-color);
    border-radius: 8px;
    overflow: hidden;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background-color: #f9fafb;
    color: var(--text-primary);
    font-weight: 600;
    font-size: 14px;
    padding: 16px;
    text-align: left;
    border-bottom: 1px solid var(--border-color);
}

td {
    padding: 16px;
    border-bottom: 1px solid var(--border-color);
    font-size: 14px;
    color: var(--text-primary);
}

tr:hover {
    background-color: #f8f9fa;
}

.notice-title {
    display: flex;
    align-items: center;
    gap: 8px;
}

.notice-title a {
    color: var(--text-primary);
    text-decoration: none;
    font-weight: 500;
}

.notice-title a:hover {
    color: var(--primary-color);
}

/* 공지사항 중요 표시 (선택적) */
.notice-title.important a {
    color: var(--primary-color);
    font-weight: 600;
}

.notice-title.important::before {
    content: '중요';
    background-color: #ff3b3b;
    color: white;
    padding: 2px 6px;
    border-radius: 4px;
    font-size: 12px;
    font-weight: 500;
}

.notice-meta {
    color: var(--text-secondary);
    font-size: 13px;
}

.views-count {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 4px;
    color: var(--text-secondary);
    font-size: 13px;
}

/* 데이터 없음 상태 */
.no-data {
    padding: 60px 20px;
    text-align: center;
    color: var(--text-secondary);
    background: var(--card-background);
    border: 1px solid var(--border-color);
    border-radius: 8px;
}

.no-data i {
    font-size: 32px;
    color: #ccc;
    margin-bottom: 12px;
}

.no-data p {
    margin: 0;
    font-size: 15px;
}

/* 모바일 대응 */
@media (max-width: 768px) {
    .container {
        padding: 20px 15px;
    }

    h1 {
        font-size: 22px;
    }

    .board-header {
        margin-bottom: 20px;
    }

    th, td {
        padding: 12px;
    }

    .btn {
        padding: 6px 12px;
        font-size: 13px;
    }

    .mobile-hide {
        display: none;
    }

    .notice-title a {
        font-size: 14px;
    }
}
</style>
</head>
<body>
	<div class="container">
		<div class="board-header">
    <h1>공지사항</h1>
    <div class="button-group">
        <a href="<%=getEnvs%>bookMain" class="btn btn-back">
            <i class="fas fa-home"></i> 홈으로
        </a>
        <a href="<%=getEnvs%>noticeInsert" class="btn btn-primary">
            <i class="fas fa-pen"></i> 등록하기
        </a>
    </div>
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
								<a href="<%=getEnvs%>noticeDetail&id=<%=notice.getNoticeId()%>">
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