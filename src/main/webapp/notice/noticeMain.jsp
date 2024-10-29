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
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .no-data {
            text-align: center;
            padding: 20px;
            font-size: 18px;
            color: #888;
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
