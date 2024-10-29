<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.team3.model.bean.Notice" %>
<%@ page import="com.team3.model.dao.NoticeDao" %>


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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
body {
    background-color: #f8f9fa;
    font-family: 'Noto Sans KR', sans-serif;
    margin: 0;
    padding: 20px;
}

.container {
    max-width: 1000px;
    background-color: white;
    padding: 40px;
    border-radius: 15px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    margin: 50px auto;
}

h1 {
    color: #333;
    font-weight: bold;
    margin-bottom: 30px;
    padding-bottom: 15px;
    border-bottom: 2px solid #eee;
    text-align: left;
}

table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    margin-top: 20px;
}

th {
    background-color: #f8f9fa;
    color: #495057;
    font-weight: 600;
    padding: 15px;
    border-bottom: 2px solid #dee2e6;
    white-space: nowrap;
}

td {
    padding: 15px;
    border-bottom: 1px solid #dee2e6;
    color: #495057;
    vertical-align: middle;
}

tr:hover {
    background-color: #f8f9fa;
    cursor: pointer;
    transition: background-color 0.2s ease;
}

/* 제목 열 스타일 */
td:first-child {
    color: #007bff;
    font-weight: 500;
}

td:first-child:hover {
    color: #0056b3;
    text-decoration: underline;
}

/* 작성자, 날짜, 조회수 스타일 */
td:not(:first-child) {
    color: #6c757d;
    font-size: 0.95rem;
}

.no-data {
    text-align: center;
    padding: 50px;
    color: #6c757d;
    font-size: 1.1rem;
    background-color: #f8f9fa;
    border-radius: 8px;
    margin: 20px 0;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .container {
        padding: 20px;
        margin: 20px 10px;
        border-radius: 10px;
    }
    
    table {
        display: block;
        overflow-x: auto;
        white-space: nowrap;
    }
    
    th, td {
        padding: 12px 15px;
    }
    
    h1 {
        font-size: 1.5rem;
        margin-bottom: 20px;
    }
}

/* 테이블 헤더 고정 */
thead {
    position: sticky;
    top: 0;
    background-color: #f8f9fa;
    z-index: 1;
}

/* 테이블 행 간격 및 패딩 */
tr {
    transition: all 0.2s ease;
}

th:first-child, td:first-child {
    padding-left: 20px;
}

th:last-child, td:last-child {
    padding-right: 20px;
}

/* 조회수 열 정렬 */
th:last-child, td:last-child {
    text-align: center;
}
</style>
</head>
<body>
    <div class="container">
        <h1>공지사항</h1>

        <%
            NoticeDao dao = new NoticeDao();
            List<Notice> notices = dao.selectAllNotices();

            if (notices.isEmpty()) {
        %>
            <div class="no-data">공지사항이 없습니다.</div>
        <%
            } else {
        %>
            <table>
                <tr>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </tr>
                <%
                for (Notice notice : notices) {
                %>
                    <tr>
                        <td><%= notice.getNoticeTitle() %></td>
                        <td><%= notice.getNoticeAuthor() %></td>
                        <td><%= notice.getFormattedNoticeCreated() %></td>
                        <td><%= notice.getNoticeViews() %></td>
                    </tr>
                <%
                }
                %>
            </table>
        <%
            }
        %>
    </div>
</body>
</html>
