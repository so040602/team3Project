<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.team3.model.bean.Review" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    List<Review> reviews = (List<Review>) request.getAttribute("reviews");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 날짜 포맷
    
   
 // 나의 프로젝트(애플리케이션 이름) 이름이며, 컨텍스트 이름이라고 합니다.
 String appName = request.getContextPath();

 // FrontController.java 파일의 url Pattern과 동일해야 합니다.
 // 서블릿 매핑을 위한 문자열 이름입니다.
 String mappingName = "/coolapp";

 // form 태그에서 변수 값 전달
 String postForm = appName + mappingName;

 // get url에서 변수 값 전달
 String getEnvs = appName + mappingName + "?opsmode=";

 // out.println(getEnvs);

    
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>서평 리스트</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        a {
            text-decoration: none;
            color: #007BFF;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>서평 리스트</h1>
    <table>
        <thead>
            <tr>
                <th>서평 번호</th>
                <th>서평 제목</th>
                <th>서평 내용</th>
                <th>조회수</th>
                <th>작성일</th>
                <th>책 제목</th>
                <th>작성자</th>
                <th>상세보기</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (reviews != null && !reviews.isEmpty()) {
                    for (Review review : reviews) {
            %>
                        <tr>
                            <td><%= review.getReviewidx() %></td>
                            <td><a href="reviewDetail.jsp&reviewIdx=<%= review.getReviewidx() %>"><%= review.getReview_title() %></a></td>
                            <td><%= review.getReview_body() %></td>
                            <td><%= review.getReview_cnt() %></td>
                            <td><%= sdf.format(review.getReview_regdate()) %></td> <!-- 포맷팅된 날짜 -->
                            <td><%= review.getBook_name() %></td>
                            <td><%= review.getMemid() %></td>
                            <td><a href="reviewDetail.jsp&reviewIdx=<%= review.getReviewidx() %>">상세보기</a></td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="8">서평이 없습니다.</td>
                    </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
